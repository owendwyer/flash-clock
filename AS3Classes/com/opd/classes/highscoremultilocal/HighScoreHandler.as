/**
* @author: Owen Dwyer
* @author Email: odwyer@gmail.com
* date Oct/06/2010
*/

package com.opd.classes.highscoremultilocal{
	import flash.net.*;
	import flash.events.*;
	import flash.events.EventDispatcher;
	public class HighScoreHandler extends EventDispatcher{
		public var namesArray=new Array;
		public var scoresArray=new Array;
		public var timeArray=new Array;
		private var so;
		private var myScore;
		private var myTime;
		
		public function HighScoreHandler($score,$time,$title){
			myScore=$score;
			myTime=$time;
			var soStr="test"+$title;
			so=SharedObject.getLocal(soStr);
			if(so.data.names!=null){
				namesArray=so.data.names;
				scoresArray=so.data.scores;
				timeArray=so.data.time;
			}else{
				createDefaults();
			}
		}
		
		public function sendScores($name){
			var myName=$name;
			for(var i=0;i<10;i++){
				if(myScore>scoresArray[i]||(myScore==scoresArray[i]&&myTime<timeArray[i])){
					var tmpScore=scoresArray[i];
					var tmpName=namesArray[i];
					var tmpTime=timeArray[i];
					scoresArray[i]=myScore;
					namesArray[i]=myName;
					timeArray[i]=myTime;
					myScore=tmpScore;
					myName=tmpName;
					myTime=tmpTime;
				}
			}
			so.data.names=namesArray;
			so.data.scores=scoresArray;
			so.data.time=timeArray;
			so.flush();
		}
	
		private function createDefaults(){
			for(var i=0;i<10;i++){
				namesArray[i]="";
				scoresArray[i]=0;
				timeArray[i]=0;
			}
			so.data.names=namesArray;
			so.data.scores=scoresArray;
			so.data.time=timeArray;
			so.flush();
		}
		
		public function deit(){
		}
	}
}