class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  before_action { @sidebar = 'administration' }
  before_action :options_for_select, only: [:new, :edit, :create, :update]
  # GET /people
  # GET /people.json
  def index
    @people = Person.all.page(params[:page])
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
    license = License.new
    license.modalities.build
    license.modalities.build
    @person.license = license
    @person.phones.build
  end

  # GET /people/1/edit
  def edit
    if @person.license.modalities.count == 1
      @person.license.modalities.build
    end
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)
    check_params
    ActiveRecord::Base.transaction do
      respond_to do |format|
        if @person.errors.count == 0
          if @person.save
            format.html { redirect_to @person, notice: 'Person was successfully created.' }
            format.json { render :show, status: :created, location: @person }
          else
            format.html { render :new }
            format.json { render json: @person.errors, status: :unprocessable_entity }
          end
        else
          format.html { render :edit }
          format.json { render json: @person.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    check_params
    respond_to do |format|
      if @person.errors.count == 0
        if @person.update(person_params)
          format.html { redirect_to @person, notice: 'Person was successfully updated.' }
          format.json { render :show, status: :ok, location: @person }
        else
          format.html { render :edit }
          format.json { render json: @person.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_person
    @person = Person.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def person_params
    params.require(:person)
        .permit(:name, :surname, :cpf, :date_of_birth, :email, :id, :_destroy,
                license_attributes: [:number, :validity, :id, :_destroy,
                                     modalities_attributes: [:name, :id, :_destroy]],
                phones_attributes: [:ddd, :number, :phone_type, :preferential, :id, :_destroy])
  end

  def options_for_select
    @phone_types = Phone.phone_types.keys
    @modalities_names = Modality.names.keys
  end

  def check_params
    if PhonesHelper.check_phones_attributes(person_params) == false
      @person.errors.add(:phones, 'dados inconsistentes, verifique se foi adicionado mais de um telefone preferencial.')
    end
    if LicensesHelper.license_attributes_check_modalities(person_params) == false
      @person.errors.add(:license, 'dados inconsistentes, verifique a combinação da categorias.')
    end
  end
end
