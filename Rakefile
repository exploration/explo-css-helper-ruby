require 'rake/testtask'

desc "Build gem" 
task :build do
  sh "gem build explo_css_helper.gemspec"
end

Rake::TestTask.new do |t|
  t.libs << 'test'
end

desc "Run all tests"
task :default => :test

