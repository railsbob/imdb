require "bundler/gem_tasks"
require 'rake/testtask'

task :test do
  Rake::TestTask.new do |t|
    t.libs << "lib"
    t.libs << "test"
    t.test_files = FileList['test/**/*_test.rb']
    t.verbose = true
  end
end

task :default => :test