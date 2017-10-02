### Blogine - 基于 Ruby on Rails 的开源博客

项目是基于`Rails`的一款开源的个人单博客系统。


![输入图片说明](https://zoker.io/logo.svg "在这里输入图片标题")

> 在线演示 https://zoker.io/ 

#### 功能

- 文章发布（MD编辑器采用码云开源的 [TMD](https://gitee.com/benhail/thinker-md) ）
- 标签管理（支持多标签管理）
- 分类管理（支持多分类管理）
- 评论管理（评论验证码，审核机制）
- 页面管理（单页面管理）
- 搜索（使用Solr进行索引）
- 后台管理

#### 功能截图
##### 首页

![输入图片说明](https://git.oschina.net/uploads/images/2017/1002/132154_93d5b6fd_62561.png "屏幕截图.png")

##### 文章界面

![输入图片说明](https://git.oschina.net/uploads/images/2017/1002/132208_22c3794b_62561.png "屏幕截图.png")

##### 搜索功能

![输入图片说明](https://git.oschina.net/uploads/images/2017/1002/132217_eafedaf9_62561.png "屏幕截图.png")

##### 发布博客

![输入图片说明](https://git.oschina.net/uploads/images/2017/1002/132227_281b730a_62561.png "屏幕截图.png")

##### 博客设置

![输入图片说明](https://git.oschina.net/uploads/images/2017/1002/132237_9d31e9c4_62561.png "屏幕截图.png")

#### 使用

项目基于 `Ruby 2.3.1` 及以上

1. git clone https://gitee.com/kesin/Blogine
2. bundle install
3. cp database.yml.example database.yml  #修改数据库配置
4. cp blogine.yml.example blogine.yml  #修改博客配置
5. cp puma.rb.example puma.rb
6. cd Blogine
7. bundle exec rake db:migrate
8. cp development.rb.example development.rb
9. bundle exec puma

访问 http://127.0.0.1:3003

#### 搜索配置（可选）
- 如果不需要搜索功能，可以将`blogine.yml`中的`enable_search: false`设置为`false`
- 如果需要搜索功能，可以设置为`true`

##### 配置Solr
- Java: JDK 1.7.X 以上
- 初始化：`rails generate sunspot_rails:install`
- 启动：`bundle exec rake sunspot:solr:start`
- 如果已经有数据，需要执行重新构建索引：`bundle exec rake sunspot:reindex`

生产环境下需要更改如下配置：
1. `cp blogine/solr/default blogine/solr/production`
2. 并修改`blogine/solr/production/core.properties`的`name`为`production`

#### 贡献代码

1. Fork 项目
2. 创建本地分支 (`git checkout -b my-new-feature`)
3. 提交更改 (`git commit -am 'Add some feature'`)
4. 推送到分支 (`git push origin my-new-feature`)
5. 创建一个 Pull Request

#### 贡献者

[@Zoker](https://zoker.io)