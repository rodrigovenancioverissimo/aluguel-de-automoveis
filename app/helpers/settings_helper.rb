module SettingsHelper
  def self.getDelayToleranceInSeconds
    delayToleranceInSeconds = Setting.find_by_name('delay tolerance in minutes')
    if delayToleranceInSeconds.blank?
      delayToleranceInSeconds = 0
    else
      delayToleranceInSeconds = delayToleranceInSeconds.value.to_i
    end
    delayToleranceInSeconds = delayToleranceInSeconds * 60
  end
end
