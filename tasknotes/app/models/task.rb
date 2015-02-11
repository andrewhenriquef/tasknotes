class Task < ActiveRecord::Base
    has_many :notes
    
    validates :activity , presence:true
    
end
