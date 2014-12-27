json.array!(@ticket_machines) do |ticket_machine|
  json.extract! ticket_machine, :id, :name, :ticket_seq
  json.url ticket_machine_url(ticket_machine, format: :json)
end
