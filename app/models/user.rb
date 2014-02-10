# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  username               :text             default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  mantra                 :text
#  created_at             :datetime
#  updated_at             :datetime
#  provider               :string(255)
#  uid                    :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :workout_sessions
  has_many :exercise_sessions
  has_many :workouts
  has_and_belongs_to_many :communities
  # has_many :exercises, through: :exercise_sessions

  # username validation
  validates :username, presence: true
  validates :username, uniqueness: true

  # Helper methods
  def pr_count
    sum_array = self.workout_sessions.map { |x| x.pr? ? 1 : 0 }
    sum_array.reduce(:+)
  end

  def finished_count
    sum_array = self.workout_sessions.map { |x| x.accomplished? ? 1 : 0 }
    sum_array.reduce(:+)
  end

  def community_member?(community)
    self.communities.include?(community)
  end

  def participating?(workout)
    # current user has a workout session that points to this workout
    array = self.workout_sessions.map do |x|
      x.workout.id == workout.id
    end
    array.index(true) ? true : false
  end

  # omniauth helper methods
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname
      user.email = auth.info.email
      user.mantra = auth.info.description
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
end
