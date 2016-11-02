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
end
