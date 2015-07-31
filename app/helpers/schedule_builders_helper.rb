module ScheduleBuildersHelper
  def self.shift_string(templ)
    da_string="| "
    templ.shiftempls.each do |shift|
      da_string = da_string +"#{shift.section} #{shift.start_time.strftime('%l:%M %p')}   |   "
    end
    return da_string
  end
end
