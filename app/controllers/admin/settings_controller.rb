class Admin::SettingsController < Admin::ApplicationController
  def show
  end

  def create
    file = "#{Rails.root}/config/blogine.yml"
    config = YAML.load_file(file)
    blogine = config['production']['blogine']
    blogine['site_name'] = params[:site_name] if params[:site_name].present?
    blogine['host'] = params[:host] if params[:host].present?
    blogine['description'] = params[:description] if params[:description].present?
    blogine['keywords'] = params[:keywords] if params[:keywords].present?
    blogine['enable_captcha'] = params[:enable_captcha].present? ? !!params[:enable_captcha] : false
    config['production']['blogine'] = blogine
    File.open(file,'w') do |h|
      h.write config.to_yaml
    end
    Settings.reload! # reload config without restart app
    redirect_to admin_settings_path, notice: '设置保存成功并已生效'
  end
end