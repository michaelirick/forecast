module Services
  class Base
    attr_accessor :params

    def initialize(params = {})
      @params = params
    end

    def run
    end
  end
end