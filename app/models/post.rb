class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }

    validate :clibait

    CLIBAIT = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i
    ]
    def clibait

        if CLIBAIT.none? { |bait| bait.match title }
            errors.add(:title, "Your title needs to be more clibait-y")
        end

    end
end
