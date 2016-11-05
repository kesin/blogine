RuCaptcha.configure do
  # Number of chars, default: 4
  self.len = 4
  # Image font size, default: 45
  self.font_size = 30
  # Cache generated images in file store, this is config files limit, default: 100
  # set 0 to disable file cache.
  self.cache_limit = 100
  # Custom captcha code expire time if you need, default: 2 minutes
  # self.expires_in = 120
  # Color style, default: :colorful, allows: [:colorful, :black_white]
  # self.style = :colorful
  self.implode = 0.2
  # [Requirement]
  # Store Captcha code where, this config more like Rails config.cache_store
  # default: Rails application config.cache_store
  # But RuCaptcha requirements cache_store not in [:null_store, :memory_store, :file_store]
  self.cache_store = :redis_store
end