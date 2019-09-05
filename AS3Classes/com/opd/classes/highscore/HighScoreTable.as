/**
* @author: Owen Dwyer
* @author Email: odwyer@gmail.com
* date Oct/13/2010
*/

/**
* Clock game
*/
package com.opd.classes.highscore{
	import flash.events.Event;
	import flash.display.MovieClip;
	public class HighScoreTable extends MovieClip{
		private var lineArray:Array=new Array();
		
		public function init(){
			for(var i=0;i<10;i++){
				lineArray[i]=this["l"+i];
			}
		}
		
		public function dispScores($scrXML){
			var sXML=$scrXML;
			var i:int=0;
			while(sXML.Score[i]){
				lineArray[i].rank.text=i+1;
				lineArray[i].nom.text=sXML.Score[i].Name;
				if(sXML.Score[i].Local){
					lineArray[i].local.text=sXML.Score[i].Local;
				}
				if(sXML.Score[i].Time){
					try{
						lineArray[i].time.text=sXML.Score[i].Time;
					}catch(e:Error){};
				}
				if(sXML.Score[i].Score){
					lineArray[i].score.text=sXML.Score[i].Score;
				}
				i++;
			}
		}
		
		public function deit(){
		}
	}
}