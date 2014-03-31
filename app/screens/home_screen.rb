class HomeScreen < PM::Screen
  include HomeStyles

  title "Home"

  def on_load
    set_attributes self.view, main_view_style
    @scroll = add UIScrollView.alloc.initWithFrame(self.view.bounds)

    add_to @scroll, UILabel.new, :label_style
    add_to @scroll, Tile.new, { frame: [[  20,  40 ], [ 130, 130 ]] }
    add_to @scroll, Tile.new, { frame: [[ 170,  40 ], [ 130, 130 ]] }
    add_to @scroll, Tile.new, { frame: [[  20, 190 ], [ 130, 130 ]] }
    add_to @scroll, Tile.new, { frame: [[ 170, 190 ], [ 130, 130 ]] }
    add_to @scroll, Tile.new, { frame: [[  20, 340 ], [ 130, 130 ]] }
    add_to @scroll, Tile.new, { frame: [[ 170, 340 ], [ 130, 130 ]] }

    set_nav_bar_button :right, system_icon: :add, action: :add_note


    button =  UIButton.buttonWithType(UIButtonTypeCustom)
    button.setImage(UIImage.imageNamed("abc"), forState:UIControlStateNormal)
    button.addTarget(self, action: :tapped_logo, forControlEvents:UIControlEventTouchUpInside)
    button.setFrame [[ 0, 0 ], [ 32, 32 ]]
    set_nav_bar_button :left, button: UIBarButtonItem.alloc.initWithCustomView(button)
  end

  def will_appear
    @scroll.frame = self.view.bounds
    @scroll.contentSize = [ @scroll.frame.size.width, content_height(@scroll) + 20 ]
  end

  def add_note
    open AddNoteScreen
  end

  def tapped_logo
    App.alert('hey')
  end

end
