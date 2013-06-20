class User < ActiveRecord::Base
  has_many :event_attendances
  has_many :created_events, :class_name => "Event"
  has_many :attended_events, :source => :event, :through => :event_attendances

  include BCrypt

  validates :email,    :uniqueness => true, :format => /\w+@\w+\.\w{2,3}/
  validates :password, :email, :presence => true

  before_save { |user| user.email = user.email.downcase }


  def password
    @password ||= Password.new(password_digest)
  end

  def password=(pass)
    @password = Password.create(pass)
    self.password_digest = @password
  end

  def self.create(params={})
    @user = User.new(params)
    @user.password = params[:password]
    @user.save!
    @user
  end

  def self.authenticate(params)
    user = User.find_by_email(params[:email])
    (user && user.password == params[:password]) ? user : nil
  end
end
