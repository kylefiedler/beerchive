class Beer < ActiveRecord::Base
  belongs_to :user
  validates :name, :presence => true

  has_attached_file :photo, :styles => { :medium => "325x250#" }
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
