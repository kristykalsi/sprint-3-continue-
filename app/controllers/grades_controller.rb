class GradesController < ApplicationController
    def show
        @grades = Grade.find(params[:id])
      end
end
