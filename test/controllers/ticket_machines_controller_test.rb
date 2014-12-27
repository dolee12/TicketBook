require 'test_helper'

class TicketMachinesControllerTest < ActionController::TestCase
  setup do
    @ticket_machine = ticket_machines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ticket_machines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ticket_machine" do
    assert_difference('TicketMachine.count') do
      post :create, ticket_machine: { ticket_seq: @ticket_machine.ticket_seq, title,: @ticket_machine.title, }
    end

    assert_redirected_to ticket_machine_path(assigns(:ticket_machine))
  end

  test "should show ticket_machine" do
    get :show, id: @ticket_machine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ticket_machine
    assert_response :success
  end

  test "should update ticket_machine" do
    patch :update, id: @ticket_machine, ticket_machine: { ticket_seq: @ticket_machine.ticket_seq, title,: @ticket_machine.title, }
    assert_redirected_to ticket_machine_path(assigns(:ticket_machine))
  end

  test "should destroy ticket_machine" do
    assert_difference('TicketMachine.count', -1) do
      delete :destroy, id: @ticket_machine
    end

    assert_redirected_to ticket_machines_path
  end
end
