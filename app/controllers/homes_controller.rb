class HomesController < ApplicationController
    before_action :authenticate_user!
    def index
        # @photo = Photo.all
    end
    
end
