require 'mechanize'

# WebCrawler class
class WebCrawler
  def initialize(file_name)
    @file = file_name
  end

  private

  def save_site_crawl(site_url)
    begin
      if check(site_url)
        File.open(@file, 'a') do |data|
          data.puts site_url
        end
      end
    rescue StandardError => error_message
      puts "ERROR: #{error_message}"
    end
  end

  def check(url)
    data = File.read(@file)
    urls = data.split
    return true unless urls.include? url
  end

  def fetch_database_urls
    active_urls = File.read(@file)
    urls = active_urls.split
    return urls
  end
end
