class SightingsController < ApplicationController

    def index
        sightings = Sighting.all
        render json: sightings, include: { 
            bird: { except: [:created_at, :updated_at] },
            location: { except: [:created_at, :updated_at] }
        }, except: [:created_at, :updated_at]
    end

    def show
        sighting = Sighting.find_by(id: params[:id])
        if sighting 
            # render json: sighting, except: [:created_at, :updated_at]
            # render json: { id: sighting.id, bird: sighting.bird, location: sighting.location }, except: [:created_at, :updated_at]
            render json: sighting, include: [:bird, :location]
        else
            render json: {
                message: "no sightings yet"
            }
        end
    end
end
