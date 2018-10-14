module Api
  module V1
    class NotesController < ApplicationController
      def index
        result = run Note::Index
        render json: result['model']
      end

      def create
        result = run Note::Create
        if result.success?
          render json: result['model'], status: :created
        else
          render json: result['model'].errors, status: :unprocessable_entity
        end
      end

      def show
        result = run Note::Show
        render json: result['model']
      end

      def update
        result = run Note::Update
        if result.success?
          render json: result['model'], status: :ok
        else
          render json: result['model'], status: :unprocessable_entity
        end
      end

      def destroy
        run Note::Delete
      end

      private

      def _run_options(options)
        options = super(options)
        options.merge('contract.default.class' => MyContainer['note.contract.create'])
      end
    end
  end
end
