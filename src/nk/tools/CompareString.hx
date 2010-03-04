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
		var c:Int =0;
		
		while( c==0 && i<a.length)
		{
			var ca:String = a.charAt(i);
			var cb:String = b.charAt(i);
			i++;
			c = CompareChar(ca, cb);
		}
		
		return c;
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
		if (c == 'Ί') c = 'Ι';
		if (c == 'Ύ') c = 'Υ';
		if (c == 'Ώ') c = 'Ω';
		if (c == 'ά') c = 'α';
		if (c == 'έ') c = 'ε';
		if (c == 'ό') c = 'ο';
		if (c == 'ή') c = 'η';
		if (c == 'ί') c = 'ι';
		if (c == 'ύ') c = 'υ';
		if (c == 'ώ') c = 'ω';
		
		
		return c;
	}
	
	
}