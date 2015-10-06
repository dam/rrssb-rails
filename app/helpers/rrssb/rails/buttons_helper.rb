module Rrssb
  module Rails
  	module ButtonsHelper
  	  def rrssb_tag(opts={})
  	  	buttons  = opts[:buttons]  || []
  	  	contents = opts[:contents] || {}

  	  	html = []
  	  	html << "<ul class='rrssb-buttons clearfix' id='#{opts[:id]}'>"
  	  	buttons.each do |button|	
  	  	  content = contents[button.to_sym]	|| {}
  	  	  html << "<li class='rrssb-#{button.gsub(/[_-]/,'')}'>"
  	  	  html << case button
  	  	    when 'email'
  	  	      label   = content[:label] || button
  	  	      subject = content[:subject]
  	  	      cc      = content[:cc]
  	  	      to      = content[:to]
  	  	      link_content = "<span class='rrssb-icon'>#{image_tag('mail.min.svg')}</span><span class='rrssb-text'>#{label}</span>"	
  	  	      
  	  	      mail_to(to, link_content.html_safe, subject: subject, cc: cc)
  	  	    else
  	  	      label        = content[:label] || (button == 'hackernews' ? 'hacker news' : button.humanize)
  	  	      image_name   = "#{button}.min.svg"
  	  	      link_content = "<span class='rrssb-icon'>#{image_tag(image_name)}</span><span class='rrssb-text'>#{label}</span>"	
  	  	      html_options = button == 'github' ? {} : { 'class' => 'popup' } 	

  	  	      link_to(link_content.html_safe, social_url(button, content, opts), html_options)
  	  	  end
  	  	  html << "</li>"	
  	  	end

        html << '</ul>'
  	  	raw html.join("\n")
  	  end

  	  def social_url(button, content, opts={})
  	  	title = opts[:title] || ''
  	  	url   = opts[:url] || '#'
        img   = content[:img] || ''
   
  	  	case button
  	  	when 'delicious'   then "https://www.delicious.com/save?v=5&url=#{url}&title=#{title}&jump=yes"
  	  	when 'facebook'    then "https://www.facebook.com/sharer/sharer.php?u=#{url}"
  	    when 'github'      then url 
        when 'google_plus' then "https://plus.google.com/share?url=#{url}"
  	    when 'hackernews'  then "https://news.ycombinator.com/submitlink?u=#{url}&t=#{title}"
        when 'pinterest'   then "https://www.pinterest.com/pin/create/button/?url=#{url}&media=#{img}&description=#{title}"
        when 'twitter'     then "https://twitter.com/intent/tweet?url=#{url}&text=#{content[:text]}&via=#{content[:via]}"
  	  	else image_path('rrssb-rails-404.png')
  	  	end
  	  end
  	end
  end
end