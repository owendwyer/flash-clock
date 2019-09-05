/**
* @author: Owen Dwyer
* @author Email: odwyer@gmail.com
* date Oct/13/2010
*/

/**
* Clock game
*/
package com.opd.classes.highscorelong{
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	public class HighScoreTable extends MovieClip{
		private var lineArray:Array=new Array();
		private var moveInd;
		private var numLines=0;
		
		public function init(){
			addLists();
		}
		
		public function dispScores($scrXML){
			while(lineHolder.numChildren){
				lineHolder.removeChildAt(0);
			}
			var sXML=$scrXML;
			var i:int=0;
			while(sXML.Score[i]){
				var myLine=new endLine;
				myLine.rText.text=i+1;
				myLine.nText.text=sXML.Score[i].Name;
				myLine.lText.text=sXML.Score[i].Local;
				myLine.sText.text=sXML.Score[i].Score;
				myLine.tText.text=sXML.Score[i].Time;
				myLine.y=i*30;
				lineHolder.addChild(myLine);
				i++;
			}
			numLines=i;
		}
		
		private function addLists(){
			uArrow.addEventListener(MouseEvent.MOUSE_DOWN,moveUp);
			uArrow.buttonMode=true;
			dArrow.addEventListener(MouseEvent.MOUSE_DOWN,moveDown);
			dArrow.buttonMode=true;
			lineHolder.addEventListener(MouseEvent.MOUSE_WHEEL,wheelMove);
		}
		
		private function wheelMove(e:MouseEvent){
			lineHolder.y+=e.delta*(30/3);
			boundCheck();
		}
		
		private function removeLists(){
			uArrow.removeEventListener(MouseEvent.MOUSE_DOWN,moveUp);
			dArrow.removeEventListener(MouseEvent.MOUSE_DOWN,moveDown);
			lineHolder.removeEventListener(MouseEvent.MOUSE_WHEEL,wheelMove);
		}
		
		private function moveUp(e:MouseEvent){
			moveInd=30;
			uArrow.addEventListener(MouseEvent.MOUSE_UP,stopMove);
			uArrow.addEventListener(MouseEvent.ROLL_OUT,stopMove);
			addEventListener(Event.ENTER_FRAME,mover);
		}
		
		private function moveDown(e:MouseEvent){
			moveInd=-30;
			dArrow.addEventListener(MouseEvent.MOUSE_UP,stopMove);
			dArrow.addEventListener(MouseEvent.ROLL_OUT,stopMove);
			addEventListener(Event.ENTER_FRAME,mover);
		}
		
		private function stopMove(e:MouseEvent){
			e.currentTarget.removeEventListener(MouseEvent.MOUSE_UP,stopMove);
			e.currentTarget.removeEventListener(MouseEvent.ROLL_OUT,stopMove);
			removeEventListener(Event.ENTER_FRAME,mover);
		}
		
		private function mover(e:Event){
			lineHolder.y+=moveInd;
			boundCheck();
		}
		
		private function boundCheck(){
			if(lineHolder.y>0){
				lineHolder.y=0;
			}
			if(lineHolder.y<-(numLines*30-300)){
				lineHolder.y=-(numLines*30-300);
				if(numLines<=10){
					lineHolder.y=0;
				}
			}
		}
		
		public function deit(){
			removeLists();
		}
	}
}