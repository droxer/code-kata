class HtmlParser
  HTML_Tags = ['table', 'tr', 'td', 'a']

  class << self
    
    def locate_specific_table(original_html)
      remove_escapes(original_html).scan /<table.*?><thead>.*?<\/thead>(.*?)<\/table>/
    end
    
    HtmlParser::HTML_Tags.each do |tag|
      define_method "extract_#{tag}" do |params|
        remove_escapes(params).scan Regexp.new("<#{tag}.*?>(.*?)<\/#{tag}>")
      end
    end

    def extract_content_from_td(html_tag)
      content = remove_escapes(html_tag)
      HtmlParser::HTML_Tags.each do |name|
        content.gsub!(Regexp.new("(<#{name}.*?>|<\/#{name}>|\s*)"), '')
      end
      content
    end
    
    private
    def remove_escapes(original_html)
      original_html.gsub(/(\n|\t|\r|&nbsp;)/, '')
    end
  end  
end