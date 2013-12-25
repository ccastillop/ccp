# encoding: utf-8
module PostsHelper
  def link_to_post(post)
    if post.link.present?
      link_to post, post.link, target:(post.link == "#" ? nil : "_blank")
    else
      link_to post, post
    end
  end
end
