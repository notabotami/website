class User < ActiveRecord::Base
  has_many :shifts,dependent: :destroy
  has_many :preferences,dependent: :destroy
  
  #uniqueness doesn't insure that the user_id is actually unique, for now it's good enough
  validates :user_id, presence: true, length: {minimum: 1}, uniqueness: {message: "sorry, this username already exists"}
  validates :password, presence: true, length: {minimum: 5, maximum: 32},confirmation: true
  validates :password_confirmation, presence: true
  #validates :email,confirmation: true, allow_nil: true
  #validates :role, presence: true, inclusion: {in: %w(staff manager owner), message: "%{value} is not a valid role"}
  validates :first_name, presence: true, length: {minimum: 1}
  validates :last_name, presence: true, length: {minimum: 1}
  validates :session_token, presence: true, length: {minimum: 1}
  #validates :phone_number, allow_nil: true


  #takes in a user hash with no session token and creates a User object with a token
  def self.new_user(no_toke_user_hash)
    begin
      no_toke_user_hash["session_token"] = SecureRandom.base64
    end while User.exists?(:session_token => no_toke_user_hash["session_token"])
    return self.new(no_toke_user_hash)
  end

  def self.existsBySessionToken(session_token)
    users = User.all
    userExists = false
    users.each do |user|
      if user.session_token == session_token
        userExists = true
        break
      end
    end
    return userExists
  end

  def self.findBySessionToken(session_token)
    users = User.all
    users.each do |user|
      if user.session_token == session_token
        return user
      end
    end
    return nil
  end

  def self.findByUserIdAndPassword(user_id,password)
    users = User.all
    users.each do |user|
      if user.user_id == user_id
        if user.password == password
          return user
        end
        #since user_ids are unique, if user_id matches, but password doesn't, then login shouldn't match anyone else
        break
      end
    end
    return nil
  end



    #returns a pretty version of the attribute
    def self.pretty_attr(attr)
      attr = attr.to_sym
      case attr
        when :user_id
          return "username"
        when :first_name
          return "first name"
        when :last_name
          return "last name"
        when :phone_number
          return "phone number"
        else
          return attr.to_s
      end
    end
end
