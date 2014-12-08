
require "espial/version"
require "espial/errors"
require "espial/engine"
require "espial/specs"

module Espial

  class Config
    include Singleton
    attr_accessor :specs

    def initialize
      @specs = {}
    end
  end

end
