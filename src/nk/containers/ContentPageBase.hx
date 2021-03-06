﻿/**
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

package nk.containers;
import flash.display.MovieClip;

class ContentPageBase extends MovieClip, implements IContentPage
{
	public var CPState(default, null):ContentPageState;
	public function GetCPState():ContentPageState { return CPState; }

	public function new()
	{
		super();
		CPState = ContentPageState.Init;
	}
	
	private function onBegin() { }
	private function onEnd() { }
	
	public function Begin()
	{
		CPState = ContentPageState.Begin;
		onBegin();
	}
	
	public function End()
	{
		CPState = ContentPageState.End;
		dispatchEvent(new ContainersEvent(ContainersEvent.CONTENTPAGE_END_STARTED));
		onEnd();
	}
	
	private function onEndComplete()
	{
		trace("onEndComplete " + this.name);
		dispatchEvent(new ContainersEvent(ContainersEvent.CONTENTPAGE_END_FINISHED));
	}
	
}