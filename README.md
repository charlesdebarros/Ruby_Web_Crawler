### Ruby_Web_Crawler

In order to run the web crawler script:

* Clone this repo
* cd into the repo folder
* create a urls.txt file (the crawler will look for this file name)
  * From terminal, type touch lib/urls.txt
* open the urls.txt file and type the URL you would like to crawler
  * Example: <code>https://github.com</code>
  * If just testing, do not type a URL like <code>www.google.com</code> as it will take time to parse all the URLs found.
  * Save the file
* run the script by typing ''<code>ruby lib/crawler.rb</code>''
* Check the URLs parsed in the lib/ursl.txt file
