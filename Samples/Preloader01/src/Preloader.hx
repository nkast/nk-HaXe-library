/**
* ...
* @author Kastellanos Nikos
*/
package ;
import flash.Lib;
import nk.loaders.PreloaderBase;


class Preloader extends PreloaderBase
{
	
	public static function main()
	{
		new Preloader();
	}
	
	override function onOpen():Void 
	{
		preloadBar = new PreloadBar();
		Lib.current.addChild(preloadBar);
		preloadBar.x = (Lib.current.stage.stageWidth - preloadBar.width)/2;
		preloadBar.y = (Lib.current.stage.stageHeight - preloadBar.height) / 2;
	}
	
	override function onProgress(ptc:Float):Void
	{
		preloadBar.iBar.scaleX = ptc;
		if (ptc == 1)
			flash.Lib.current.removeChild(preloadBar);
		return;
	}

}