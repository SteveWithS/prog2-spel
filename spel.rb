require "gosu"

class Game < Gosu::Window
    def initialize
        super(1280,720)
        self.caption = "Pandus"
        @Panda = Gosu::Image.new("media/img/panda.png")
        @x = 270
        @y = 180
        
    end

    def update
        @x -= 5 if Gosu.button_down?(Gosu::KB_LEFT)
        @x += 5 if Gosu.button_down?(Gosu::KB_RIGHT)
        @y -= 5 if Gosu.button_down?(Gosu::KB_UP)
        @y += 5 if Gosu.button_down?(Gosu::KB_DOWN)
        @x = @x.clamp(0, width - @Panda.width)
        @y = @y.clamp(0, height - @Panda.height)
    end

    def draw

        @Panda.draw(@x,@y,0)
    end
end

Game.new.show