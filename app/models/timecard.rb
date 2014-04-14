class Timecard
  include ActiveModel::Model

  attr_accessor :id, :first_name, :last_name

  validates_presence_of :first_name

  def self.all
    @timecards = []
    @data = JSON.parse(RestClient.get(self._base_url))
    @data.each do |_timecard|
      @timecards << Timecard.new(id: _timecard['_id'], first_name: _timecard['first_name'], last_name: _timecard['last_name'])
    end
    @timecards
  end

  private

    def self._base_url
      Rails.env.production? ? 'http://gameroom.swapzapp.com/api/users/' : 'http://example.swapzapp.dev/api/users/'
    end
end