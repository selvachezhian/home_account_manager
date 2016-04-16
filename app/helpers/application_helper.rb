# :nodoc:
module ApplicationHelper
  unless const_defined?(:ALERT_TYPES)
    ALERT_TYPES = [:success, :info, :warning, :danger].freeze
  end

  def bootstrap_notify(_options = {})
    flash_messages = []
    flash.each do |type, message|
      # Skip empty messages,
      # e.g. for devise messages set to nothing in a locale file.
      next if message.blank?
      type = types(type)

      next unless ALERT_TYPES.include?(type)

      flash_messages << flash_message(message)
    end
    flash_messages.join("\n").html_safe
  end

  def types(type)
    type = type.to_sym
    type = :success if type == :notice
    type = :danger  if type == :alert
    type = :danger  if type == :error
    type
  end

  def flash_message(message)
    messages = Array(message).map do |msg|
      text = "<script type='text/javascript'>"
      text += "bootstrap_notify_js('', '#{msg}', '#{type}');"
      text += '</script>'
      text if msg
    end
    messages.compact
  end
end
