class Project < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :developers
  def self.search(search)
    # Title is for the above case, the OP incorrectly had 'name'
    where("title || description LIKE ?", "%#{search}%")
    #where("description LIKE ?", "%#{search}%")
  end
end
