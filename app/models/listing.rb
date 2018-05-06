class Listing < ApplicationRecord
  belongs_to :user
  has_many :users ,through: :reservations
  has_many :reservations, :dependent => :destroy
  
    enum verification:[:yes , :no]
    mount_uploaders :images, ImagesUploader




end
