# coding: utf-8
module ApplicationHelper
    def title (page_title = ENV["SEO_TITLE"])
      content_for(:head) { 
        content_tag(:title, [page_title, ENV["SEO_TITLE"]].compact.join(" | "))
      }
    end

    def description( d= ENV["SEO_DESCRIPTION"])
      content_for(:head) {
        tag(:meta, :name => "description", :content=>d )
      }
    end

    def stylesheet(*args)
      content_for(:head) { stylesheet_link_tag(*args) }
    end

    def javascript(*args)
      content_for(:head) { javascript_include_tag(*args) }
    end

    def tick(bool, msg_t=nil, msg_f=nil, title=nil)
      if bool
        content_tag(:span,:class=>"label label-success",:title=>title, style:"cursor: default;") do
          [content_tag(:i, nil, :class=>"icon icon-ok"), msg_t].compact.join(" ").html_safe
        end
      else
        content_tag(:span,:class=>"label label-important",:title=>title, style:"cursor: default;") do
          [content_tag(:i, nil, :class=>"icon icon-remove"), msg_f].compact.join(" ").html_safe
        end
      end
    end
    
    def truncate_words(text = "-", options={})
      defaults = {length: 32, link: nil, end_string:' ... '}
      
      options = defaults.merge options
      length = options[:length]
      end_string = options[:end_string]
      link = options[:link]
      
      text ||= ""
      #text = Sanitize.clean(text)
      text = strip_tags(text)
      text = text.gsub("&nbsp;"," ")
      text = text.gsub("&#13;"," ")
      words = text.split()
      words << link if link
      words = words[0..(length-1)].join(' ') + (words.count > length ? end_string : '')
      words = words.try(:html_safe)
    end

    def icon_boolean(element=false)
      txt = ""
      clase = ""
      element ? clase="icon-ok" : clase="icon-remove"
      txt << "<i class='#{clase}'></i>"
      txt.html_safe
    end
    
end
