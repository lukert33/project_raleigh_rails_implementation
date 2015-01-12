class Challenge < ActiveRecord::Base
  belongs_to :page
  belongs_to :success_page, class_name: 'Page'
  belongs_to :fail_page, class_name: 'Page'
  has_many   :user_challenges
  has_many   :users, through: :user_challenges

  def fail_next_id
    fail_page_id
  end

  def success_next_id
    success_page_id
  end
end
