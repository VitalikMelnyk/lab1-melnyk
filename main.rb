require './jooble.rb'

url = 'https://ua.jooble.org/SearchResult?date=3'

jooble = Jooble.new(url)
jooble.getJoobles()
jooble.saveJoobles()
