class Item < ActiveRecord::Base

  validates_presence_of :name
  validates_uniqueness_of :name
  extend FriendlyId
  friendly_id :name, use: :slugged
  mount_uploader :avatar, AvatarUploader
  before_save :default_values

  private

  def default_values
    self.slug    = self.name
    self.qr_code = generate_qr
  end

  def generate_qr
    qr = RQRCode::QRCode.new(self.name, :size => 6, :level => :h)
    qr.to_img.resize(170, 170).to_data_url
  end

end