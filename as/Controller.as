/**
* @author: Owen Dwyer
* @author Email: odwyer@gmail.com
* date Oct/13/2010
*/

/**
* Clock game
*/
package{
	import flash.events.Event;
	import flash.utils.setTimeout;
	import flash.utils.clearTimeout;
	public class Controller{
		private var _model:Model;
		private var tOut;
		public function Controller($model:Model){
			_model=$model;
			_model.addEventListener(Model.HIT_VAR,hitVar);
			_model.addEventListener(Model.GAME_READY,newRound);
			_model.addEventListener(Model.GAME_FIN,gameFin);
			_model.addEventListener(Model.VIEW_CHANGE,viewChange);
		}
		
		private function viewChange(e:Event){
			clearTimeout(tOut);
		}
		
		public function init(){
			_model.setView("start");
			_model.setHSUrl("http://gamestolearnenglish.com/HS/scores_clock.php");
			_model.setTimeVar(0);
		}
		
		private function gameFin(e:Event){
			tOut=setTimeout(gameFin2,3000);
		}
		
		private function gameFin2(){
			_model.setView("end");
		}
		
		public function newRound(e:Event=null){
			_model.setTarVar(Math.floor(Math.random()*3));
			_model.setProgVar(_model.valOb[Model.PROG_VAR]+1);
			
			var pVar=_model.valOb[Model.PROG_VAR];
			var sVar=_model.valOb[Model.SEQ_ARRAY][pVar];
			var myQ=_model.valOb[Model.QUEST_ARRAY][sVar];
			if(pVar==18){
				tOut=setTimeout(_model.setGameFin,1000);
			}else{
				_model.setCurQuest(myQ);
			}
		}
		
		private function hitVar(e:Event){
			var tVar=_model.valOb[Model.TAR_VAR];
			var hVar=_model.valOb[Model.HIT_VAR];
			if(tVar==hVar){
				tOut=setTimeout(newRound,2000);
			}else{
				tOut=setTimeout(_model.manFall,1500);
			}
		}
	}
}