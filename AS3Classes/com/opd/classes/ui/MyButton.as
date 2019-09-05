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
	import flash.filters.BevelFilter;
	import flash.filters.GlowFilter;
	import com.greensock.*;
	
	public class MyButton extends MovieClip{
		private var callBackFun;
		private var myBev=new BevelFilter;
		private var myGlow=new GlowFilter;
		
		public function init($callBack){
			this.buttonMode=true;
			callBackFun=$callBack;
			addEventListener(MouseEvent.CLICK,callBackFun);
			addEventListener(MouseEvent.MOUSE_OVER,overer);
			addEventListener(MouseEvent.MOUSE_OUT,outer);
			back.alpha=0;
			myBev.distance=1;
			myGlow.blurX=2;
			myGlow.blurY=2;
			myGlow.inner=true;
			myGlow.color=0xffff00;
			main.filters=[myBev];
			back.filters=[myBev,myGlow];
		}
		
		private function overer(e:MouseEvent){
			TweenLite.to(main,0.4,{alpha:0});
			TweenLite.to(back,0.4,{alpha:1});
		}
		
		private function outer(e:MouseEvent){
			TweenLite.to(main,0.4,{alpha:1});
			TweenLite.to(back,0.4,{alpha:0});
		}
		
		public function deit(){
			TweenLite.killTweensOf(main);
			TweenLite.killTweensOf(back);
			removeEventListener(MouseEvent.CLICK,callBackFun);
			removeEventListener(MouseEvent.MOUSE_OVER,overer);
			removeEventListener(MouseEvent.MOUSE_OUT,outer);
			this.buttonMode=false;
		}
	}
}