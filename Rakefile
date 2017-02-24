require 'rake/testtask'

desc "Run all tests in folder test/*_test.rb"
Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*_spec.rb']
  t.verbose = true
end

task :default => :test
