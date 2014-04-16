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
      Rails.env.production? ? 'http://x:ea3d2470e65b0130f5493e1edbff447e@gameroom.swapzapp.com/api/users?clocked_in=true&per_page=100' : 'http://x:8e3949f0a49e013164600c2937e6c8c6@example.swapzapp.dev/api/users?clocked_in=true&per_page=100'
    end
end