
require "espial/version"
require "espial/errors"
require "espial/apispec"
require "espial/engine"

module Espial

  class Config
    include Singleton
    attr_accessor :specs

    def initialize
      @specs = {}
    end
  end

end
