# encoding: utf-8

module Alfred
  class Feedback
    require "rexml/document"

    attr_accessor :items

    def initialize(opts = {})
      @items = []
      @doc = REXML::Document.new
      @doc << REXML::XMLDecl.new
      @el = @doc.add_element "items"
      @knowledge = opts[:knowledge] ||= true
    end

    def add(item)
      @items << item
    end

    # maybe just add a to_arr (or whatever it is) method to return @items, or
    # just set up an items method for this. Then we can just call methods like
    # include? on that.
    def include?(item)
      @items.include?(item)
    end

    def add_item_to_xml(title, opts = {})
      item = @el.add_element "item"

      opts = title if title.is_a? Hash
      opts[:icon] ||= "icon.png"
      opts[:title] ||= title

      attrs = [:uid, :arg, :valid, :autocomplete]

      if opts[:valid]
        opts[:valid] = "yes"
      elsif opts[:valid] == false
        opts[:valid] = "no"
      end

      item.attributes["arg"] = opts[:arg]
      item.attributes["valid"] = opts[:valid]
      item.attributes["autocomplete"] = opts[:autocomplete]

      unless @knowledge
        item.attributes["uid"] = opts[:uid]
      end
      
      opts.each_pair do |key, value|
        unless attrs.include?(key)
          el = item.add_element key.to_s
          if key == :icon and value.is_a? Hash
            el.text = value[:value]
            el.attributes["type"] = value[:type]
          else
            el.text = value
          end
        end
      end
    end
    
    alias << add
    
    def to_s
      @items.each do |item|
        self.add_item_to_xml(item)
      end
      @doc.to_s
    end
  end

  class FeedbackItem
    def initialize
      @result = {}
    end

    def matches_query?(query)
      search = query.downcase
      search.empty? or @result[:title].downcase.include? query
    end

    def []=(key, value)
      @result[key] = value
    end

    def [](key)
      @result[key]
    end

    def to_hash
      @result
    end
  end
end