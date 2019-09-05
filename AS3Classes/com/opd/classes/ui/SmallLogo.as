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
	
	public class SmallLogo extends MovieClip{
		
		public function SmallLogo(){
			addEventListener(MouseEvent.CLICK,clicker);
			buttonMode=true;
		}
		
		private function clicker(e:MouseEvent){
			var myReq=new URLRequest('http://gamestolearnenglish.com');
			navigateToURL(myReq,'_blank');
		}
		
		public function deit(){
			removeEventListener(MouseEvent.CLICK,clicker);
		}
	}
}