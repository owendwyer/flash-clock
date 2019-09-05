/**
* @author: Owen Dwyer
* @author Email: odwyer@gmail.com
* date Oct/13/2010
*/

/**
* Clock game
*/
package com.opd.classes.highscoremulti{
	import flash.net.*;
	import flash.events.Event;
	import flash.display.MovieClip;
	public class HighScoreSet extends MovieClip{
		private var myVars:URLVariables;
		private var hHandler:HighScoreHandler;
		
		public function init($score,$time,$loc,$req,$con){
			hHandler=new HighScoreHandler($req);
			hHandler.addEventListener(HighScoreHandler.SCORES_LOADED,scoresLoaded);
			input.addEventListener(HighScoreInput.SEND_SCORES,sendScores);
			
			myVars=new URLVariables();
			myVars.name=-1;
			myVars.score=$score;
			myVars.time=$time;
			myVars.local="";
			myVars.content=$con;
			
			if($score>0){
				input.init();
			}else{
				input.visible=false;
			}
			eTable.init();
			
			hHandler.fetchScores(myVars);
		}
		
		private function scoresLoaded(e:Event){
			eTable.dispScores(hHandler.scoresXML);
		}
		
		private function sendScores(e:Event){
			myVars.name=input.sendName;
			myVars.local=input.sendLoc;
			hHandler.fetchScores(myVars);
		}
		
		public function deit(){
			hHandler.removeEventListener(HighScoreHandler.SCORES_LOADED,scoresLoaded);
			input.removeEventListener(HighScoreInput.SEND_SCORES,sendScores);
			input.deit();
			eTable.deit();
			hHandler.deit();
		}
	}
}