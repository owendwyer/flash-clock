/**
* @author: Owen Dwyer
* @author Email: odwyer@gmail.com
* date Jul/2011
*/

/**
* Flash spelling game for web or touch
*/

package com.opd.classes.sound{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	
	public class globalControls extends MovieClip{
		private var _model:Model;
		private var mButState;
		
		public function globalControls($model:Model){
			_model=$model;
			mBut.buttonMode=true;
			mButState="on";
			mBut.cross.visible=false;
			mBut.addEventListener(MouseEvent.CLICK,mButClick);
			logo.addEventListener(MouseEvent.CLICK,clicker);
			logo.buttonMode=true;
		}
		
		private function clicker(e:MouseEvent){
			var myReq=new URLRequest('http://gamestolearnenglish.com');
			navigateToURL(myReq,'_blank');
		}
		
		private function mButClick(e:MouseEvent){
			if(mButState=="off"){
				mButState="on";
				mBut.cross.visible=false;
				_model.update(Model.MUSIC,"on");
			}else{
				mButState="off";
				mBut.cross.visible=true;
				_model.update(Model.MUSIC,"off");
			}
		}
		
		public function deit(){
			mBut.removeEventListener(MouseEvent.CLICK,mButClick);
			logo.removeEventListener(MouseEvent.CLICK,clicker);
		}
	}
}