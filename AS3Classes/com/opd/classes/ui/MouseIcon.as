
package com.opd.classes.ui{
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.ui.Mouse;
	public class MouseIcon extends MovieClip{
		public function MouseIcon(){
			addEventListener(MouseEvent.CLICK,clicker);
			buttonMode=true;
			block.alpha=0;
		}
		
		private function clicker(e:MouseEvent){
			if(block.alpha==0){
				block.alpha=1;
				mose.alpha=0;
				Mouse.hide();
			}else{
				block.alpha=0;
				mose.alpha=1;
				Mouse.show();
			}
		}
	}
}