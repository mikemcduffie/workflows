require "rexml/document"
require 'alfred/feedback/item'
require 'alfred/feedback/file_item'

module Alfred

  class Feedback
    attr_accessor :items

    def initialize
      @items = []
    end

    def add_item(opts = {})
      raise ArgumentError, "Feedback item must have title!" if opts[:title].nil?
      @items << Item.new(opts[:title], opts)
    end

    def add_file_item(path, opts = {})
      @items << FileItem.new(path, opts)
    end

    def to_xml(with_query = '', items = @items)
      document = REXML::Element.new("items")
      if with_query.empty?
        items.each do |item|
          document << item.to_xml
        end
      else
        items.each do |item|
          document << item.to_xml if item.match?(with_query)
        end
      end
      document.to_s
    end

    alias_method :to_alfred, :to_xml



    # serialize
    def dump(to_file)
      File.open(to_file, "wb") { |f| Marshal.dump(@items, f) }
    end

    def load(from_file)
      @items = File.open(from_file, "rb") { |f| Marshal.load(f) }
    end
  end


  class CachedFeedback < Feedback
    def initialize(alfred, &blk)
      super()
      @core = alfred

      instance_eval(&blk) if block_given?
    end

    def use_cache_file(opts = {})
      @cf_file = opts[:file] if opts[:file]
      @cf_file_valid_time = opts[:expire] if opts[:expire]
    end

    def cache_file
      @cf_file ||= File.join(@core.volatile_storage_path, "cached_feedback")
    end
    def get_cached_feedback
      return nil unless File.exist?(cache_file)
      if @cf_file_valid_time
        return nil if Time.now - File.ctime(cache_file) > @cf_file_valid_time
      end
      load(@cf_file)
      return self
    end

    def put_cached_feedback
      dump(cache_file)
    end
  end

end
