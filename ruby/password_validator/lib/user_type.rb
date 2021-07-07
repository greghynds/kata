class UserType
    def self.from(admin)
        admin ? :admin_user : :regular_user
    end
end