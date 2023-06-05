def test_data
  @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
  @disney = AmusementPark.create!(name: 'Disney Land', admission_cost: 150)

  @ride1 = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: false)
  @ride2 = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 5, open: false)

  @ride3 = @disney.rides.create!(name: 'Ferris Wheel', thrill_rating: 1, open: false)
  @ride4 = @disney.rides.create!(name: 'Tea Cups', thrill_rating: 2, open: false)

  @mech1 = Mechanic.create!(name: 'Kara Smith', years_experience: 11)
  @mech2 = Mechanic.create!(name: 'Jim Bob', years_experience: 40)
  @mech3 = Mechanic.create!(name: 'Phil Philson', years_experience: 5)
  @mech4 = Mechanic.create!(name: 'Tim Thomson', years_experience: 10)

  RideMechanic.create!(ride: @ride1, mechanic: @mech1)
  RideMechanic.create!(ride: @ride1, mechanic: @mech2)

  RideMechanic.create!(ride: @ride2, mechanic: @mech1)

  RideMechanic.create!(ride: @ride3, mechanic: @mech3)
  
  RideMechanic.create!(ride: @ride4, mechanic: @mech4)
end


# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
SimpleCov.start
require_relative '../config/environment'
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://rspec.info/features/6-0/rspec-rails
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end