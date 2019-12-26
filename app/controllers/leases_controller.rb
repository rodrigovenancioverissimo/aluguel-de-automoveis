class LeasesController < ApplicationController
  before_action :set_lease, only: [:show, :edit, :update, :destroy]
  before_action { @sidebar = 'administration' }
  before_action :new_lease_filterrific, only: [:new, :edit, :update, :create]
  before_action :set_lease_of_create, only: [:create]
  before_action :validate_params, only: [:update, :create]

  # GET /leases
  # GET /leases.json
  def index
    @leases = Lease.all.page(params[:page])
  end

  # GET /leases/1
  # GET /leases/1.json
  def show
  end

  # GET /leases/new
  def new
    @lease = Lease.new
  end

  # GET /leases/1/edit
  def edit
  end

  # POST /leases
  # POST /leases.json
  def create
    respond_to do |format|
      if @lease.errors.count == 0
        if @lease.save
          format.html { redirect_to @lease, notice: 'Lease was successfully created.' }
          format.json { render :show, status: :created, location: @lease }
        else
          format.html { render :new }
          format.json { render json: @lease.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new }
        format.json { render json: @lease.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leases/1
  # PATCH/PUT /leases/1.json
  def update
    respond_to do |format|
      if @lease.errors.count == 0
        if @lease.update(lease_params)
          format.html { redirect_to @lease, notice: 'Lease was successfully updated.' }
          format.json { render :show, status: :ok, location: @lease }
        else
          format.html { render :edit }
          format.json { render json: @lease.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new }
        format.json { render json: @lease.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leases/1
  # DELETE /leases/1.json
  def destroy
    @lease.destroy
    respond_to do |format|
      format.html { redirect_to leases_url, notice: 'Lease was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_lease
    @lease = Lease.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def lease_params
    params.require(:lease).permit(:person_id, :automobile_id, :start_time, :end_time, :entry_time, :exit_time)
  end

  def people_filterrific
    @people_filterrific = initialize_filterrific(
        Person,
        params[:people_filterrific],
        select_options: {
            sorted_by: Person.options_for_sorted_by,
        },
        available_filters: [:sorted_by, :with_name],
        ) or return
    @people = @people_filterrific.find.page(params[:people_page]).per(5)
  end

  def automobiles_filterrific
    @automobiles_filterrific = initialize_filterrific(
        Automobile,
        params[:automobiles_filterrific],
        select_options: {
            sorted_by: Automobile.options_for_sorted_by,
        },
        available_filters: [:sorted_by, :with_model],
        ) or return
    @automobiles = @automobiles_filterrific.find.page(params[:automobiles_page]).per(5)
  end

  def new_lease_filterrific
    if params[:automobiles_filterrific].present?
      automobiles_filterrific
    elsif params[:people_filterrific].present?
      people_filterrific
    else
      automobiles_filterrific
      people_filterrific
    end

      # Recover from invalid param sets, e.g., when a filter refers to the
      # database id of a record that doesn’t exist any more.
      # In this case we reset filterrific and discard all filter params.
  rescue ActiveRecord::RecordNotFound => e
    # There is an issue with the persisted param_set. Reset it.
    puts "Had to reset filterrific params: #{e.message}"
    redirect_to(reset_filterrific_url(format: :html)) && return
  end

  def set_lease_of_create
    @lease = Lease.new(lease_params)
  end

  def validate_params
    person = @lease.person
    automobile = @lease.automobile
    if person.active_lease.present? && person.active_lease.id != @lease.id && @lease.end_time.blank?
      @lease.errors.add(:lease, 'existe outra locação em andamento')
    end
    # Para todos os clientes
    if person.date_of_birth > Date.current - 21.years
      @lease.errors.add(:person, 'deve ter mais de 21 anos para alugar um automóvel')
    end
    if @lease.end_time - @lease.start_time > 4.days && person.leases.where("leases.end_time < leases.entry_time").count <= 2
      @lease.errors.add(:person, 'deve ter mais de 2 locações sem atrasos para alugar por mais de 4 dias')
    end
    # Para alugar ônibus
    if Automobile.automobile_types[automobile.automobile_type] == 3 &&
        (person.date_of_birth > Date.current - 40.years || person.license.modalities.where(name: ['D', 'E']).blank?)
      @lease.errors.add(:person, 'deve ter mais de 40 anos e habilitação correspondente para alugar um ônibus')
    end
    # Para alugar caminhão
    if Automobile.automobile_types[automobile.automobile_type] == 1 &&
        (person.date_of_birth > Date.current - 60.years || person.license.modalities.where(name: ['C', 'D', 'E']).blank?)
      @lease.errors.add(:person, 'deve ter mais de 60 anos e habilitação correspondente para alugar um caminhão')
    end
    # Para alugar carros
    if Automobile.automobile_types[automobile.automobile_type] == 0 && person.license.validity < Date.current
      @lease.errors.add(:person, 'com habilitações vencidas não podem alugar carros')
    end
    # Pata todos os veículos
    if automobile.plaque[-1] == '4' && @lease.start_time.wday == 4
      @lease.errors.add(:automobile, 'que possue a placa de final 4 não pode ser alugado às quartas feiras')
    end
  end
end
