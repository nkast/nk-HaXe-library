/**
 * ...
 * @author me
 */

package nk.tools;

class CompareString 
{

	public function new() 
	{		
	}	
	
	public static inline function CompareStr(a:String,b:String):Int
	{
		var i:Int = 0;
		var ca:String = a.charAt(i);
		var cb:String = b.charAt(i);
		
		if (ca == cb)
		{
			ca = a.charAt(1);
			cb = b.charAt(1);
		}
		
		return CompareChar(ca,cb);
	}
	
	public static inline function CompareChar(a:String,b:String):Int
	{
		a = NormalizeChar(a);
		b = NormalizeChar(b);
		
		return ( a.charCodeAt(0) - b.charCodeAt(0) );
	}
	
	public static inline function NormalizeChar(c:String):String
	{
		//c = c.toLowerCase();
		
		if (c == 'Ά') c = 'Α';
		if (c == 'Έ') c = 'Ε';
		if (c == 'Ό') c = 'Ο';
		if (c == 'Ή') c = 'Η';
		if (c == 'Ύ') c = 'Υ';
		if (c == 'Ώ') c = 'Ω';
		
		
		return c;
	}
	
	
}