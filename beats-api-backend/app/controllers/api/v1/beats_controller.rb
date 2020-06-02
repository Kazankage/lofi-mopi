class Api::V1::BeatsController < ApplicationController
    def index
        @beats = Beat.all

        render json: @beats
    end

    def show
        @beat = Beat.find(params[:id])

        render json: @beat
    end

    def create
        @beat = Beat.create(beat_params)

        render json: @beat
    end

    def update
        @beat = Beat.find(params[:id])
        @beat.update(beat_params)

        render json: @beat
    end

    def destroy
        @beat = Beat.find(params[:id])
        @beat.delete

        render json: {beatId = @beat.id}
    end

    private
    def beat_params
        params.require(:beat).permit(:body)
    end
end
