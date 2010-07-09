/**
 * ...
 * @author Kastellanos Nikos
 */

package nk.menu;
import flash.events.EventDispatcher;

class BtnCollection extends EventDispatcher, implements IBtnCollection
{
	private var btnList(default,null):Array<MenuBtnBase>;
	
	public function new()
	{
		super();
		btnList = new Array<MenuBtnBase>();
	}
	
	public function AddBtn(menuBtn:MenuBtnBase):MenuBtnBase
	{
		btnList.push(menuBtn);
		
		// Add events 
		menuBtn.addEventListener(MenuEvent.BUTTON_SELECTED, onBtnSelected);		
		
		dispatchEvent(new MenuEvent(MenuEvent.BUTTON_ADDED, menuBtn));
		
		return menuBtn;
	}
	
	public function GetBtnList():Array<MenuBtnBase>
	{
		return btnList;
	}
	
	public function SelectFirstBtn():Void
	{
		if (btnList.length > 0)
			btnList[0].Select();
	}
	
	public function SelectLastBtn():Void
	{		
		if (btnList.length > 0)		
			btnList[btnList.length-1].Select();
	}
	
	public function UnselectAll():Void
	{
		
	}
	
	// Add events 
	private function onBtnSelected(evt:MenuEvent)
	{
		var selectedBtn:MenuBtnBase = evt.SourceBtn;
		
		//deselect all sliblings of calling menuBtn
		var itemBtn:MenuBtnBase;
		for(itemBtn in btnList)
		{
			if (selectedBtn == itemBtn) continue;
			itemBtn._propDown_MenuBtnSelected(null);
		}
		
		//dispatch the selected btn
		dispatchEvent(new MenuEvent(MenuEvent.BUTTON_SELECTED, selectedBtn));
		
		return;
	}

	
}