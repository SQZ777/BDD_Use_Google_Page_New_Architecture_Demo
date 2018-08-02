class Platform
  def initialize
    @platform = "desktop"
    ARGV.each do |argv|
      @platform = argv.sub("pf=", "") if argv.start_with?("pf=")
    end
  end

  def automation_name
    if @platform.eql? "android"
      "uiautomator2"
    elsif @platform.eql? "iOS"
      "XCUITest"
    end
  end

  def device_name
    if @platform.eql? "android"
      "emulator-5554"
    elsif @platform.eql? "iOS"
      "iPhone7"
    end
  end

  def version
    if @platform.eql? "android"
      "7.1.1"
    elsif @platform.eql? "iOS"
      "11.3"
    end
  end

  def platform
    @platform
  end
end
