require "rexml/document"
require "alfred/feedback/item"

module Alfred
  class Feedback
    class FileItem < Item

      def initialize(path, opts = {})
        if opts[:title]
          @title = opts[:title]
        elsif ['.ennote', '.webbookmark'].include? File.extname(path)
          @title = %x{mdls -name kMDItemDisplayName -raw '#{path}'}
        else
          @title = File.basename(path)
        end
        @subtitle = path
        @uid = path
        @arg = path
        @icon = {:type => "fileicon", :name => path}
        @valid = 'yes'
        @autocomplete = @title
        @type = 'file'

        super @title, opts
      end

      def match?(query)
        all_title_match?(query)
      end

    end
  end
end

