class UploadController < ApplicationController

  before_action :authenticate_user
  skip_before_action :verify_authenticity_token

  def upload_image
    file = params[:files]
    file_list = Array.new
    if !file.content_type.match(/^image\/(gif|png|jpg|jpeg){1}$/)
      success = false
      msg = "#{file.original_filename}: 只支持上传JPG、JPEG、PNG、GIF格式图片"
    elsif file.size > 1 * 1024 * 1024
      success = false
      msg = "#{file.original_filename}: 图片过大，请上传小于1M的图片"
    else
      success = true
      msg = "上传成功！"
    end
    file_list << save_file(file) if success
    render json: { success: success , msg: msg, files: file_list }
  end

  def upload_base64_image
    base64 = params[:base64Date]
    success = true
    msg = "上传成功！"
    data = save_base64_file(base64)
    render json: { success: success , msg: msg, file: data }
  end

  private

  def save_base64_file(base_64_encoded_data)
    extname = 'png'
    filename = '粘贴图片'
    uri = File.join('uploads', 'images', "#{DateTime.now.strftime('%Y/%m%d/%H%M%S')}_#{SecureRandom.hex(4)}.#{extname}")
    save_path = Rails.root.join('public', uri)
    file_dir = File.dirname(save_path)

    FileUtils.mkdir_p(file_dir) unless Dir.exist?(file_dir)
    File.open save_path, 'wb' do |f|
      f.write(Base64.decode64(base_64_encoded_data.split(",")[1]))
    end

    { filename: "#{filename}.#{extname}", title: filename, url: "https://#{Settings.blogine.host}/#{uri}" }
  end

  def save_file(file)
    extname = file.content_type.match(/^image\/(gif|png|jpg|jpeg){1}$/).to_a[1]
    filename = File.basename(file.original_filename, '.*')
    uri = File.join('uploads', 'images', "#{DateTime.now.strftime('%Y/%m%d/%H%M%S')}_#{SecureRandom.hex(4)}.#{extname}")
    save_path = Rails.root.join('public', uri)
    file_dir = File.dirname(save_path)

    FileUtils.mkdir_p(file_dir) unless Dir.exist?(file_dir)
    File.open save_path, 'wb' do |f|
      f.write(file.read)
    end

    { filename: "#{filename}.#{extname}", title: filename, url: "https://#{Settings.blogine.host}/#{uri}" }
  end
end
