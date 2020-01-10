class SightingsController < ApplicationController

    def index 
        sightings = Sighting.all
        if sightings
            render json: sightings, include: [:bird, :location]
        else 
            render jason:{message: 'Cannot find singhtings'}
        end 
    end 

    def show 
        sighting = Sighting.find_by(id: params[:id])
        if sighting 
            render json: sighting.to_json(:include => {
                 :bird => {:only => [:name, :species]},
                    :location => {:only => [:latitude, :longitude]}}, :except => [:updated_at])
        else 
            render json: {message: 'No sighting found with that id'}
        end 
    end 
end
