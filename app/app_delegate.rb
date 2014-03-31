class AppDelegate < PM::Delegate
  include PM::Styling
  status_bar true, animation: :none

  def on_load(app, options)
    appearance
    open HomeScreen.new(nav_bar: true)
  end

  def appearance
    nav_bar = UINavigationBar.appearance
    nav_bar.setBarStyle UIBarStyleBlack
    nav_bar.setBarTintColor "#15adca".to_color
    nav_bar.setTintColor UIColor.whiteColor
    nav_bar.setTitleTextAttributes({
      UITextAttributeTextColor => UIColor.whiteColor
    })
  end
end
