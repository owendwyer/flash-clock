/**
* @author: Owen Dwyer
* @author Email: odwyer@gmail.com
* date Oct/13/2010
*/

/**
* Clock you can adjust and have time displayed
*/
package View.Start{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class InteractiveClock_hand extends MovieClip{
		
		private var callBackFun;
		private var callBackFun2;
		
		public function init($callBack){
			callBackFun=$callBack;
			this.buttonMode=true;
			addEventListener(MouseEvent.MOUSE_DOWN,downer);
			addEventListener(MouseEvent.MOUSE_OVER,overer);
			addEventListener(MouseEvent.MOUSE_OUT,outer);
			gotoAndStop(1);
		}
		
		private function downer(e:MouseEvent){
			removeEventListener(MouseEvent.MOUSE_DOWN,downer);
			removeEventListener(MouseEvent.MOUSE_OVER,overer);
			removeEventListener(MouseEvent.MOUSE_OUT,outer);
			gotoAndStop(2);
			callBackFun();
		}
		
		public function rAddList(){
			addEventListener(MouseEvent.MOUSE_DOWN,downer);
			addEventListener(MouseEvent.MOUSE_OVER,overer);
			addEventListener(MouseEvent.MOUSE_OUT,outer);
			gotoAndStop(1);
		}
		
		private function overer(e:MouseEvent){
			gotoAndStop(2);
		}
		
		private function outer(e:MouseEvent){
			gotoAndStop(1);
		}
		
		public function deit(){
			removeEventListener(MouseEvent.MOUSE_DOWN,downer);
			removeEventListener(MouseEvent.MOUSE_OVER,overer);
			removeEventListener(MouseEvent.MOUSE_OUT,outer);
			this.buttonMode=false;
		}
	}
}