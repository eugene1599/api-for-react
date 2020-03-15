module Api
  module V1
    class ReportsController < ApplicationController
      load_and_authorize_resource :race, only: %i[index create show update destroy]
      load_and_authorize_resource :report, through: :race, only: %i[index create show update destroy]

      def index
        render json: ReportSerializer.render(@reports.order(created_at: :desc))
      end

      def create
        if @report.save
          render json: ReportSerializer.render(@report), status: :created
        else
          render json: @report.errors, status: :unprocessable_entity
        end
      end

      def show
        render json: @report
      end

      def update
        if @report.update(report_params)
          render json: ReportSerializer.render(@report), status: :ok
        else
          render json: @report.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @report.destroy
      end

      def user_reports
        render json: Api::V1::UserMonthlyReportGeneratorService.new(current_user).call
      end

      private

      def report_params
        params.require(:report).permit(:mileage, :fuel, :fuel_cost)
      end
    end
  end
end
