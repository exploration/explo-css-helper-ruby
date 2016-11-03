require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
end

desc "Run tests"
task :default => :test

desc "Compile gem" 
task :compile do
  sh "gem build explo_css_helper.gemspec"
end

