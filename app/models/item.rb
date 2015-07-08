class Item < ActiveRecord::Base

  extend FriendlyId
  validates :name, presence: true,
                   uniqueness: true
  friendly_id :name, use: :slugged
  mount_uploader :avatar, AvatarUploader

  def generate_qr
    url = read_config['server_url'] + Rails.application.routes.url_helpers.item_path(self.name)
    qr = RQRCode::QRCode.new(url, :size => 6, :level => :h)
    qr.to_img.resize(read_config['qr_size'], read_config['qr_size']).to_data_url
  end

  private

  def read_config
    @config_file ||= YAML::load(IO.read('config/config.yml'))
  end

end