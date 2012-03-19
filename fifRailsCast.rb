#  fifRailsCast.rb
#  
#  Copyright 2012 AbdulKarim Memon <abdulkarim@techman>
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#  
#  

require 'rss/1.0'
require 'rss/2.0'
require 'open-uri'


source = "http://feeds.feedburner.com/railscasts"

content = ""

open(source) do |s| 
  content = s.read
end

rss = RSS::Parser.parse(content, false)

#=> Fetching the URL of the media

final_url = rss.items.collect do |item|
  item.enclosure.url['mp4']= 'webm'
  "#{item.enclosure.url}"
end

#p final_url.inspect #=> printing this is only for debugging purpose

final_url.each do |url|
  `wget -c #{url.downcase}`
  url['webm'] = 'zip'
  url['videos'] = 'sources'
  `wget -c #{url.downcase}`
end
