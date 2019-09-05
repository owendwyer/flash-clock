/**
* @author: Owen Dwyer
* @author Email: odwyer@gmail.com
* date Oct/13/2010
*/

/**
* Generic button
*/
package com.opd.classes.ui{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import com.greensock.*;
	
	public class MyButtonNoFade extends MovieClip{
		private var callBackFun;
		
		public function init($callBack){
			this.buttonMode=true;
			callBackFun=$callBack;
			addEventListener(MouseEvent.CLICK,callBackFun);
			addEventListener(MouseEvent.MOUSE_OVER,overer);
			addEventListener(MouseEvent.MOUSE_OUT,outer);
			//back.alpha=0;
		}
		
		private function overer(e:MouseEvent){
			//TweenLite.to(main,1,{alpha:0});
			//TweenLite.to(back,1,{alpha:1});
		}
		
		private function outer(e:MouseEvent){
			//TweenLite.to(main,1,{alpha:1});
			//TweenLite.to(back,1,{alpha:0});
		}
		
		public function deit(){
			//TweenLite.killTweensOf(main);
			//TweenLite.killTweensOf(back);
			removeEventListener(MouseEvent.CLICK,callBackFun);
			removeEventListener(MouseEvent.MOUSE_OVER,overer);
			removeEventListener(MouseEvent.MOUSE_OUT,outer);
			this.buttonMode=false;
		}
	}
}