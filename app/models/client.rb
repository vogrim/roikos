class Client < ActiveRecord::Base


  def title_for_list
    [company, full_name].reject(&:blank?).join(', ')
  end

  def full_name
    [salutation, title, firstname, surname].compact.join(' ')
  end

end