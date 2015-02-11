class User < ActiveRecord::Base
  has_secure_password validations: false

  acts_as_followable
  acts_as_follower

  def full_name
    [first_name, last_name].join(" ")
  end

  # login step
  validates :email, presence: true, uniqueness: true, :if => :active_or_login?
  validates :password, confirmation: true, :if => :active_or_login?
  # personal step
  validates :first_name, presence: true, :if => :active_or_personal?
  validates :last_name, presence: true, :if => :active_or_personal?
  validates :bio, presence: true, :if => :active_or_personal?
  # social step
  validates :twitter, presence: true, uniqueness: true, :if => :active_or_social?
  # last job step
  validates :last_job_title, presence: true, :if => :active_or_last_job?

  def active?
    status == 'active'
  end

  def active_or_login?
    status.include?('login') || active?
  end

  def active_or_personal?
    status.include?('personal') || active?
  end

  def active_or_social?
    status.include?('social') || active?
  end

  def active_or_last_job?
    status.include?('last_job') || active?
  end




end
