# frozen_string_literal: true

desc 'Run rspec tests'
task :rspec do
  sh 'bundle exec rspec'
end
