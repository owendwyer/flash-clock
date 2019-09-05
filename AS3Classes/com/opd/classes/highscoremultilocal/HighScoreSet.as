/**
* @author: Owen Dwyer
* @author Email: odwyer@gmail.com
* date Oct/13/2010
*/

/**
* Clock game
*/
package com.opd.classes.highscoremultilocal{
	import flash.net.*;
	import flash.events.Event;
	import flash.display.MovieClip;
	public class HighScoreSet extends MovieClip{
		private var hHandler:HighScoreHandler;
		
		public function init($score,$time,$title){
			hHandler=new HighScoreHandler($score,$time,$title);
			input.addEventListener(HighScoreInput.SEND_SCORES,sendScores);

			if($score>=hHandler.scoresArray[9]){
				input.init();
			}else{
				input.visible=false;
			}
			eTable.dispScores(hHandler.namesArray,hHandler.scoresArray,hHandler.timeArray);
		}
		
		private function sendScores(e:Event){
			var myName=input.sendName+" "+input.sendLoc;
			hHandler.sendScores(myName);
			eTable.dispScores(hHandler.namesArray,hHandler.scoresArray,hHandler.timeArray);
		}
		
		public function deit(){
			input.removeEventListener(HighScoreInput.SEND_SCORES,sendScores);
			input.deit();
			hHandler.deit();
		}
	}
}