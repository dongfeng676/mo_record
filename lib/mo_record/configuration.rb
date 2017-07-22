module MoRecord
  module Configuration
    attr_accessor :version

    def version 
      @version || 5
    end
  end
end
