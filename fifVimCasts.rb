#  fifVimCasts.rb
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


source = "http://vimcasts.org/feeds/ogg"

content = ""

open(source) do |s| 
  content = s.read
end

rss = RSS::Parser.parse(content, false)

name=[]
0.upto(rss.items.count-1) { |f| name.push(rss.items[f].enclosure) }

name = name.compact

name.each do |url|
  url = url.url.gsub("?referrer=rss","")
  #puts url
  `wget -c #{url}`
end
