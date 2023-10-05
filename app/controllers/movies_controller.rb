class MoviesController < ApplicationController

  def create
    #Retrieve User input from params
    #Create record in movie table
    #populate each column with user input
    #save

    #redirect back user back to movie url
    m = Movie.new
    m.title = params.fetch("the_title")
    m.year = params.fetch("the_year")
    m.duration = params.fetch("the_duration")
    m.description = params.fetch("the_description")
    m.image = params.fetch("the_image")
    m.director_id = params.fetch("the_director_id")

    m.save

    redirect_to("/movies")

  end

  def update
    m_id = params.fetch("the_id")
    matching_records = Movies.where({:id => m_id})
    the_movie = matching_records.at(0)

    the_movie.title = params.fetch("the_title")
    the_movie.year = params.fetch("the_year")
    the_movie.duration = params.fetch("the_duration")
    the_movie.description = params.fetch("the_description")
    the_movie.image = params.fetch("the_image")
    the_movie.direct = params.fetch("the_direct_id")

    the_movie.save

    redirect_to("/movies/#{the_movie.id}")

  end

  def destroy
    the_id = params.fetch("an_id")
    matching_records = Movie.where({:id => the_id})
    the_movie = matching_records.at(0)
    the_movie.destroy
    redirect_to("/movies")
  end

  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end
end
