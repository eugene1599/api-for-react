module Api
  module V1
    class RacesController < ApplicationController
      def index
        run Race::Index
      end

      def create
        result = run Race::Create
        if result.success?
          render json: @model, status: :created
        else
          render json: result['contract.default'].errors.messages, status: :unprocessable_entity
        end
      end

      def show
        run Race::Show
        render json: @model
      end

      def update
        result = run Race::Update
        if result.success?
          render json: @model, status: :ok
        else
          render json: result['contract.default'].errors.messages, status: :unprocessable_entity
        end
      end

      def destroy
        run Race::Destroy
      end

      def search_cars_by_driver
        driver = current_user.drivers.find_by(id: params[:driver_id])

        cars = Car.where(id: driver.races.pluck(:car_id))
        @cars = CarReporter.new(cars).each_car_report.for_period(
                  start_date: params[:start_date],
                  end_date: params[:end_date]
                )
        render json: @cars
      end

      private

      def _run_options(options)
        options = super(options)
        options.merge('contract.default.class' => MyContainer['race.contract'])
      end
    end
  end
end
