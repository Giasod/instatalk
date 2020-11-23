class User < ApplicationRecord
  before_create :generate_nickname

  def generate_nickname
    self.nickname = Faker::Name.first_name.downcase
  end

  def online?
    !Redis.new.get("№#{id}").nil?
  end
end
