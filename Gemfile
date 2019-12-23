source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.4'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# A versão da gem importa exatamente a mesma versão do bootstrap
gem 'bootstrap', '~> 4.4', '>= 4.4.1'

# Para formulários dinâmicos
gem 'cocoon', '~> 1.2', '>= 1.2.14'

# Para autenticação de usuários
gem 'devise', '~> 4.7', '>= 4.7.1'

# Com esta gem é possível usar o jquery 1, 2 ou 3. Neste projeto utilizamos o jquery 3.4.1
gem 'jquery-rails', '~> 4.3', '>= 4.3.5'

# Para paginação
gem 'kaminari', '~> 1.1', '>= 1.1.1'

# Para sistemas com múltiplos idiomas.
gem 'rails-i18n', '~> 6.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Para testes em views
  gem 'capybara', '~> 3.29'
  # Gerador de valores aleatórios. Usado na automação de testes
  gem 'faker', '~> 2.9'
  # Sementes para usar em testes de models
  gem 'factory_bot_rails', '~> 5.1', '>= 5.1.1'
  # Para automação de testes
  gem 'rspec-rails', '~> 3.9'
end

group :development do
  # Melhora interface de erros.
  gem 'better_errors', '~> 2.5', '>= 2.5.1'
  # Adiciona REPL na tela de erros
  gem 'binding_of_caller', '~> 0.8.0'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
