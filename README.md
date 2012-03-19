## About this project ##
A collection of scripts that download videos from some of
the popular websites.

The scripts when run, parses the RSS feed from the respective 
website and downloads the videos in the directory where the 
script has been called. 

Duplication of videos being downloaded has been avoided by 
passing the '-c' parameter to 'wget'.

(Sorry for such crappy condition of the code, i'm new to ruby :) )

##Scripts currently available
* fifVimCasts.rb  Fetch It From vimcasts.org
* fifRailsCast.rb Fetch It From railscasts.com

## How to use it ##

Download the fifRC.rb script and cd into the directory.

$ruby fifRailsCast.rb

OR

$ruby fifVimCasts.rb 

voila!!!

## Are there any dependencies? Yes! ##
* ruby
* wget
