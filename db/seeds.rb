# This is where you can create initial data for your app.
# require 'faker'

# puts "Start of your seed"
# Restaurant.destroy_all

# 50.times do |index|
#   puts 'Creating restaurants...'
#   new_resto = Restaurant.new(
#     name: Faker::Restaurant.name,
#     rating: rand(0..5),
#     chef_name: Faker::TvShows::GameOfThrones.character
#   )
#   new_resto.save # ! = check if saving works or not
# end

# scrape from imdb, get top 5 movies

# task 1 
# write the pseudocode
# get the selectors
# lister-list -> titleColumn -> a -> href

require 'open-uri'
require 'nokogiri'

Movie.destroy_all

def get_top_movies
  url = "https://www.imdb.com/chart/top"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  urls = []

  html_doc.search('.titleColumn a').take(5).each do |element|
    imdb_url = element.attribute('href').value
    # puts imdb_url
    urls << imdb_url
  end
  return urls
end

def get_movie_data(url)
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

  # title + year
  titlenyear = html_doc.search('.title_wrapper h1').text.strip
  match_data = titlenyear.match(/(?<movie_name>\w.*\w).\((?<movie_year>\d{4})\)/)
  title = match_data[:movie_name]
  year = match_data[:movie_year]

  # plot_summary -> summary_text
  summary = html_doc.search('.summary_text').text.strip

  # director
  director = html_doc.search('.credit_summary_item a').first.text.strip

  new_movie = Movie.new(
    title: title,
    year: year,
    summary: summary,
    director: director
  )

  new_movie.save
end

get_top_movies.each do |url|
  get_movie_data('http://imdb.com' + url)
  puts "Save to DB" 
end