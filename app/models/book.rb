class Book < ApplicationRecord
  belongs_to :user
  has_many :book_comments
  has_many :favorites, dependent: :destroy
  has_many :week_favorites, -> { where(created_at: 1.week.ago.beginning_of_day..Time.current.end_of_day) }
  
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  validates :category, presence: true
  
  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
  scope :star_count, -> {order(star: :desc)}
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  def self.search_for(content, method)
    if method == 'perfect'
      Book.where(title: content)
    elsif method == 'forward'
      Book.where('title LIKE ?', content + '%')
    elsif method == 'backward'
      Book.where('title LIKE ?', '%' + content)
    else
      Book.where('title LIKE ?', '%' + content + '%')
    end
  end

end