class Contact < ApplicationRecord
    validates :email, presence: true
    validates :name, presence: true
    validates :content, presence: true
    after_create :contact_request

    def contact_request
        AdminMailer.contact_email(self).deliver_now
    end
end
