/**
 * ...
 * @author Kastellanos Nikos
 */

package ;
import flash.display.MovieClip;
import nk.menu.MenuContainerBase;

class Sample extends MovieClip
{
	var mcBtn01:Btn01;
	var mcBtn02:Btn02;
	var mcBtn03:Btn03;
	var btnColection:MenuContainerBase;

	public function new()
	{
		super();
		Init();
	}
	
	function Init()
	{
		btnColection = new MenuContainerBase(null);
		btnColection.AddMenuBtn(this.mcBtn01);
		btnColection.AddMenuBtn(this.mcBtn02);
		btnColection.AddMenuBtn(this.mcBtn03);
		
	}
	
	
}