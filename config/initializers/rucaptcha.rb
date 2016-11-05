RuCaptcha.configure do
  # 生成多少个字符
  self.len = 4
  # 字体大小
  self.font_size = 30
  # 开启文件缓存，并设定每个进程最大生成的验证码数量限制，达到限制以后会反复利用之前的缓存文件
  # 当 Rails 进程重启以后，又会重新生成，并清理之前的文件缓存 (`Rails.root.join('tmp/cache/rucaptcha')` 里面)
  # 设置 0 关闭缓存, 默认 100
  self.cache_limit = 100
  # 文字扭曲度，调整这个可以提高阅读难度，默认 0.4 范围 [0.0 - 1.0]
  self.implode = 0.2
  # 配置 cache_store，类似 Rails 的 config.cache_store
  # 与其它的验证码库不同， RuCaptcha 将验证码 code 存放在后端，而不是 Session，以避免 Session 重放攻击
  # 你需要将 cache_store 配置在一个支持跨进程、跨服务器共享的地方，例如 Memcached, Redis 都可以
  # 不可以用 file_store, null_store 或者 memory_store
  # 因为这些存储方式无法跨进程或服务器，当多进程、服务器部署的时候验证码会验证不过。
  self.cache_store = [:redis_store, '127.0.0.1']
end