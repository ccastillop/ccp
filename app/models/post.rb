class Post < ActiveRecord::Base
  attr_accessible :body, :title
  validates_presence_of :title, :body
  
  def to_s
    title
  end
  
  def to_param
    "#{id}-#{title.parameterize}"
  end
  
end
