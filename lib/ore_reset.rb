class OreReset

  def initialize
    gw2_md5 = ENV['GW2_MD5']
    @curl_command = "curl assetcdn.101.arenanetworks.com/latest/101 -H 'Cookie: authCookie=access=/latest/*!/manifest/program/*!/program/*~md5=#{gw2_md5}' "
    @patch_index  = 1
  end

  def reset 
    log "checking for update"
    response = check_update

    if response.strip.empty? or response.include? "DOCTYPE" or response.include? "Access Denied"
      log response
      log "###### - Empty or Invalid server response! Going to interaction!"
      return
    end

    if new_version?(response, OreResetHistory.last.full_response)
      OreResetHistory.create(:full_response => response, :new_version => true)
      reset_maps
    else
      log "not new version. Just logging response: #{response}"
      OreResetHistory.create(:full_response => response)
    end
  end

  def log_title(txt)
    log("

        ####################
        #{txt}
        ####################
    ")
  end

  def check_update
    log "contacting arenanet"
    `#{@curl_command}`
  end

  def new_version?(now, prev)
    get_patch(now) > get_patch(prev)
  end

  def get_patch(value)
    value.split(" ")[@patch_index].to_i
  end

  def reset_maps
    log "reseting ores"

    OreNode.destroy_all
    ResetDate.create!
  end

  def log(text)
    puts "[RESET ORES] #{text}"
  end
end