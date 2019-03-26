## Ruby_Web_Crawler

### Technologies used

* **[Ruby](https://www.ruby-lang.org/en/downloads/)** 2.3.1
* **[Mechanize](https://github.com/sparklemotion/mechanize)** (gem) 2.7.5

  * If the Mechanize gem is not installed, please install it by running <code>gem install mechanize</code>

In order to run the web crawler script:

* Clone this repo
* cd into the repo folder
* run <code>bundle install</code>
* create a urls.txt file (the crawler will look for this file name)
  * From terminal, type touch lib/urls.txt
* open the urls.txt file and type the URL you would like to crawler
  * Example: <code>https://github.com</code>
  * If just testing, do not type a URL like <code>www.google.com</code> as it will take time to parse all the URLs found.
  * Save the file
* run the script by typing ''<code>ruby lib/crawler.rb</code>''
* Check the URLs parsed in the lib/ursl.txt file

### TODO

* Refactor script
  * Break down crawl method.
  * Make script create a file to store URLs if file does not exist
  * Ask for user to input site to be crawled instead of having to edit the urls.txt file
