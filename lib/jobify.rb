module Jobify
  def enqueue(*param)
    Resque.enqueue(self, *param)
  end
end