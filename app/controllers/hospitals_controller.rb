class HospitalsController < ApplicationController
  def index
    @hospitals = Hospital.all
  end

  def new
    @doctors = Doctor.all
    @hospital = Hospital.new
    @doctor = Doctor.new

    # @doctors = @patient.doctors
  end

  def create
    @hospital = Hospital.create hospital_params
    redirect_to root_path
  end

  def create_rating
    @hospital = Hospital.find params[:id]
    @rating = @doctor.ratings.create rating_params
    redirect_to doctor_path(@doctor)
  end

  def show
    @hospital = Hospital.find params[:id]
    @doctors = @hospital.doctors
    @ratings = @hospital.ratings
    @rating = Rating.new
  end

  def edit
    @doctors = Doctor.all
    @hospital = Hospital.find params[:id]
    # @doctors = @patient.doctors
  end

  def update
    @hospital = Hospital.find params[:id]
    @hospital.update_attributes hospital_params
    redirect_to root_path
  end

  def destroy
    @hospital = Hospital.find params[:id]
    @hospital.destroy
    redirect_to root_path
  end

  private
  def hospital_params
    params.require(:hospital).permit(
      :hospital_name,
      doctor_ids: [],
      hospital_ids: []
      )
  end

  def rating_params
    params.require(:rating).permit(
      :score,
      :comment,
      :ratable_id,
      :ratable_type
    )
  end
end
