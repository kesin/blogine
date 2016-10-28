class Admin::SettingsController < Admin::ApplicationController
  def show
  end

  def create
    file = "#{Rails.root}/config/blogine.yml"
    config = YAML.load_file(file)
    config['production']['blogine']['site_name'] = params[:site_name] if params[:site_name].present?
    File.open(file,'w') do |h|
      h.write config.to_yaml
    end
    Settings.reload! # reload config without restart app
    redirect_to admin_settings_path, notice: 'update settings success'
  end
end