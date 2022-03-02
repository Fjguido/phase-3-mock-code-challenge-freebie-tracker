class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        !! self.freebie.find_by(item_name: item_name)
    end

    def give_away(dev, freebie)
        self.freebies.update(dev_id: dev.id) unless freebie.dev != self
        "not yours"
    end


end
