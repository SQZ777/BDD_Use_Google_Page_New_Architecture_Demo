require "rubygems"
require "selenium-cucumber"
require_relative "../base/platform.rb"

$start_up_platform = Platform.new

# Store command line arguments
$browser_type = ENV["BROWSER"] || "chrome"
$platform = ENV["PLATFORM"] || $start_up_platform.platform
$os_version = ENV["OS_VERSION"] || $start_up_platform.version
$device_name = ENV["DEVICE_NAME"] || $start_up_platform.device_name
$automation_name = ENV["AUTOMATION_NAME"] || $start_up_platform.automation_name
$udid = ENV["UDID"]
$appium_port = ENV["PORT"] || 4723
# if you are android or iOS you need to set .apk path!
$app_path = ENV["APP_PATH"]

# check for valid parameters
validate_parameters $platform, $browser_type, $app_path

# If platform is android or ios create driver instance for mobile browser
if $platform == "android" or $platform == "iOS"
  if $browser_type == "native"
    $browser_type = "Browser"
  end

  if $platform == "android"
    $device_name, $os_version = get_device_info
  end

  desired_caps = {
    caps: {
      platformName: $platform,
      versionNumber: $os_version,
      deviceName: $device_name,
      udid: $udid,
      app: ".//#{$app_path}",
      noReset: true,
      automationName: $automation_name,
      unicodeKeyboard: true,
      resetKeyboard: true,
    },
    appium_lib: {
      port: $appium_port,
    },
  }

  begin
    $driver = Appium::Driver.new(desired_caps).start_driver
  rescue Exception => e
    puts e.message
    Process.exit(0)
  end
else # else create driver instance for desktop browser
  begin
    $driver = Selenium::WebDriver.for(:"#{$browser_type}")
    $driver.manage().window().maximize()
  rescue Exception => e
    puts e.message
    Process.exit(0)
  end
end
