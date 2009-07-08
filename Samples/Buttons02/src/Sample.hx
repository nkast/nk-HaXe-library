/**
 * ...
 * @author Kastellanos Nikos
 */

package ;
import flash.display.MovieClip;
import nk.menu.BtnCollection;
import nk.menu.MenuContainerBase;

class Sample extends MovieClip
{
	var mcBtn01:Btn01;
	var mcBtn02:Btn02;
	var mcBtn03:Btn03;
	//var btnCollection:MenuContainerBase;
	var btnCollection:BtnCollection;

	public function new()
	{
		super();
		Init();
	}
	
	function Init()
	{	
		btnCollection = new BtnCollection();
		btnCollection.AddBtn(this.mcBtn01);
		btnCollection.AddBtn(this.mcBtn02);
		btnCollection.AddBtn(this.mcBtn03);
		
		
	}
	
	
}