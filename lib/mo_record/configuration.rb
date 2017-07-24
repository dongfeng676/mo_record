module MoRecord
  module Configuration
    attr_accessor :version_count

    def version_count 
      @version || 5
    end
  end
end
