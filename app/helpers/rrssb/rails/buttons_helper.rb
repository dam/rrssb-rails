module Rrssb
  module Rails
  	module ButtonsHelper
  	  def rrssb_tag(opts={})
  	  	buttons  = opts[:buttons]  || []
  	  	url      = opts.delete(:url) { '#' }
  	  	contents = opts[:contents] || {}

  	  	html = []
  	  	html << "<ul class='rrssb-buttons clearfix' id='#{opts[:id]}'>"
  	  	buttons.each do |button|	
  	  	  content = contents[button.to_sym]	|| {}
  	  	  html << "<li class='rrssb-#{button.gsub(/[_-]/,'')}'>"
  	  	  html << case button
  	  	    when 'email'
  	  	      label   = content.delete(:label) { button }
  	  	      subject = content.delete(:subject) { nil }
  	  	      cc      = content.delete(:cc) { nil }
  	  	      to      = content.delete(:to) { nil }
  	  	      link_content = "<span class='rrssb-icon'>#{image_tag('mail.min.svg')}</span><span class='rrssb-text'>#{label}</span>"	
  	  	      
  	  	      mail_to(to, link_content.html_safe, subject: subject, cc: cc)
  	  	    else
  	  	      label        = content.delete(:label) { button.humanize }
  	  	      image_name   = "#{button}.min.svg"
  	  	      link_content = "<span class='rrssb-icon'>#{image_tag(image_name)}</span><span class='rrssb-text'>#{label}</span>"	
  	  	      html_options = { 'class' => 'popup' } 	

  	  	      link_to(link_content.html_safe, social_url(button, url, content), html_options)
  	  	  end
  	  	  html << "</li>"	
  	  	end

        html << '</ul>'
  	  	raw html.join("\n")
  	  end

      # cf. https://github.com/huacnlee/social-share-button
  	  def social_url(button, url, opts={})
  	  	case button
  	  	when 'facebook' then "https://www.facebook.com/sharer/sharer.php?u=#{url}"
  	    when 'twitter'
  	      via  = opts.delete(:via) { nil }
  	      text = opts.delete(:text) { '' }
  	      "https://twitter.com/intent/tweet?url=#{url}&text=#{text}&via=#{via}"
  	    when 'google_plus' then "https://plus.google.com/share?url=#{url}"
  	  	else url
  	  	end
  	  end
  	end
  end
end