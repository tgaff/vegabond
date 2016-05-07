class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  has_attached_file :avatar, styles: {medium: "300x300>", tumb: "100x100>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end

end
