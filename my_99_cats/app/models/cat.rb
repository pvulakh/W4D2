require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    COLORS = ['green', 'calico', 'tabby', 'nightblack', 'moonwhite']

    validates :color, :birth_date, :description, :name, :sex, presence: true
    validates :color, inclusion: { in: COLORS }
    validates :sex, inclusion: { in: ['M', 'F'] }

    def age 
        time_ago_in_words(self.birth_date)
    end 

end 