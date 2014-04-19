class Timecard
  include ActiveModel::Model

  attr_accessor "first_name", "last_name"

  validates_presence_of "first_name", "last_name"

  def self.all
    @timecards = []
    @data = JSON.parse(RestClient.get(self._base_url))
    @data['users'].each do |_timecard|
      @timecards << Timecard.new(first_name: _timecard['first_name'], last_name: _timecard['last_name'])
    end
    @timecards
  end
  private

    def self._base_url
      @key = ENV['PASSWORD']
      Rails.env.production? ? "http://x:#{@key}@gameroom.swapzapp.com/api/users?clocked_in=true&per_page=0" : "http://x:#{@key}@example.swapzapp.dev/api/users?clocked_in=true&per_page=0"
    end
end