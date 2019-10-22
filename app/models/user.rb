class User < ApplicationRecord
    def update_role
        update_attribute(:role, 0)
    end
end
