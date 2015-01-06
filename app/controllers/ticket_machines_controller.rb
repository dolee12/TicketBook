class TicketMachinesController < ApplicationController
  before_action :set_ticket_machine, only: [:show, :edit, :update, :destroy]

  # GET /ticket_machines
  # GET /ticket_machines.json
  def index
    @ticket_machines = TicketMachine.all
  end

  # GET /ticket_machines/1
  # GET /ticket_machines/1.json
  def show
  end

  # GET /ticket_machines/new
  def new
    @ticket_machine = TicketMachine.new
  end

  # GET /ticket_machines/1/edit
  def edit
  end

  # POST /ticket_machines
  # POST /ticket_machines.json
  def create
    @ticket_machine = TicketMachine.new(ticket_machine_params)
    
    respond_to do |format|
      if @ticket_machine.save
        
        format.html { redirect_to :controller=>"stores", :action=>"show", :id=>@ticket_machine.store_id, :notice=>'Ticket machine was successfully created.' }
        format.json { render :show, status: :created, location: @ticket_machine }
      else
        format.html { render :new }
        format.json { render json: @ticket_machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ticket_machines/1
  # PATCH/PUT /ticket_machines/1.json
  def update
    respond_to do |format|
      if @ticket_machine.update(ticket_machine_params)
        format.html { redirect_to @ticket_machine, notice: 'Ticket machine was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket_machine }
      else
        format.html { render :edit }
        format.json { render json: @ticket_machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ticket_machines/1
  # DELETE /ticket_machines/1.json
  def destroy
    @ticket_machine.destroy
    respond_to do |format|
      format.html { redirect_to ticket_machines_url, notice: 'Ticket machine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket_machine
      @ticket_machine = TicketMachine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_machine_params
      params.require(:ticket_machine).permit(:store_id, :ticket_seq, :name, :enabled, :title)
    end
end
