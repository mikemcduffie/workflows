# encoding: utf-8

# TODO: change icon.png based on which browser is running. Could just include
#       some icons and rename them accordingly.
# TODO: add caching of tabs. Maybe 3 seconds? Actioning a tab will invalidate
#       the cache, as will making a blank search. I kinda just want to be able
#       to type something real quick, press enter, and get the right result.
# TODO: Figure out a better way to handle the AppleScript. I only want to make
#       one `osascript` call, even if multiple browsers are running. I'd still
#       like to have templates if I can, but maybe include them in heredocs in
#       a single file.
# TODO: Only use the URL for the arg. This lets the user QuickLook the page.
#       I might just have the script save the last query to a file, and have
#       the result action read that, search the tabs for the actioned URL, and
#       close/refresh/whatever (the first? all?) instances of that URL. Or
#       maybe it'll just cache all the matched URLs to a file and action those,
#       so it can do everything easily in a single `osascript` call.
# TODO: Remove tab previews, as they don't work correctly with Safari 6.1.
# TODO: Add a way to directly reference a tab. Like 's1:3' for the third tab in
#       the first window of Safari. This can be used to autocomplete a tab
#       (press tab), which can be especially useful if you want to exclude a
#       tab from a batch action (just type a dash before pressing tab).
# TODO: Add a command to save a Markdown-formatted list of tabs, which you
#       can later access and restore.
# TODO: If the query ends with a semicolon, followed by a command, the command
#       will run on every open tab. Ignore the semicolon if this is the case.

require File.expand_path('../alfred', __FILE__)

class Tab < Alfred::FeedbackItem
  # Search anchored to slashes, dashes, periods, and underscores
  def matches_url?(q)
    search_regexp = /[\/\._-]+#{Regexp.escape(q)}/

    (@result[:subtitle] =~ search_regexp) != nil
  end

  # Search anchored to the start of words (including CamelCase)
  def matches_title?(q)
    search_regexp = /(\b|[\/\._-])#{Regexp.escape(q)}/

    @result[:title].downcase =~ search_regexp ||
    # Break CamelCase words into their individual components and search
    @result[:title].gsub(/([a-z\d])([A-Z])/,'\1 \2').downcase =~ search_regexp
  end

  def matches_id?(q)
    q == "#{@result[:browser]}:#{@result[:window_index]}:#{@result[:tab_index]}"
  end

  def matches_query?(q)
    self.matches_url?(q) || self.matches_title?(q) || matches_id?(q)
  end
end

query = ARGV.first.strip.downcase

applescript_dir = "applescripts"

app_names = {
  :chrome => "Google Chrome",
  :canary => "Google Chrome Canary",
  :chromium => "Chromium",
  :safari => "Safari",
  :webkit => "WebKit"
}

safari_based = [:safari, :webkit]
chrome_based = [:chrome, :canary, :chromium]

# Generate applescript for each browser from a template if it hasn't already
# been generated.
templates = {:list_tabs => "", :activate_tab => ""}
app_names.each do |browser, app_name|
  templates.each do |name, data|
    f = "#{applescript_dir}/#{browser}_#{name}.applescript"
    if !File.exist? f
      script = ""
      template = IO.read("#{name}.tmpl.applescript")

      template.gsub!("{APP_NAME}", app_name)
      template.gsub!("{TAB_TITLE}") do
        (safari_based.include? browser) ? "name" : "title"
      end
      template.gsub!("{SELECT_TAB}") do
        if safari_based.include? browser
          "set current tab to tab tabIndex"
        else
          "set active tab index to tabIndex"
        end
      end

      Dir.mkdir("applescripts") if !File.directory? applescript_dir
      File.open(f, "w") { |file| file.write(template) }
    end
  end
end

results = Alfred::Feedback.new

# Hacky way of checking if a browser's running. If so, get list of tabs.
tab_data = {}
processes = `ps ax`

app_names.each do |browser, app_name|
  if processes.include?("#{app_name}.app/Contents/MacOS/#{app_name}") || browser == :webkit && processes.include?("Safari.app/Contents/MacOS/SafariForWebKitDevelopment")
    tabs = `osascript #{applescript_dir}/#{browser}_list_tabs.applescript`
    tabs = tabs.force_encoding('utf-8') if tabs.respond_to?(:force_encoding)
    tab_data[browser] = tabs
  end
end

tab_data.each do |browser, data|
  data.split("\n").each_slice(3) do |lines|
    next if lines.length < 3
    lines.map! { |line| line.strip }

    window_index, tab_index = lines[0].split(":")
    url = lines[1]
    title = lines[2]

    result = Tab.new
    result[:uid] = result[:subtitle] = url
    result[:title] = title

    result[:browser] = browser
    result[:window_index] = window_index
    result[:tab_index] = tab_index

    # TODO: Fix this. Just use the URL to enable copying and QuickLook.
    result[:arg] = "#{browser} #{window_index} #{tab_index}"

    autocomplete_str = "#{browser}:#{window_index}:#{tab_index} "

    if [" ", "-"].include?(query[query.length - 1, 1])
      result[:autocomplete] = "#{query}#{autocomplete_str}"
    else
      result[:autocomplete] = "#{query} #{autocomplete_str}"
    end

    if browser == :webkit
      result[:icon] = "/Applications/Safari.app/Contents/Resources/document.icns"
    else
      result[:icon] = "/Applications/#{app_names[browser]}.app/Contents/Resources/document.icns"
    end

    # Treat semicolons like an OR. This essentially lets us have multiple searches.
    searches = "#{query} ".split(';')
    results << result.to_hash if searches.empty?
    searches.each do |search|
      matches = 0
      # Get the term, and include all tabs if the user typed a dash,
      # so they can see which tabs to exclude
      terms = search.strip.chomp('-').split

      terms.each do |term|
        # Exclude results matching a term that starts with a dash (like a NOT)
        if term[0, 1] == '-'
          term = term[1, term.length]
          if result.matches_query?(term)
            next
          else
            matches += 1
          end
        elsif result.matches_query?(term)
          matches += 1
        end
      end

      # If all terms match and the result hasn't already been included, add it.
      results << result.to_hash if matches == terms.count and !results.items.include?(result.to_hash)
    end
  end
end

puts results