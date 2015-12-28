class ClientProject < ActiveRecord::Base

  validates_presence_of :title

  has_many :client_project_items

  default_scope { order('created_at DESC') }

  def statuses_collection
    collection = Hash.new
    statuses.split(/\r\n/).reject(&:empty?).each do |p|
      collection[p.split(":")[1]] = p
    end
    return collection
  end

end