/**
* @author: Owen Dwyer
* @author Email: odwyer@gmail.com
* date Oct/13/2010
*/

/**
* Clock game
*/
package com.opd.classes.highscoremultilocal{
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	public class HighScoreTable extends MovieClip{
		private var lineArray:Array=new Array();
		
		public function dispScores($names,$scores,$times){
			while(lineHolder.numChildren){
				lineHolder.removeChildAt(0);
			}
			var i:int=0;
			for(var j=0;j<10;j++){
				if($times[i]>0){
					var myLine=new endLine;
					myLine.rText.text=i+1;
					myLine.nText.text=$names[i];
					myLine.sText.text=$scores[i];
					myLine.tText.text=$times[i];
					myLine.y=i*30;
					lineHolder.addChild(myLine);
					i++;
				}
			}
		}
	}
}