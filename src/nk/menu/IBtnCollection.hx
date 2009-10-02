/**
 * ...
 * @author Kastellanos Nikos
 */

package nk.menu;

interface IBtnCollection 
{	
	private var btnList(default,null):Array<MenuBtnBase>;
	
	public function AddBtn(menuBtn:MenuBtnBase):MenuBtnBase;	
	public function GetBtnList():Array<MenuBtnBase>;
	
	public function SelectFirstBtn():Void;
	public function SelectLastBtn():Void;
	public function UnselectAll():Void;
	
	

	
}