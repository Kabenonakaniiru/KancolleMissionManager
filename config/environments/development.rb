require 'active_support/core_ext/integer/time'

Rails.application.configure do
  config.after_initialize do
    Bullet.enable        = true
    Bullet.alert         = true
    Bullet.bullet_logger = true
    Bullet.console       = true
    # Bullet.growl         = true
    Bullet.rails_logger  = true
    Bullet.add_footer    = true
  end

  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded any time
  # it changes. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    # config.cache_store = :memory_store
    # config.public_file_server.headers = {
    #   'Cache-Control' => "public, max-age=#{2.days.to_i}"
    # }
    # config.cache_store = :memory_store
    # see https://railsguides.jp/caching_with_rails.html
    # FIXME: 検証中
    config.cache_store = :redis_cache_store, { driver: :hiredis, url: 'redis://localhost:6379/0' }
    # config.cache_store = :redis_cache_store, driver: :hiredis
    # namespace: 'myapp-cache', compress: true,
    # url: %w[
    #   redis://myapp-cache-1:6379/0
    #   redis://myapp-cache-1:6380/0
    #   redis://myapp-cache-2:6379/0
    #   redis://myapp-cache-2:6380/0
    #   redis://myapp-cache-3:6379/0
    #   redis://myapp-cache-3:6380/0
    # ]
    # config.cache_store = :redis_cache_store, {
    #   url: ENV['REDIS_URL'],
    #   connect_timeout:    30,  # Defaults to 20 seconds
    #   read_timeout:       0.2, # Defaults to 1 second
    #   write_timeout:      0.2, # Defaults to 1 second
    #   reconnect_attempts: 1,   # Defaults to 0
    #   error_handler: -> (method:, returning:, exception:) {
    #     # Report errors to Sentry as warnings
    #     Raven.capture_exception exception, level: 'warning',
    #       tags: { method: method, returning: returning }
    #   }
    # }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :local

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise exceptions for disallowed deprecations.
  config.active_support.disallowed_deprecation = :raise

  # Tell Active Support which deprecation messages to disallow.
  config.active_support.disallowed_deprecation_warnings = []

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations.
  # config.i18n.raise_on_missing_translations = true

  # Annotate rendered view with file names.
  # config.action_view.annotate_rendered_view_with_filenames = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  # Uncomment if you wish to allow Action Cable access from any origin.
  # config.action_cable.disable_request_forgery_protection = true
  # Action Mailer URL
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  config.action_mailer.delivery_method = :sendmail
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_options = { from: 'no-reply@example.com' } # FIXME: いつか変更
  # see https://railsguides.jp/action_mailer_basics.html
  # config.action_mailer.smtp_settings = {
  #   address:              'smtp.gmail.com',
  #   port:                 587,
  #   domain:               'example.com',
  #   user_name:            '<ユーザー名>',
  #   password:             '<パスワード>',
  #   authentication:       'plain',
  #   enable_starttls_auto: true
  # }

  config.web_console.whitelisted_ips = '0.0.0.0/0'
end
