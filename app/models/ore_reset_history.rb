class OreResetHistory < ActiveRecord::Base
  attr_accessible :full_response, :new_version

  after_create :cap_table_size

  def cap_table_size
    if OreResetHistory.count > 500
      OreResetHistory.first.destroy
    end
  end
end
