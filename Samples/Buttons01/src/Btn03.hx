/**
 * ...
 * @author Kastellanos Nikos
 */

package ;
import flash.filters.DropShadowFilter;
import nk.menu.MenuBtnBase;
import nk.menu.MenuEvent;
import nk.menu.MenuBtnInteractionState;
import nk.menu.MenuSelectionState;

class Btn03 extends MenuBtnBase 
{
	public function new() 
	{
		super();
		stop();		
		buttonMode = true;
		addEventListener(MenuEvent.STATE_CHANGE, onStateChange);		
	}
	
	
	function onStateChange(evt:MenuEvent)
	{	
		if (this.selectionState == MenuSelectionState.Selected)
		{
			if (this.interactionState == MenuBtnInteractionState.Active)
				gotoAndStop(4);
			else 
				gotoAndStop(3);
		}
		else
		{
			if (this.interactionState == MenuBtnInteractionState.Active)
				gotoAndStop(2);
			else 
				gotoAndStop(1);

		}
		buttonMode = true;		
	}
	
	
	
}