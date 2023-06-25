class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :clickbait

    def clickbait
        return unless title.present?

        unless title.include?("Won't Believe") || title.include?("Secret") || title.include?("Guess") || title.match?(/\bTop \d+\b/)
            errors.add(:title, "Not clickbait-y enough")
        end
    end

end
