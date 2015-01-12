class UserPage < ActiveRecord::Base
  validates :page_id, :user_id, presence: true
  belongs_to :user
  belongs_to :page
end
