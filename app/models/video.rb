class Video < ActiveRecord::Base

  attr_accessible :video
  attr_accessor :video_file_name, :video_content_type
  belongs_to :user
  
  has_attached_file :video
  
  validates :video, :attachment_presence => true,
    :attachment_content_type => { :content_type => 'video/mp4' },
    :if => :is_type_of_video?


  protected
  
  def is_type_of_video?
    video.content_type =~ %r(video)
  end

end
