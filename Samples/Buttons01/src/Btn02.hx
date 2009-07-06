/**
 * ...
 * @author Kastellanos Nikos
 */

package ;
import flash.events.MouseEvent;
import nk.menu.MenuBtnBase;
import nk.menu.MenuEvent;
import nk.menu.MenuSelectionState;

class Btn02  extends MenuBtnBase
{

	public function new() 
	{
		super();
		stop();		
		buttonMode = true;
		addEventListener(MenuEvent.BUTTON_SELECTED, onSelected);
	}
	
	function onSelected(evt:MenuEvent)
	{		
		if (this.selectionState == MenuSelectionState.Selected)
			gotoAndStop(2);
		else gotoAndStop(1);
		
		buttonMode = true;		
	}
	
	
	
}