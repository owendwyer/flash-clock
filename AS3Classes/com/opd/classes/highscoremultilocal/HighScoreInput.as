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
	import flash.events.EventDispatcher;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	import flash.events.FocusEvent;
	import flash.text.TextFieldType;
	public class HighScoreInput extends MovieClip{
		
		public static const SEND_SCORES="sendScores";
		
		public var sendName:String="";
		public var sendLoc:String="";
		
		public function init(){
			setupInput();
		}
		
		private function setupInput(){
			setTimeout(fDel,10);
			submitBut.addEventListener(MouseEvent.CLICK, subClick);
			submitBut.buttonMode=true;
			inText.addEventListener(FocusEvent.FOCUS_IN, fOut);
			inText.addEventListener(FocusEvent.FOCUS_OUT, fIn);
			cText.addEventListener(FocusEvent.FOCUS_IN, fOut);
			cText.addEventListener(FocusEvent.FOCUS_OUT, fIn);
			activeBorC.visible=false;
		}
		
		private function fOut(e:Event){
			if(e.currentTarget.name=="inText"){
				activeBor.visible=true;
			}else{
				activeBorC.visible=true;
			}
		}
		
		private function fIn(e:Event){
			if(e.currentTarget.name=="inText"){
				activeBor.visible=false;
			}else{
				activeBorC.visible=false;
			}
		}
		
		private function subClick(e:MouseEvent){
			if(inText.text==""){
				stage.focus=inText;
			}else{
				if(cText.text==""){
					stage.focus=cText;
				}else{
					goodSub();
				}
			}
		}
		
		private function fDel(){
			stage.focus=inText;
			inText.restrict="A-Za-z";
			cText.restrict="A-Za-z";
		}
		
		private function goodSub(){
			submitBut.removeEventListener(MouseEvent.CLICK, subClick);
			submitBut.buttonMode=false;
			submitBut.visible=false;
			sendName=inText.text;
			sendLoc=cText.text;
			dispatchEvent(new Event(SEND_SCORES));
			changeInField(inText);
			changeInField(cText);
			activeBor.visible=false;
			activeBorC.visible=false;
		}
		
		private function changeInField($field){
			$field.removeEventListener(FocusEvent.FOCUS_IN, fOut);
			$field.removeEventListener(FocusEvent.FOCUS_OUT, fIn);
			$field.type=TextFieldType.DYNAMIC;
			$field.border=false;
			$field.background=false;
			$field.selectable=false;
		}
		
		public function deit(){
			inText.removeEventListener(FocusEvent.FOCUS_IN, fOut);
			inText.removeEventListener(FocusEvent.FOCUS_OUT, fIn);
			cText.removeEventListener(FocusEvent.FOCUS_IN, fOut);
			cText.removeEventListener(FocusEvent.FOCUS_OUT, fIn);
			submitBut.removeEventListener(MouseEvent.CLICK, subClick);
			submitBut.buttonMode=false;
		}
	}
}