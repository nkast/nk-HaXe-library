/**
 * ...
 * @author Kastellanos Nikolaos
 */

package nk.tools;
import flash.display.Sprite;
import flash.events.Event;
import flash.Lib;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

class FPS extends Sprite
{
	private var last:UInt;
    private var ticks:UInt;
    private var tf:TextField;
	var format:TextFormat ;
	
	public function new(xPos:Int = 0, yPos:Int = 0, color:UInt = 0xffffff, fillBackground:Bool = false, backgroundColor:UInt = 0x000000)
	{
		super();
		last = Lib.getTimer();
		ticks = 0;
		
		this.x = xPos;
        this.y = yPos;
        tf = new TextField();
        tf.textColor = color;
        tf.text = "00.0 fps";
        tf.selectable = false;
        tf.background = fillBackground;
        tf.backgroundColor = backgroundColor;
        tf.autoSize = TextFieldAutoSize.LEFT;
        addChild(tf);
        width = tf.textWidth;
        height = tf.textHeight;
			
		format = new TextFormat("verdana", 16, color, true);
		tf.setTextFormat(format);		
		
        addEventListener(Event.ENTER_FRAME, onEnterFrame);

		return;
	}
	
	public function onEnterFrame(evt:Event):Void 
	{
        ticks++;
        var now:UInt = Lib.getTimer();
        var delta:UInt = now - last;
        if (delta >= 1000) 
		{          
            var fps:Float = ticks / delta * 1000;
            tf.text = untyped fps.toFixed(1) + " fps";
            ticks = 0;
            last = now;			
        }
		
		tf.setTextFormat(format);
		
	}
	
	
}