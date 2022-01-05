module ApplicationHelper
  # see https://medium.com/@jiraffestaff/rails-webpacker%E3%81%A7javascript%E3%81%AE%E3%82%A8%E3%83%B3%E3%83%88%E3%83%AA%E3%83%BC%E3%83%9D%E3%82%A4%E3%83%B3%E3%83%88%E3%82%92action%E6%AF%8E%E3%81%AB%E5%88%86%E3%81%91%E3%82%8B-4616a24d1c39
  def javascript_path
    path = "#{controller_path}/#{action_name}.js"
    # 見つからない場合はdefault.jsを返す
    return 'default.js' unless javascript_file_exist?(path)
    path
  end

  def javascript_file_exist?(path)
    manifest = File.open('public/packs/manifest.json') do |file|
      JSON.load(file)
    end
    manifest.key?(path)
  end
end
