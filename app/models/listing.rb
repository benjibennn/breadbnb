class Listing < ApplicationRecord
  belongs_to :user
  has_many :users ,through: :reservations
  has_many :reservations
  enum verification:[:yes , :no]
  mount_uploaders :images, ImagesUploader
  
  scope :property_type, -> (property_type) { where property_type: property_type }
  scope :state, -> (state) { where state: state }
  scope :starts_with, -> (name) { where("name like ?", "#{name}%")}



end
