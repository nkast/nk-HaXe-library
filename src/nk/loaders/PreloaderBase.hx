/**
 * ...
 * @author Kastellanos Nikos
 */

package nk.loaders;
import flash.display.Loader;
import flash.display.LoaderInfo;
import flash.display.MovieClip;
import flash.events.Event;
import flash.events.ProgressEvent;
import flash.Lib;
import flash.net.URLRequest;
import flash.system.ApplicationDomain;
import flash.system.LoaderContext;

class PreloaderBase 
{
	var startTime:Date;
	var lastTime:Date;
	var procTime:Date;
	
	var bar:MovieClip;
	var preloadBar:PreloadBar;
	var myLoader:Loader;
	
	var bytesLoaded:Int;
	var bytesTotal:Int;
	

	public function new() 
	{
		myLoader = new Loader();		
		var myRequest:URLRequest = new URLRequest(GetUrl());
		var ldrContext:LoaderContext = new LoaderContext(false, new ApplicationDomain());
		myLoader.load(myRequest,ldrContext);
		
		myLoader.contentLoaderInfo.addEventListener(Event.OPEN,_onOpen);
		myLoader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,_onProgress);
		myLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, _onComplete);
		Lib.current.addChild(myLoader);
		myLoader.visible = false;
		return;			
	}
	
	function GetUrl()
	{
		var src:String = "default.swf";
		var params:Dynamic<String> = cast(Lib.current.stage.loaderInfo,LoaderInfo).parameters;
		src = (params.src == null)?src:params.src;
		return src;
	}
	
	function onOpen():Void;
	function onProgress(ptc:Float):Void;
	function onComplete():Void;
	
	
	function _onOpen(evt:Event):Void 
	{
		startTime = Date.now();
		lastTime = startTime;
		bytesLoaded = 0;
		bytesTotal = 0;		
		onOpen();
	}

	function _onProgress(evt:ProgressEvent):Void
	{	
		var now:Date = Date.now();
		procTime = now; //TODO: I should copy. not ref.
		var d:Float = procTime.getTime() - lastTime.getTime();
		
		bytesLoaded = evt.bytesLoaded;
		bytesTotal = evt.bytesTotal;		
		var ptc:Float = evt.bytesLoaded / evt.bytesTotal;
		onProgress(ptc);
		
		lastTime = now;
	}
	
	function _onComplete(evt:Event):Void
	{
		var loader:Loader = evt.target.loader;
        var info:LoaderInfo = loader.contentLoaderInfo;		
		myLoader.visible = true;
		onComplete();
	}	
	
}