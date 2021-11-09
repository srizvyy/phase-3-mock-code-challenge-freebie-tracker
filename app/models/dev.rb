class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        self.freebies.find_by(item_name: item_name) ? true : false
    end

    def give_away(dev, freebie)
        freebie.update(dev: dev) unless freebie != self
    end
end
