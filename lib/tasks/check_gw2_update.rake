require 'ore_reset'

namespace :reset do
  task :ores => :environment do
    OreReset.new.reset
  end
end

