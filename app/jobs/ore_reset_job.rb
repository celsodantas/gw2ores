class OreResetJob
  extend Jobify

  @queue = :ore_reset

  def self.perform(options = {})
    OreReset.new.reset

    sleep 30

  rescue => e
    Airbrake.notify_or_ignore(e, cgi_data: ENV, error_message: "[OreResetJob] Failed! #{e.message.inspect}")
    raise e
  ensure
    OreResetJob.enqueue
  end
end
