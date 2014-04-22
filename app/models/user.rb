class User
  include ActiveModel::Model

  attr_accessor "first_name", "last_name"

  validates_presence_of "first_name", "last_name"

  def self.all_in
    @users = []
    @data = JSON.parse(RestClient.get(self._base_url_in))
    @data['users'].each do |_user|
      @users << User.new(first_name: _user['first_name'], last_name: _user['last_name'])
    end
    @users
  end

  def self.all_out
    @users = []
    @data = JSON.parse(RestClient.get(self._base_url_out))
    @data['users'].each do |_user|
      @users << User.new(first_name: _user['first_name'], last_name: _user['last_name'])
    end
    @users
  end
  private

    def self._base_url_in
      @key = ENV['PASSWORD']
      Rails.env.production? ? "http://x:#{@key}@gameroom.swapzapp.com/api/users?clocked_in=true&per_page=0" : "http://x:#{@key}@example.swapzapp.dev/api/users?clocked_in=true&per_page=0"
    end

    def self._base_url_out
      @key = ENV['PASSWORD']
      Rails.env.production? ? "http://x:#{@key}@gameroom.swapzapp.com/api/users?clocked_out=true&per_page=0" : "http://x:#{@key}@example.swapzapp.dev/api/users?clocked_out=true&per_page=0"
    end
end