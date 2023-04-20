class Pokemon < ApplicationRecord
    validates :name, presence: true
    validates :pokemon_type, presence: true
    validates :level, numericality: { only_integer: true, greater_than: 0 }
    def sprites
        self[:sprites] ||= {}
      end
    def max_health
      level * 10
    end
  
    def current_health
      max_health - damage_taken
    end
  end
