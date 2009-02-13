/**
 nkHaxeLibrary v0.7.0alpha
 Copyright (c) 2009 Kastellanos Nikos

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
 */

package nk.layoutManager.virtual;
import flash.display.DisplayObject;

class VirtualUtil 
{
	//return the virtual Width/Height if obj implements IVirtualSize
	//or the visual Width/Height if object is plain DisplayObject
	static public function Width(obj:DisplayObject):Float
	{
		if (Std.is(obj, IVirtualSize))
			return cast(obj, IVirtualSize).Width;
		return obj.width;
	}	
	static public function Height(obj:DisplayObject):Float
	{
		if (Std.is(obj, IVirtualSize)) 
			return cast(obj, IVirtualSize).Height;
		return obj.height;
	}
	
	//return the virtual Left/Top if obj implements IVirtualPosition
	//or the visual x/y if object is plain DisplayObject
	static public function Left(obj:DisplayObject):Float
	{
		if (Std.is(obj, IVirtualPosition)) 
			return cast(obj, IVirtualPosition).Left;
		return obj.x;
	}
	static public function Top(obj:DisplayObject):Float
	{
		if (Std.is(obj, IVirtualPosition)) 
			return cast(obj, IVirtualPosition).Top;
		return obj.y;
	}
	
	
	
	
	
	
	
}