class Post < ActiveRecord::Base
  attr_accessible :body, :title, :parent_id, :link
  validates_presence_of :title, :body
  validates_format_of :link, :with => URI::regexp, :allow_blank => true,
                      :unless => Proc.new { |post| post.link == "#" }
  
  has_ancestry
  
  def to_s
    title
  end
  
  def to_param
    "#{id}-#{title.parameterize}"
  end
  
  def self.select_options
    self.all.each { |c| c.ancestry = c.ancestry.to_s + (c.ancestry != nil ? "/" : '') + c.id.to_s }
        .sort {|x,y| x.ancestry <=> y.ancestry }
        .map{ |c| ["-" * (c.depth - 1) + c.to_s,c.id]}
        .unshift(["-- raiz --", nil])
  end
  
end
