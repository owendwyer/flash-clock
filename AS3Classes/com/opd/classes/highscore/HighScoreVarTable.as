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
	import flash.utils.getDefinitionByName;
	public class HighScoreVarTable extends MovieClip{
		private var lineArray:Array=new Array();
		private var imArray=new Array();
		
		public function init($arr){
			for(var i=0;i<10;i++){
				lineArray[i]=this["l"+i];
			}
			imArray=$arr;
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
					lineArray[i].time.text=sXML.Score[i].Time;
				}
				if(sXML.Score[i].Score){
					lineArray[i].score.text=sXML.Score[i].Score;
				}
				if(sXML.Score[i].Ivar){
					var c=getDefinitionByName(imArray[sXML.Score[i].Ivar]);
					var myIm=new c;
					lineArray[i].addChild(myIm);
				}
				i++;
			}
		}
		
		public function deit(){
		}
	}
}