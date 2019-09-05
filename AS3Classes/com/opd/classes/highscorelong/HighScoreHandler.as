/**
* @author: Owen Dwyer
* @author Email: odwyer@gmail.com
* date Oct/06/2010
*/

package com.opd.classes.highscorelong{
	import flash.net.*;
	import flash.events.*;
	import flash.events.EventDispatcher;
	public class HighScoreHandler extends EventDispatcher{
		private var urlReq:URLRequest;
		private var myLoader:URLLoader;
		public var scoresXML:XML;
		private var isLoading:Boolean;
		
		public static const SCORES_LOADED="scoresLoaded";
		
		public function HighScoreHandler($req){
			urlReq=new URLRequest($req);
			urlReq.method=URLRequestMethod.POST;
			myLoader=new URLLoader();
			myLoader.addEventListener(Event.COMPLETE, dataLoaded);
			isLoading=false;
		}
		
		public function fetchScores($myVars:URLVariables){
			urlReq.data=$myVars;
			if(isLoading==true){
				myLoader.close();
			}
			isLoading=true;
			myLoader.load(urlReq);
		}
		
		private function dataLoaded(e:Event){
			isLoading=false;
			scoresXML=new XML(e.target.data);
			dispatchEvent(new Event(SCORES_LOADED));
		}
		
		public function deit(){
			myLoader.removeEventListener(Event.COMPLETE, dataLoaded);
			if(isLoading==true){
				myLoader.close();
			}
		}
	}
}