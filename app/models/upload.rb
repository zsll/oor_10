class Upload < ActiveRecord::Base
  belongs_to :uploadable, :polymorphic => true
  has_attached_file :pic, :styles => { :small => "100x100#", :large => "500x500>" }, :processors => [:cropper]
  validates_attachment_content_type :pic, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  attr_accessible :uploadable_id, :uploadable_type, :pic, :crop_x, :crop_y, :crop_w, :crop_h
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  
  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end
  
  def pic_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(pic.path(style))
  end
  
  def reprocess_pic
    pic.reprocess!
  end
end
