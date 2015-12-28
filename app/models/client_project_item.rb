class ClientProjectItem < ActiveRecord::Base

  belongs_to :client_project
  belongs_to :client

  validates_presence_of :client_project_id, :client_id

  def status_label
    status.split(":")[0]
  end

  def status_value
    status.split(":")[1]
  end

end