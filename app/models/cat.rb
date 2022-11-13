# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
    CAT_COLORS = ['calico', 'russian_blue', 'tabby', 'tuxedo', 'ginger', 'bengal', 'gray', 'white', 'black']
    
    validates :birth_date, presence: true
    validate :birth_date_cannot_be_future
    validates :name, presence: true
    validates :sex, presence: true
    validates :sex, inclusion: { in: %w(M F) }
    validates :color, presence: true
    validates :color, inclusion: { in: CAT_COLORS }

    def birth_date_cannot_be_future
        if birth_date.present? && birth_date > Date.today
            errors.add(:birth_date, "can't be in the future")
        end
    end

    def age
        age = time_ago_in_words(Date.now - :birth_date.years, include_days: true)
    end

end
