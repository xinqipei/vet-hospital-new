class ProfileDecorator < ApplicationDecorator
  delegate_all

  def full_name
    "#{first_name} #{last_name}"
  end

  def formatted_dob
    dob.strftime('%m / %d / %Y')
  end

  def gender
    sex == "Male" ? "M" : "F"
  end
end
