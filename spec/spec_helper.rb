$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'pathname'
require 'maze_magic'

module MazeMagic
  module Tests
    def self.fixtures
      specs_root.join('fixtures')
    end

    def self.specs_root
      Pathname.new('spec')
    end
  end
end

Dir
  .glob(MazeMagic::Tests.specs_root.join("support/**/*.rb"))
  .each { |f| load f }

