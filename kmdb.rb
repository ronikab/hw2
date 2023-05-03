# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.
# TODO!

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!


# puts "There are #{Studio.all.count} studios"
new_studio= Studio.new
# puts new_studio.inspect
new_studio["name"]="Warner Bros."
new_studio.save #insert into the table
puts new_studio.inspect

WarnerBros = Studio.find_by({"name" => "Warner Bros."})

# --------------------------------------------------------------------------#
# --------------------------------------------------------------------------#
# --------------------------------------------------------------------------#

movie1= Movie.new
movie1["title"]="Batman Begins"
movie1["year_released"]=2005
movie1["rated"]="PG-13"
movie1["studio_id"] = WarnerBros["id"]
movie1.save #insert into the table

batman_begins = Movie.find_by({"title" => "Batman Begins"})

movie2=Movie.new
movie2["title"]="The Dark Knight"
movie2["year_released"]=2008
movie2["rated"]="PG-13"
movie2["studio_id"] = WarnerBros["id"]
movie2.save #insert into the table

darkknight = Movie.find_by({"title" => "The Dark Knight"})

movie3=Movie.new
movie3["title"]="The Dark Knight Rises"
movie3["year_released"]=2012
movie3["rated"]="PG-13" 
movie3["studio_id"] = WarnerBros["id"]
movie3.save #insert into the table

dkr = Movie.find_by({"title" => "The Dark Knight Rises"})

puts "There are #{Movie.all.count} movies"

all_movies = Movie.all
puts all_movies.inspect

# --------------------------------------------------------------------------#
# --------------------------------------------------------------------------#
# --------------------------------------------------------------------------#

actor1 = Actor.new
actor1["name"]="Christian Bale"
actor1.save

actor2 = Actor.new
actor2["name"]="Michael Caine"
actor2.save

actor3 = Actor.new
actor3["name"]="Liam Neeson"
actor3.save

actor4 = Actor.new
actor4["name"]="Katie Holmes"
actor4.save

actor5 = Actor.new
actor5["name"]="Gary Oldman"
actor5.save

actor6 = Actor.new
actor6["name"]="Heath Ledger"
actor6.save

actor7 = Actor.new
actor7["name"]="Aaron Eckhart"
actor7.save

actor8 = Actor.new
actor8["name"]="Maggie Gyllenhaal"
actor8.save

actor9 = Actor.new
actor9["name"]="Tom Hardy"
actor9.save

actor10 = Actor.new
actor10["name"]="Joseph Gordon-Levitt"
actor10.save

actor11 = Actor.new
actor11["name"]="Anne Hathaway"
actor11.save

puts "There are #{Actor.all.count} movies"
all_actors = Actor.all
puts all_actors.inspect

# --------------------------------------------------------------------------#
# --------------------------------------------------------------------------#
# --------------------------------------------------------------------------#
role101 = Role.new
role101["character_name"] = "Bruce Wayne"
role101["movie_id"] = batman_begins["id"]
role101["actor_id"] = Actor.find_by({"name" => "Christian Bale"})["id"]
role101.save

role102 = Role.new
role102["character_name"] = "Alfred"
role102["movie_id"] = batman_begins["id"]
role102["actor_id"] = Actor.find_by({"name" => "Michael Caine"})["id"]
role102.save

role103 = Role.new
role103["character_name"] = "Ra's Al Ghul"
role103["movie_id"] = batman_begins["id"]
role103["actor_id"] = Actor.find_by({"name" => "Liam Neeson"})["id"]
role103.save

role104 = Role.new
role104["character_name"] = "Rachel Dawes"
role104["movie_id"] = batman_begins["id"]
role104["actor_id"] = Actor.find_by({"name" => "Katie Holmes"})["id"]
role104.save

role105 = Role.new
role105["character_name"] = "Commissioner Gordon"
role105["movie_id"] = batman_begins["id"]
role105["actor_id"] = Actor.find_by({"name" => "Gary Oldman"})["id"]
role105.save
# --------------------------------------------------------------------------#
# --------------------------------------------------------------------------#
role201 = Role.new
role201["character_name"] = "Bruce Wayne"
role201["movie_id"] = darkknight["id"]
role201["actor_id"] = Actor.find_by({"name" => "Christian Bale"})["id"]
role201.save

role202 = Role.new
role202["character_name"] = "Joker"
role202["movie_id"] = darkknight["id"]
role202["actor_id"] = Actor.find_by({"name" => "Heath Ledger"})["id"]
role202.save

role203 = Role.new
role203["character_name"] = "Harvey Dent"
role203["movie_id"] = darkknight["id"]
role203["actor_id"] = Actor.find_by({"name" => "Aaron Eckhart"})["id"]
role7.save

role204 = Role.new
role204["character_name"] = "Alfred"
role204["movie_id"] = darkknight["id"]
role204["actor_id"] = Actor.find_by({"name" => "Michael Caine"})["id"]
role204.save

role205 = Role.new
role205["character_name"] = "Rachel Dawes"
role205["movie_id"] = darkknight["id"]
role205["actor_id"] = Actor.find_by({"name" => "Maggie Gyllenhaal"})["id"]
role205.save

# --------------------------------------------------------------------------#
# --------------------------------------------------------------------------#

role301 = Role.new
role301["character_name"] = "Bruce Wayne"
role301["movie_id"] = dkr["id"]
role301["actor_id"] = Actor.find_by({"name" => "Christian Bale"})["id"]
role301.save

role302 = Role.new
role302["character_name"] = "Commissioner Gordon"
role302["movie_id"] = dkr["id"]
role302["actor_id"] = Actor.find_by({"name" => "Gary Oldman"})["id"]
role302.save

role303 = Role.new
role303["character_name"] = "Bane"
role303["movie_id"] = dkr["id"]
role303["actor_id"] = Actor.find_by({"name" => "Tom Hardy"})["id"]
role303.save

role304 = Role.new
role304["character_name"] = "John Blake"
role304["movie_id"] = dkr["id"]
role304["actor_id"] = Actor.find_by({"name" => "Joseph Gordon-Levitt"})["id"]
role304.save

role305 = Role.new
role305["character_name"] = "Selina Kyle"
role305["movie_id"] = dkr["id"]
role305["actor_id"] = Actor.find_by({"name" => "Anne Hathaway"})["id"]
role305.save



# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!


