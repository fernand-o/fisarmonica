# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

Dotenv.load if Rails.env.development? || Rails.env.test?