class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  # The 5 most recent comments for a given post

  after_save :update_posts_count

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  
  validates :title, presence: true
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Updates the post counter for a post

  private 

  def update_posts_count
    author.increment!(:posts_counter)
  end

end
