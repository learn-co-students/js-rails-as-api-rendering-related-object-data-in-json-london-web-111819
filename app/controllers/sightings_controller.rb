class SightingsController < ApplicationController
    def show
        sighting = Sighting.all.find_by(id: params[:id])
        render json: {id: sighting.id, bird: sighting.bird, location: sighting.location }
    end
end
