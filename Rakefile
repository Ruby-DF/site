require "bridgetown"

Bridgetown.load_tasks

# Run rake without specifying any command to execute a deploy build by default.
task default: :deploy

#
# Standard set of tasks, which you can customize if you wish:
#
desc "Build the Bridgetown site for deployment"
task :deploy => [:clean, "frontend:build"] do
  Bridgetown::Commands::Build.start
end

desc "Build the site in a test environment"
task :test do
  ENV["BRIDGETOWN_ENV"] = "test"
  Bridgetown::Commands::Build.start
end

desc "Runs the clean command"
task :clean do
  Bridgetown::Commands::Clean.start
end

namespace :frontend do
  desc "Build the frontend with esbuild for deployment"
  task :build do
    sh "yarn run esbuild"
  end

  desc "Watch the frontend with esbuild during development"
  task :dev do
    sh "yarn run esbuild-dev"
  rescue Interrupt
  end
end

#
# Add your own Rake tasks here! You can use `environment` as a prerequisite
# in order to write automations or other commands requiring a loaded site.
#
# task :my_task => :environment do
#   puts site.root_dir
#   automation do
#     say_status :rake, "I'm a Rake tast =) #{site.config.url}"
#   end
# end

desc "Generate agenda image for social media sharing"
task :generate_agenda_image, [:event_date] => [:deploy] do |t, args|
  event_date = args[:event_date]
  
  unless event_date
    puts "❌ Please provide an event date"
    puts "Usage: rake generate_agenda_image[2025-01-25]"
    exit 1
  end
  
  # Ensure we have node dependencies
  unless File.exist?("node_modules/puppeteer")
    puts "📦 Installing node dependencies..."
    sh "yarn install"
  end
  
  # Generate the image
  puts "🎨 Generating agenda image for #{event_date}..."
  sh "node scripts/generate_agenda_image.js #{event_date}"
end
