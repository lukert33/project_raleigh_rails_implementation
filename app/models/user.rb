class User < ActiveRecord::Base
  validates :username, :password, presence: true
  validates_uniqueness_of :username
  validates_uniqueness_of :email
  has_secure_password
  after_create :set_page_one
  has_many :user_challenges
  has_many :challenges, through: :user_challenges
  has_many :user_pages
  has_many :read_pages, through: :user_pages, source: :page

  def set_page_one
    uid = self.id
    UserPage.create(user_id: uid, page_id: 1)
  end

  def farthest_page
    self.read_pages.last
  end

  def return_errors
    if self.errors.messages[:email]
      err = self.errors.messages[:email].first
      return "email error: #{err.capitalize}"
    elsif self.errors.messages[:username]
      err = self.errors.messages[:username].first
      return "username error: #{err.capitalize}"
    elsif self.errors.messages[:password]
      err = self.errors.messages[:password].first
      return "password error: #{err.capitalize}"
    elsif self.errors.messages[:password_confirmation]
      err = self.errors.messages[:password_confirmation].first
      return "password confirmation error: #{err.capitalize}"
    else
      return nil
    end
  end
end
