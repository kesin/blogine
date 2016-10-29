class Admin::SettingsController < Admin::ApplicationController
  def show
  end

  def create
    file = "#{Rails.root}/config/blogine.yml"
    config = YAML.load_file(file)
    blogine = config['production']['blogine']
    blogine['site_name'] = params[:site_name] if params[:site_name].present?
    blogine['domain'] = params[:domain] if params[:domain].present?
    config['production']['blogine'] = blogine
    File.open(file,'w') do |h|
      h.write config.to_yaml
    end
    Settings.reload! # reload config without restart app
    redirect_to admin_settings_path, notice: '设置保存成功并已生效'
  end
end