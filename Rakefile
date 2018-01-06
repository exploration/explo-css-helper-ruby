# frozen_string_literal: true

require 'rake/testtask'

desc 'Build gem'
task build: :fetch_styles do
  puts "\nBuilding gem now..."
  sh 'gem build explo_css_helper.gemspec'
end

Rake::TestTask.new do |t|
  t.libs << 'test'
end

desc 'Run all tests'
task default: :test

desc 'Fetch the latest EXPLO styles from the central style repo'
task :fetch_styles do
  puts 'Fetching latest styles...'
  sh 'git submodule foreach git pull origin master'
end
