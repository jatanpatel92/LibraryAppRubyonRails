class Book < ActiveRecord::Base
    validates :title, presence: true
    validates :isbn, uniqueness: true, length: {is:10}
end
