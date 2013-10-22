class Card < ActiveRecord::Base
  attr_accessible :uploads_attributes
  has_many :uploads, :as => :uploadable, :dependent => :destroy
  accepts_nested_attributes_for :uploads, :allow_destroy => true
end
