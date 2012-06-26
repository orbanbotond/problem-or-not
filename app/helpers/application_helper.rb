module ApplicationHelper
  def oauth_login_path provider
    "/auth/#{provider.to_s}"
  end
end

module Time
  class Formatter.rules do
    less_than 1.minute, :display => "Just now"

    no_more_than 1.hour do
      resolution 5.minute do |minute|
        pattern "#{minute} #{'minute'.pluralize(minute)} ago"
      end
    end

    no_more_than 12.hours do
      resolution 1.hour do |hour|
        pattern "#{hour} #{'hour'.pluralize(hour)} ago"
      end
    end

    no_more_than 24.hours, :display => "today"
    no_more_than 48.hours, :display => "yesterday"
    no_more_than 72.hours, :display => "the day before yesterday"

    no_more_than 1.week do
      resolution 1.day do |day|
        pattern "#{day} #{'day'.pluralize(day)} ago"
      end
    end

    no_more_than 1.months do
      resolution 1.week do |week|
        pattern "#{week} #{'week'.pluralize(week)} ago"
      end
    end

    no_more_than 6.months do
      resolution 1.month do |month|
        pattern "#{month} #{'month'.pluralize(month)} ago"
      end
    end

    no_more_than 9.months, :display => "More than half year ago"

    no_more_than 1.year, :display => "Almost one year ago"

    no_more_than 16.months, :display => "More than a year ago"

    no_more_than 18.months, :display => "One and half year ago"

    no_more_than 24.months, :display => "Two years ago"
  end
end

# There should be a simple DSL for setting up the above examples:

# Within 1 minute: "Just now"
# 1-5: 1 minute ago  (>= 1.minute && 90.seconds < 2.minute)
# Approximately:  5 minutes ago (5.minutes && 6.minutes < 10.minutes)
# Approximately: 10 minutes ago
# 15
# 20
# 25...
# 1 hour ago.
# 11 hours ago
# today
# yesterday...
# day before yesterday
# 2 days ago
# 3 days ago
# 4 days ago
# 
# 1 week ago
# 2 weeks ago
# 3 weeks ago
# 1 month ago
# 2 month ago
# 
# 1 year ago (1-2 year ago)
# 2 year ago
# 
# There should be a simple DSL for setting up the above examples: