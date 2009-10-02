/**
* ...
* @author Kastellanos Nikos
*/

package nk.menu;
import flash.display.MovieClip;
import flash.events.MouseEvent;
import flash.Lib;
import flash.net.URLRequest;
import flash.trace.Trace;
import haxe.Log;

class MenuBtnBase extends MovieClip
{
	public var Tag:Dynamic;
	public var parentContainer:MenuContainerBase;
	public var childContainer:MenuContainerBase;
	
	public var interactionState(default,default):MenuBtnInteractionState;
	public var selectionState(default,default):MenuSelectionState;
	
	private var url:String;
	private var target:String;
	
	public function new()
	{
		super();
		parentContainer = null;
		childContainer = null;
		interactionState = MenuBtnInteractionState.Normal;
		selectionState = MenuSelectionState.UnSelected;
		
		url = "";
		target = "";
		
		addEventListener(MouseEvent.MOUSE_OVER, MouseOver);
		addEventListener(MouseEvent.MOUSE_OUT, MouseOut);
		addEventListener(MouseEvent.CLICK, MouseClick);
	}
		
	public function SetUrl(url:String,target:String)
	{
		this.url = url;
		this.target = target;
		
	}
	
	private function MouseOver(evt:MouseEvent)
	{
		Activate();
	}
	
	private function MouseOut(evt:MouseEvent)
	{
		Deactivate();
	}
	
	private function MouseClick(evt:MouseEvent)
	{
		if (url == "") Select();
		else Lib.getURL(new URLRequest(url), target);
		
		return;
	}
	
	public function CreateChildContainer():MenuContainerBase
	{		
		return null;
	}
	
	public function AddMenuBtn(btn:MenuBtnBase)
	{
		if (childContainer == null) 
			childContainer = CreateChildContainer();
		childContainer.addChild(btn);
		childContainer.AddMenuBtn(btn);
		
		return;
	}
	
	//External. Only to be called from the user or mouse events. 
	public function Select():Void
	{
		SetSelectState();
		if(parentContainer != null)
		{
			parentContainer._propUp_MenuBtnSelected(this);
		}
	}
	
	//External. Only to be called from the user.
	public function Deselect():Void
	{
		SetDeselectState();
	}
	
	//External. Only to be called from the user or mouse events. 
	public function Activate():Void 
	{		
		SetActiveState();
		
		if (childContainer != null)
		{	//Propagate down
			childContainer._propDown_MenuBtnActivated();	
		}
		if (parentContainer != null)
		{
			parentContainer._propUp_MenuBtnActivated(this);
		}
		
		return;
	}
	
	//External. Only to be called from the user or mouse events.
	public function Deactivate():Void
	{
		SetDeactivateState();
		
		if (childContainer != null)
		{
			childContainer._propDown_MenuBtnDeactivated();
		}		
		if (parentContainer != null)
		{
			parentContainer._propUp_MenuBtnDeactivated();
		}
		
		return;
	}
	
	public function DeactivateAndClose():Void
	{
		SetDeactivateState();
		if (childContainer != null)
			childContainer.Close();
	}
	
	public function _propUp_MenuBtnSelected(menuContainer:MenuContainerBase)
	{
		if(parentContainer != null)
		{
			parentContainer._propUp_MenuBtnSelected(this);
		}
		
	}
	
	public function _propDown_MenuBtnSelected(menuContainer:MenuContainerBase)
	{		
		Deselect();
		if(childContainer != null)
		{
			childContainer._propDown_MenuBtnSelected(this);
		}
		
	}
	
	
	
	
	//Internal.
	private function SetSelectState()
	{
		buttonMode = false;
		removeEventListener(MouseEvent.CLICK, MouseClick);
		
		selectionState = MenuSelectionState.Selected;
		dispatchEvent(new MenuEvent(MenuEvent.BUTTON_SELECTED, this));
		dispatchEvent(new MenuEvent(MenuEvent.STATE_CHANGE, this));
	}
	
	//Internal.
	private function SetDeselectState()
	{
		buttonMode = true;		
		addEventListener(MouseEvent.CLICK, MouseClick);
		
		selectionState = MenuSelectionState.UnSelected;
		dispatchEvent(new MenuEvent(MenuEvent.STATE_CHANGE, this));
	}
	
	//Internal.
	private function SetDeactivateState()
	{
		if (interactionState == MenuBtnInteractionState.Normal) return;
		interactionState = MenuBtnInteractionState.Normal;
		dispatchEvent(new MenuEvent(MenuEvent.BUTTON_DEACTIVATED, this));
		dispatchEvent(new MenuEvent(MenuEvent.STATE_CHANGE, this));
	}
	//Internal.
	private function SetActiveState()
	{
		if (interactionState == MenuBtnInteractionState.Active) return;
		interactionState = MenuBtnInteractionState.Active;
		dispatchEvent(new MenuEvent(MenuEvent.BUTTON_ACTIVATED, this));
		dispatchEvent(new MenuEvent(MenuEvent.STATE_CHANGE, this));
	}	
	//Internal.
	private function SetActiveFromChildState()
	{
		if (interactionState == MenuBtnInteractionState.ActiveFromChild) return;
		interactionState = MenuBtnInteractionState.ActiveFromChild;
		dispatchEvent(new MenuEvent(MenuEvent.BUTTON_DEACTIVATED, this));
		dispatchEvent(new MenuEvent(MenuEvent.STATE_CHANGE, this));
	}
	
	
	
	
}