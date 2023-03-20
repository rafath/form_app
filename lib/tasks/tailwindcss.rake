# frozen_string_literal: true

TAILWIND_RAILS_PATH = `bundle show tailwindcss-rails`.chomp
TAILWIND_COMPILE_COMMAND = "#{RbConfig.ruby} #{TAILWIND_RAILS_PATH}/exe/tailwindcss "
TAILWIND_COMPILE_COMMAND += "-i '#{Rails.root.join('app/assets/stylesheets/application.tailwind.css')}' "
TAILWIND_COMPILE_COMMAND += "-o '#{Rails.root.join('app/assets/builds/tailwind.css')}' "
TAILWIND_COMPILE_COMMAND += "-c '#{Rails.root.join('config/tailwind.config.js')}' --minify"

SIMPLE_FORM_TAILWIND_GEMDIR = `bundle show simple_form_tailwind_css`.freeze

Rake::Task['tailwindcss:build'].clear
Rake::Task['tailwindcss:watch'].clear

namespace :tailwindcss do
  desc 'Build your Tailwind CSS'
  task build: :environment do
    system({ 'SIMPLE_FORM_TAILWIND_GEMDIR' => SIMPLE_FORM_TAILWIND_GEMDIR }, TAILWIND_COMPILE_COMMAND, exception: true)
  end

  desc 'Watch and build your Tailwind CSS on file changes'
  task watch: :environment do
    system({ 'SIMPLE_FORM_TAILWIND_GEMDIR' => SIMPLE_FORM_TAILWIND_GEMDIR }, "#{TAILWIND_COMPILE_COMMAND} -w")
  end
end
