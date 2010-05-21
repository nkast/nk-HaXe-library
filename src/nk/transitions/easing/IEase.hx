/**
 * ...
 * @author Kastellanos Nikos
 */

package nk.transitions.easing;

class IEase 
{
	public function new() 
	{
		inline static function easeIn    ( t:Float, b:Float, c:Float, d:Float ):Float;
		inline static function easeInOut ( t:Float, b:Float, c:Float, d:Float ):Float;
		inline static function easeOut   ( t:Float, b:Float, c:Float, d:Float ):Float;		
	}
}