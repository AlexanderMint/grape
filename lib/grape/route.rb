module Grape

  # A compiled route for inspection.
  class Route
  
    def initialize(options = {})
      @options = options || {}
    end
    
    def method_missing(method_id, *arguments)
      if match = /route_([_a-zA-Z]\w*)/.match(method_id.to_s)
        @options[match.captures.last.to_sym]
      else
        super
      end
    end
    
    def to_s
      "Version: #{route_version} #{route_method} #{route_path}"
    end
    
  end
end
