class SignupsController < ApplicationController

rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

    def create
        signup = Signup.create!(signup_params)
        render json: signup.activity, include: ['activity'], status: :created
    end

    private

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end

    def invalid_record(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

end
