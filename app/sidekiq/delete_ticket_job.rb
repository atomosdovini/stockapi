class DeleteTicketJob
  include Sidekiq::Job

  def perform(*args)
    # Do something
  end
end
