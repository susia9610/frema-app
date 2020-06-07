class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]


  with_options presence: true do
    validates :nickname
    validates :birth_year
    validates :birth_month
    validates :birth_day
    validates :email,          uniqueness: {case_sensitive: false},
                               format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
    validates :password,       length: { minimum: 7 }
    with_options format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/} do
      validates :firstname
      validates :lastname
    end
    with_options format: {with: /\A[ァ-ヶー－]+\z/} do
      validates :firstname_kana
      validates :lastname_kana
    end
  end
  has_one :address
  has_many :sns_credentials

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
  
  
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
  
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end  
end






