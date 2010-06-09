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

package nk.containers;
import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.EventDispatcher;

class ContainerMgr extends EventDispatcher
{
	private var container:Sprite;
	private var items:Array<DisplayObject>;
	
	public function new(container:Sprite)
	{
		super();
		this.container = container;
		items = new Array<DisplayObject>();
	}
	
	public function AddContent(content:DisplayObject):DisplayObject
	{
		var cp:IContentPage = GetContentPage(content);
		
		EndAll();
		
		if (cp != null)
		{
			container.addChild(content);
			items.push(content);
			if (items.length == 1)
			{
				cp.Begin();
			}
		}
		else 
		{
			container.addChild(content);
			items.push(content);
		}
		
		content.addEventListener(ContainersEvent.CONTENTPAGE_END_FINISHED, onContentPageFinished);
		return content;
	}
	
	public function EndAll():Void
	{
		for (mc in items)
		{
			var cp:IContentPage = GetContentPage(mc);
			if(cp!=null)
			{
				if(cp.CPState==ContentPageState.Begin)
				cp.End();
			} 
			else
			{		
				items.remove(mc);
				if(container.contains(mc)) container.removeChild(mc);
			}
		}
		
		if(items.length == 0)
			dispatchEvent(new ContainersEvent(ContainersEvent.CONTAINER_ENDALL));
		
		return;
	}
	
	private function onContentPageFinished(evt:ContainersEvent)
	{
		var mc:Sprite = cast(evt.target,Sprite);
	
		//remove finished movie from container
		items.remove(mc);
		if(container.contains(mc)) container.removeChild(mc);
		
		//begin next movie
		for (mc in items)
		{
			var cp:IContentPage = GetContentPage(mc);	
			if(cp!=null)
			{
				if (cp.GetCPState() == ContentPageState.Begin) return;
				if (cp.GetCPState() == ContentPageState.Init) cp.Begin();
			}
		}
		
		if (items.length == 0)
			dispatchEvent(new ContainersEvent(ContainersEvent.CONTAINER_ENDALL));
			
		return;
	}
	
	function GetContentPage(content:DisplayObject):IContentPage
	{
		var cp:IContentPage = null;
		try { cp = cast( content, IContentPage); } catch(msg:String){}
		return cp;
	}

}