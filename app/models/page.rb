class Page < ActiveRecord::Base
  has_one  :challenge
  belongs_to :next_page, class_name: 'Page'
  has_many    :prev_pages, class_name: 'Page', foreign_key: 'next_page_id'
  has_many :success_routes, class_name: 'Challenge', foreign_key: 'success_page_id'
  has_many :fail_routes, class_name: 'Challenge', foreign_key: 'fail_page_id'
  has_many :user_pages

  def has_challenge?
    !!challenge
  end

  def user_prev_page(user)
    sequence = user.read_pages
    i = sequence.index(self)
    if i>0
      sequence[i-1]
    else
      sequence[i]
    end
  end

  def next_in_backlog(user)
    sequence = user.read_pages
    i = sequence.index(self)
    sequence[i+1]
  end

  def leads_somewhere?
    has_challenge? || next_page != nil
  end
end
