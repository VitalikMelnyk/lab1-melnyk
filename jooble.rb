require 'open-uri'
require 'nokogiri'
require 'json'
require 'csv'
require './joobleItem.rb'

class Jooble

	def initialize(url)
		@url = url
		@joobleList = []
	end

	def getJoobles
		count = 1
		begin
				url = @url
				doc = Nokogiri::HTML(URI.open(@url))
				doc.css('._2caa5').each do |card|
					# puts card
					jooble = JoobleItem.new()
					jobTitle = card.css('._1b9db span').text.strip
					if jobTitle != ""
						# jooble.count = count
						jooble.jobTitle = jobTitle
						jooble.company = card.css('.e2601').text.strip
						jooble.description = card.css('._10840').text.strip
						jooble.salary = card.css('.a7943').text.strip
				 		@joobleList.push(jooble)
						puts jooble
				 		# count = count + 1
					end
				end
			
		rescue OpenURI::HTTPError => e
            puts e.message
        end
	end

	def saveJoobles()
		jooble = []
		CSV.open("./test.csv", "wb") do |csv|
			csv << ["count; jobTitle; company; description; salary;"]
			@joobleList.each do |element|
			csv << [element.jobTitle + "; " + element.company + "; " + element.description+ ";"]
			jooble.push(
			 		# count: element.count,
					jobTitle: element.jobTitle,
			    	company: element.company,
			    	description: element.description,
					salary: element.salary
		 		)
	    	end
	    end
	    puts JSON.pretty_generate(jooble)
	end
end

