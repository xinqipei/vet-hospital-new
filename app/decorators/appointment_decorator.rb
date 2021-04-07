class AppointmentDecorator < ApplicationDecorator
  delegate_all

  def formatted_date
  	date.strftime('%a, %b %d, %Y')
  end

  def formatted_time
  	time.strftime("%l:%M %p")
  end
end
