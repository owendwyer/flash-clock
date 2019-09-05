package com.opd.classes.ui
{
	import flash.display.*;
	import flash.events.*;
	public class ButEffects extends MovieClip
	{
		public function addLists(inArray){
			for each (var i:MovieClip in inArray){
				i.buttonMode=true;
				i.addEventListener(MouseEvent.MOUSE_OVER, overer);
				i.addEventListener(MouseEvent.MOUSE_OUT, outer);
				i.addEventListener(MouseEvent.CLICK, clicker);
			}
		}
		
		public function removeLists(inArray){
			for each (var i:MovieClip in inArray){
				i.buttonMode=false;
				i.removeEventListener(MouseEvent.MOUSE_OVER, overer);
				i.removeEventListener(MouseEvent.MOUSE_OUT, outer);
				i.removeEventListener(MouseEvent.CLICK, clicker);
			}
		}
		
		public function overer(e:Event){
			var myPar=this.parent as Object;
			myPar.overer(e);
		}
		
		public function outer(e:Event){
			var myPar=this.parent as Object;
			myPar.outer(e);
		}
		
		public function clicker(e:Event){
			var myPar=this.parent as Object;
			myPar.clicker(e);
		}
	}
}