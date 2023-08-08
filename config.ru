# This file is used by Rack-based servers to start the application.

require_relative "config/environment"

run Rails.application
Rails.application.load_server

config.action_mailer.delivery_method = :letter_opener
config.action_mailer.perform_deliveries = true