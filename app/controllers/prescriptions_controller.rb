class PrescriptionsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @prescriptions = Prescription.all.where(user_id:current_user.id)
    @drugs = Drug.all
  end

  def new
    @drugs = Drug.all
    if !@drugs.any?
      redirect_to drugs_path, notice: 'Create drugs to use in your prescriptions'
    end
    @prescription = Prescription.new
  end

  def create
    @prescription = Prescription.new(prescription_params)
    if @prescription.save
      flash[:notice] = "#{@prescription.drug.name} prescription created successfully."
      redirect_to prescriptions_path
    else
      render 'new'
    end
  end

  def show
    @prescription = Prescription.find(params[:id])
  end

  def destroy
    @prescription = Prescription.find(params[:id])
    @prescription.destroy
      flash[:notice] = "Successful"
    redirect_to prescriptions_path
  end

private

  def prescription_params
    params.require(:prescription).permit(:drug_id, :drug_uom, :renewal_interval, :quantity_prescribed,:user_id)
  end
  
end
