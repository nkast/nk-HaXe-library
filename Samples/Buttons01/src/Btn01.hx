/**
 * ...
 * @author Kastellanos Nikos
 */
package ;
import nk.menu.MenuBtnBase;

class Btn01 extends MenuBtnBase
{

	public function new() 
	{
		super();
		this.buttonMode = true;
		SetUrl("http://www.google.com/q=btn1","_blank");
	}
	
}