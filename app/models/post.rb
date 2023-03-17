class Post < ApplicationRecord

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
    validate :clickbait_title
  
    private
  
    def clickbait_title
      clickbait_words = [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i]
      if clickbait_words.none? { |word| word.match(title) }
        errors.add(:title, "must be clickbait-y")
      end
    end

end
