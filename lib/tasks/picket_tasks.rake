# frozen_string_literal: true

desc "Install Picket and its dependencies"
task "picket:install" => :environment do
  Rails::Command.invoke :generate, ["picket:install"]
end
