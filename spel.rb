require "gosu"

class Game < Gosu::Window
    def initialize
        super(1280,720)
        self.caption = "Pandus"
        


        @Panda = Gosu::Image.new("media/img/panda.png")
        @x1 = 270
        @y1 = 180

        @Parrot = Gosu::Image.new("media/img/parrot.png")
        @x2 = 0
        @y2 = 0

        @Penguin = Gosu::Image.new("media/img/penguin.png")
        @x3 = 400
        @y3 = 300

        @pew = Gosu::Image.new("media/img/pew.png")
        @x4 = 275
        @y4 = 240
        
    end

    
    def update
        @x1 -= 5 if Gosu.button_down?(Gosu::KB_A)
        @x1 += 5 if Gosu.button_down?(Gosu::KB_D)
        @y1 -= 5 if Gosu.button_down?(Gosu::KB_W)
        @y1 += 5 if Gosu.button_down?(Gosu::KB_S)
        @x1 = @x1.clamp(0, width - @Panda.width)
        @y1 = @y1.clamp(0, height - @Panda.height)


        @x2 = mouse_x
        @y2 = mouse_y
        @x2 = @x2.clamp(0, width - @Parrot.width)
        @y2 = @y2.clamp(0, height - @Parrot.height)

        
        if Gosu.button_down?(Gosu::KB_SPACE)
            @x4 += 10
        else
            @x4 = @x1
            @y4 = @y1
        end
        @x4 = @x4.clamp(0, width - @pew.width)
        @y4 = @y4.clamp(0, height - @pew.height)
    end


    def draw
        @Panda.draw(@x1,@y1,0)
        @Parrot.draw(@x2,@y2,0)
        @Penguin.draw(@x3,@y3,0)
        @pew.draw(@x4,@y4,0)
        
    end



end

Game.new.show