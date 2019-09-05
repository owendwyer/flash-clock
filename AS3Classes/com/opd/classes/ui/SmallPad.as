/**
* @author: Owen Dwyer
* @author Email: odwyer@gmail.com
* date May/2011
*/

/**
* Flash game for Interactive Whiteboard
*/



package com.opd.classes.ui{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import flash.geom.Point;
	public class SmallPad extends MovieClip{
		private var newPad;
		private var nowOver;
		
		public function init(){
			addEventListener(MouseEvent.MOUSE_DOWN,downer);
			buttonMode=true;
			newPad=new MovieClip();
			addChild(newPad);
		}
		
		private function downer(e:MouseEvent){
			newPad.graphics.lineStyle(4, 0x666666);
			newPad.graphics.moveTo(mouseX,mouseY);
			addEventListener(Event.ENTER_FRAME,drawLine);
			stage.addEventListener(MouseEvent.MOUSE_UP,upper);
			addEventListener(MouseEvent.ROLL_OUT,overOut);
			addEventListener(MouseEvent.ROLL_OVER,overOn);
			nowOver=true;
		}
		
		private function overOut(e:MouseEvent){
			nowOver=false;
		}
		
		private function overOn(e:MouseEvent){
			newPad.graphics.moveTo(mouseX,mouseY);
			nowOver=true;
		}
		
		private function drawLine(e:Event){
			if(nowOver==true){
				newPad.graphics.lineTo(mouseX,mouseY);
			}
		}
		
		private function upper(e:MouseEvent){
			removeEventListener(Event.ENTER_FRAME,drawLine);
			stage.removeEventListener(MouseEvent.MOUSE_UP,upper);
			removeEventListener(MouseEvent.ROLL_OUT,overOut);
			removeEventListener(MouseEvent.ROLL_OVER,overOn);
		}
		
		public function deit(){
			removeEventListener(Event.ENTER_FRAME,drawLine);
			removeEventListener(MouseEvent.MOUSE_DOWN,downer);
		}
	}
}