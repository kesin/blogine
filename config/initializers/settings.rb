class Settings < Settingslogic
  source "#{Rails.root}/config/blogine.yml"
  namespace Rails.env
end