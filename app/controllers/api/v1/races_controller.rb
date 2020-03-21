module Api
  module V1
    class RacesController < ApplicationController
      def index
        run Race::Index
        render json: RaceSerializer.render(@model)
      end

      def create
        result = run Race::Create
        if result.success?
          render json: RaceSerializer.render(@model), status: :created
        else
          render json: result['contract.default'].errors.messages, status: :unprocessable_entity
        end
      end

      def show
        run Race::Show
        render json: RaceSerializer.render(@model)
      end

      def update
        result = run Race::Update
        if result.success?
          render json: RaceSerializer.render(@model), status: :ok
        else
          render json: result['contract.default'].errors.messages, status: :unprocessable_entity
        end
      end

      def destroy
        run Race::Destroy
      end
    end
  end
end
