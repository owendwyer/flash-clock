/**
* @author: Owen Dwyer
* @author Email: odwyer@gmail.com
* date Jul/2011
*/

/**
* Flash spelling game for web or touch
*/

package com.opd.classes.ui{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	
	public class AboutPane extends MovieClip{
		
		public function AboutPane(){
			logo.addEventListener(MouseEvent.CLICK,clicker);
			logo.buttonMode=true;
		}
		
		private function clicker(e:MouseEvent){
			var myReq=new URLRequest('http://gamestolearnenglish.com');
			navigateToURL(myReq,'_blank');
		}
		
		public function deit(){
			logo.removeEventListener(MouseEvent.CLICK,clicker);
		}
	}
}