# Copyright Vespa.ai. All rights reserved

require 'json'
require 'nokogiri'
require 'kramdown/parser/kramdown'

module Jekyll

    class VespaIndexGenerator < Jekyll::Generator
        priority :lowest

        def generate(site)
            namespace = site.config["search"]["namespace"]
            operations = []
            site.pages.each do |page|
                next if page.path.start_with?("css/") ||
                        page.url.start_with?("/redirects.json")
                if page.data["index"] == true
                    operations.push({
                        :fields => {
                            :path => page.url,
                            :namespace => namespace,
                            :title => page.data["title"],
                            :content => extract_text(page)
                        }
                    })
                end
            end

            json = JSON.pretty_generate(operations)
            File.open(namespace + "_index.json", "w") { |f| f.write(json) }
        end

        def extract_text(page)
            ext = page.name[page.name.rindex('.')+1..-1]
            if ext == "md"
                input = Kramdown::Document.new(page.content).to_html
            else
                input = page.content
            end
            doc = Nokogiri::HTML(input)
            doc.search('th,td').each{ |e| e.after "\n" }
            doc.search('style').each{ |e| e.remove }
            content = doc.xpath("//text()").to_s
            return strip_liquid(content.gsub("\r"," ").gsub("\n"," "))
        end

        def strip_liquid(text)
            return text.gsub(/\{%\s*include\s*(deprecated|important|note|query|warning).html\s*content=\s*(\"|\p{Pi}|\p{Pf}|')/, "")
                       .gsub(/\{%\s*highlight\s*\w*/, "")
                       .gsub(/\{%\s*endhighlight/, "")
                       .gsub(/\{%\s*(raw|endraw)/, "")
                       .gsub(/(\"|\p{Pi}|\p{Pf}|')*\s*%}/, "")
        end

    end

end
