package feffects;

typedef Easing = Float -> Float -> Float -> Float -> Float

/**
* Class that allows tweening numerical values of an object.<br/>
* Usage :<br/>
* import feffects.Tween;<br/>
* import feffects.easing.Elastic;<br/>
* ...<br/>
* var t = new Tween( myObject, 0, 100, 2000 );<br/>
* t.setEasing( Elastic.easeIn );<br/>
* t.setTweenHandlers( update, end );<br/>
* t.start();
*/
class Tween
{
	static var aTweens	= new Array<Tween>();
	static var interval	= 10;
	static var timer	: haxe.Timer;
	
	var listener		: Dynamic;
	var initVal			: Float;
	var endVal			: Float;
	var duration 		: Int;
	var startTime		: Float;

	var updateFunc		: Dynamic;
	var endFunc			: Dynamic;
	var easingF			: Easing;
	var ID				: Int;
	
	
	static function AddTween( tween : Tween ) : Void
	{
		tween.ID = aTweens.length ;
		aTweens.push( tween ) ;
		
		timer.run = DispatchTweens;
	}

	static function RemoveTweenAt( index : Null<Int> ) : Void
	{
		if ( index >= aTweens.length || index < 0 || index == null )
			return;
		aTweens.splice( index, 1 );
		
		
		var tmp = index ;
		
		while ( tmp < aTweens.length )
		{
			aTweens[ tmp ].ID--;
			tmp ++ ;
		}
			
		if ( aTweens.length == 0 )
		{
			timer.stop() ;
			timer = null ;
		}
	}

	static function DispatchTweens() : Void
	{
		var i = 0 ;
		while ( i < aTweens.length )
		{
			aTweens[ i ].doInterval();
			i++ ;
		}
	}
	
	/**
	* Create a tween using the [listenerObj] to call events, from the [init] value, to the [end] value, while [dur] (in ms)<br />
	* There is a default easing equation.
	*/
	
	public function new( listenerObj : Dynamic, init : Float, end : Float, dur : Int )
	{
		if ( listenerObj == null )
			return;
		
		listener = listenerObj;
		initVal = init;
		endVal = end;
		duration = dur;
					
		easingF = easingEquation;
	}
	
	public function start()
	{
		if( timer != null )
			timer.stop();
		timer = new haxe.Timer( interval ) ;	
		#if flash
			startTime = flash.Lib.getTimer();
		#else js
			startTime = Date.now().getTime();
		#end
		
		if ( duration == 0 )
			endTween();
		else
			Tween.AddTween( this );
	}
	
	public function stop()
	{
		Tween.RemoveTweenAt( ID );
	}
	
	function doInterval()
	{
		#if flash
			var stamp = flash.Lib.getTimer();
		#else js
			var stamp = Date.now().getTime();
		#end
		var curTime = stamp - startTime;
		var curVal = getCurVal( curTime );
		if ( curTime >= duration )
			endTween();
		else
			if ( updateFunc != null )
				Reflect.callMethod( listener, updateFunc, [ curVal ] );
			else
				listener.onTweenUpdate( curVal );
	}

	function getCurVal( curTime )
	{
		return easingF( curTime, initVal, endVal - initVal, duration );
	}

	function endTween()
	{
		RemoveTweenAt( ID );
		
		if ( updateFunc != null )
				Reflect.callMethod( listener, updateFunc, [ endVal ] );
			else
				listener.onTweenUpdate( endVal );
		
		if ( endFunc != null )
			Reflect.callMethod( listener, endFunc, [ endVal ] );
		else
			listener.onTweenEnd( endVal );
	}

	/**
	* Set the [update] event when the value is tweening, and the [end] value when it finished
	*/
	
	public function setTweenHandlers( update : Float -> Dynamic, end : Float -> Dynamic )
	{
		updateFunc = update;
		endFunc = end;
	}
	
	/**
	* Set the [easingFunc] equation to use for tweening
	*/
	
	public function setEasing( easingFunc : Easing )
	{
		if ( easingFunc != null )
			easingF = easingFunc;
	}

	function easingEquation( t : Float, b : Float, c : Float, d : Float ) : Float
	{
		return c / 2 * ( Math.sin( Math.PI * ( t / d - 0.5 ) ) + 1 ) + b;
	}
}