class TicketsController < ApplicationController
  before_action :set_user
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  
  # POST /ticket_machines
  # POST /ticket_machines.json
  def index
    @tickets = get_active_tickets_of_current_user
  end
  
  def get_active_tickets_of_current_user
    Ticket.where('user_id = ? && check_in is null', @user.id)
  end
  
  # POST /ticket_machines
  # POST /ticket_machines.json
  def create
    @ticket = Ticket.new(ticket_params)
    set_ticket_number
    
    respond_to do |format|
      if @ticket.save        
        format.html { redirect_to :controller=>"stores", :action=>"show", :id=>params[:store_id], :result=>1 }
        format.json { render :show, status: :created, location: @ticket_machine }
      else
        format.html { redirect_to :controller=>"stores", :action=>"show", :id=>params[:store_id], :result=>0 }
        format.json { render json: @ticket_machine.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def set_ticket_number
    machine = TicketMachine.lock.find(@ticket.ticket_machine_id)
    @ticket.ticket_no = machine.ticket_seq
    machine.ticket_seq = machine.ticket_seq + 1
    machine.save!
  end
  
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, result: 1 }
      format.json { head :no_content }
    end
  end
  
  private
    def set_user
      @user = ApplicationHelper.get_current_user
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:user_id, :ticket_machine_id, :people_cnt, :check_in)
    end
end
