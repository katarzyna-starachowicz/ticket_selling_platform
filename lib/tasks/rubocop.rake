# frozen_string_literal: true

desc 'Run Rubocop, run'
task :rubocop do
  sh 'bundle exec rubocop'
end
