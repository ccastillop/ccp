class Page < ActiveRecord::Base
  attr_accessible :content, :title
  def to_params
    "#{id}-#{title.parameterize}"
  end
end
