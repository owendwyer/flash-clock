/**
* @author: Owen Dwyer
* @author Email: odwyer@gmail.com
* date Oct/13/2010
*/

/**
* Clock game
*/
package View.End{
	import flash.events.Event;
	import flash.display.MovieClip;
	public class View_End_HS extends MovieClip{
		private var _model:Model;
		private var _controller:Controller;
		private var hScore:HighScoreHandler;
		private var timeArray:Array;
		private var nameArray:Array;
		private var localArray:Array;
		private var lineArray:Array;
		
		public function init($model:Model,$controller:Controller){
			_model=$model;
			_controller=$controller;
			hScore=new HighScoreHandler(_model);
			initArrays();
			dispScores();
			_model.addEventListener(Model.HIGH_SCORES, scoresLoaded);
			_model.addEventListener(Model.HIGH_SCORES_NAME, sendScores);
			hScore.fetchScores();
		}
		
		private function scoresLoaded(e:Event){
			setArrays();
			dispScores();
		}
		
		private function sendScores(e:Event){
			hScore.sendScores();
		}
		
		private function initArrays(){
			nameArray=new Array();
			timeArray=new Array();
			localArray=new Array();
			lineArray=new Array();
			for(var i=0;i<10;i++){
				nameArray[i]="";
				timeArray[i]="";
				localArray[i]="";
				lineArray[i]=this["l"+i];
			}
		}
		
		private function setArrays(){
			var sXML=_model.valOb[Model.HIGH_SCORES];
			var i:int=0;
			while(sXML.Score[i]){
				nameArray[i]=sXML.Score[i].Name;
				localArray[i]=sXML.Score[i].Local;
				timeArray[i]=sXML.Score[i].Time;
				i++;
			}
		}
		
		private function dispScores(){
			for(var i=0;i<10;i++){
				lineArray[i].rank.text=i+1;
				lineArray[i].nom.text=nameArray[i];
				lineArray[i].local.text=localArray[i];
				lineArray[i].time.text=timeArray[i];
			}
		}
		
		public function deit(){
			_model.removeEventListener(Model.HIGH_SCORES, scoresLoaded);
			_model.removeEventListener(Model.HIGH_SCORES_NAME, sendScores);
			hScore.deit();
		}
	}
}