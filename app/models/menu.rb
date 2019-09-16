class Menu < ApplicationRecord
  belongs_to :user
  validates :menu1, presence: true
  validates :menu2, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :user_id, presence: true
  validates :time, :uniqueness => {:scope => :date, message:  "登録されています"}
end
