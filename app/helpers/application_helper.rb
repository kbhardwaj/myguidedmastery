module ApplicationHelper
	def first_x_words(str,n=20,finish='&hellip;')
	   str.split(' ')[0,n].inject{|sum,word| sum + ' ' + word} + finish
	end

	def youtube_embed(youtube_url)
	  if youtube_url[/youtu\.be\/([^\?]*)/]
	    youtube_id = $1
	  else
	    # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
	    youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
	    youtube_id = $5
	  end
	  if youtube_id == nil
	  	return youtube_id
	  else
	  	%Q{<div class="video-container"><iframe title="YouTube video player" width="100%" height="100%" position="absolute" color="white" src="http://www.youtube.com/embed/#{ youtube_id }" frameborder="0" allowfullscreen></iframe></div>}
	  end
	end
end
