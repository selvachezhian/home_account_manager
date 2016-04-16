# frozen_string_literal: true
RuboCop::RakeTask.new

task :default do
  Rake::Task['rubocop'].invoke
end
