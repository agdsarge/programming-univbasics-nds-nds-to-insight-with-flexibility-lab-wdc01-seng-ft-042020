# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end #returns a flattened a_o_a [1, 2, 3, 4]

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end #returns a hash {title: "Jaws", worldwide_gross: 123, release_year: 1975, studio: "Paramount", director_name: "Spielberg"}

# Your code after this point

def movies_with_director_key(name, movies_collection)
  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method
  
  
  result_array = []
  array_index = 0
  while array_index < movies_collection.length do
    result_array.push(movie_with_director_name(name, movies_collection[array_index]))
    array_index += 1
  end
  return result_array
end #returns AoH [{movie1_info: values, director_name: "Ford"}, {movie2_info: values, director_name: "Ford"}]


def gross_per_studio(collection)
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  # RETURN:
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
  array_index = 0
  result_hash = {}
  while array_index < collection.length do
    prod_studio = collection[array_index][:studio]
    if result_hash[prod_studio] == nil #if the result hash has no value for this studio
      result_hash[prod_studio] = collection[array_index][:worldwide_gross] #assign :worldwide_gross 
    else 
      result_hash[prod_studio] += collection[array_index][:worldwide_gross]
    end
    array_index += 1
  end
  return result_hash
end #returns {studio_name: 12345}

def movies_with_directors_set(source)
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it. ### this is horribly worded
      array_index = 0
    result_array = []
    while array_index < source.length do #loop over source
        dir_name = source[array_index][:name] #string of director's name
        film_hash_list = source[array_index][:movies]
        hash_list_index = 0
        gamma = []
        while hash_list_index < film_hash_list.length do
            gamma << movie_with_director_name(dir_name, film_hash_list[hash_list_index])
            hash_list_index += 1
        end
        result_array << gamma
        array_index += 1
    end
    return result_array
end
  #source is array of hashes
  #{:name=>"Byron Poodle", :movies=>[{:title=>"At the park"}, {:title=>"On the couch"}]}
  #{:name=>"Nancy Drew", :movies=>[{:title=>"Biting"}]}
  #source is an array of hashes. the hash has two keys, :name and :movies
  

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
