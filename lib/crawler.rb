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

  public

  def crawl
    links_found = 0
    agent = Mechanize.new

    agent.agent.http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    fetched_urls = fetch_database_urls
    fetched_urls.each do |url_to_crawl|
      begin
      page = agent.get(url_to_crawl)
      links = page.links
      links.each do |link|
        scraped_url = link.attributes['href']
        next if scraped_url == '#'
        case scraped_url[0..4]
        when 'https' || 'http:' || 'ftp:/'
          save_site_crawl(scraped_url)
          puts "Chacked: #{scraped_url}\n--------------------\n"
        else
          url_split = url_to_crawl.split('/')
          if scraped_url[0] == '/'
            final_url = url_split[0] + '//' + url_split[2] + scraped_url
          else
            final_url = url_split[0] + '//' + url_split[2] + '/' + scraped_url
          end
          save_site_crawl(final_url)
          puts "Checked: #{final_url}\n--------------------\n"
        end
        links_found += 1
      end
    rescue StandardError => get_message
        puts "Request Level Error: #{get_message}"
      end
    end
    puts "Status update: #{links_found} links found."
  end
end

crawler = WebCrawler.new('./lib/urls.txt')
crawler.crawl
