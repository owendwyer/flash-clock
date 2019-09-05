//goog
package com.opd.classes.ui 
{
    import flash.display.*;
    import flash.events.*;
    
    public class GoogleLogo extends flash.display.MovieClip
    {
		public function init(){
			buttonMode=true;
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
			buttonMode=false;
			removeEventListener(MouseEvent.MOUSE_OVER,overer);
			removeEventListener(MouseEvent.MOUSE_OUT,outer);
		}
    }
}


