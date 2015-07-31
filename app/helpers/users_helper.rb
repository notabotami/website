module UsersHelper
  def self.check_if_empyt(val)
    if (val == nil)
      return "NA"
    else
      return val
    end
  end
end
