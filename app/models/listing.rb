class Listing < ApplicationRecord
  belongs_to :user
  has_many :users ,through: :reservations
  has_many :reservations
  
    enum verification:[:yes , :no]
    mount_uploaders :images, ImagesUploader




end
