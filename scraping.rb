require 'watir'
require 'webdrivers'
require 'nokogiri'

# esta URL quebrou em minha máquina
# https://www.apontador.com.br/local/animais

# escrevi o "web scraping" usando uma genérica:
# https://www.apontador.com.br/local/search.html?q=&loc=

def web_scraping_into_apontador(addr)
    browser = Watir::Browser.new
    # tendo a url rodando normalmente, aqui está o valor
    browser.goto(addr)

    parsed_page = Nokogiri::HTML(browser.html)
    section = parsed_page.css('.component .right .title a')

    establishments = []

    section.each do |v|
        v = v.to_s.split('>')[1]
        establishments << v[0..v.length - 4]
    end

    establishments.sort!

    puts establishments

    browser.close
rescue
    raise "We get an error"
end

web_scraping_into_apontador('https://www.apontador.com.br/local/animais')
# web_scraping_into_apontador('https://www.apontador.com.br/local/search.html?q=&loc=')
