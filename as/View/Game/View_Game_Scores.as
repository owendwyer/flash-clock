/**
* @author: Owen Dwyer
* @author Email: odwyer@gmail.com
* date Oct/13/2010
*/

/**
* Clock game
*/
package View.Game{
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.utils.setTimeout;
	import flash.utils.clearTimeout;
	import com.greensock.*;
	
	public class View_Game_Scores extends MovieClip{
		private var _model:Model;
		private var _controller:Controller;
		private var mainTimer:Timer=new Timer(100,0);
		private var tVar:Number=0;
		private var tOut;
		
		public function init($model:Model,$controller:Controller){
			_model=$model;
			_controller=$controller;
			_model.addEventListener(Model.GAME_FIN,gameFin);
			_model.addEventListener(Model.GAME_READY,gameReady);
			_model.addEventListener(Model.FALL,gameOut);
			alpha=0;
		}
		
		private function gameOut(e:Event){
			deit();
		}
		
		private function gameReady(e:Event){
			TweenLite.to(this,1,{alpha:1});
			tOut=setTimeout(startTimer,2000);
		}
		
		private function startTimer(){
			mainTimer.addEventListener(TimerEvent.TIMER,counter);
			mainTimer.start();
		}
		
		private function gameFin(e:Event){
			_model.setTimeVar(tVar);
			deit();
			TweenLite.to(this,1,{alpha:0});
		}
		
		private function counter(e:TimerEvent){
			tVar+=0.1;
			tVar=Math.round(tVar*10)/10;
			spinner.hand.rotation=(tVar-Math.round(tVar))*360;
			if(tVar==Math.round(tVar)){
				tText.text=tVar.toString()+".0s";
			}else{
				tText.text=tVar.toString()+"s";
			}
			if(tVar%6.5==0&&tVar>6.5){
				_model.takePlank();
			}
		}
		
		public function deit(){
			mainTimer.removeEventListener(TimerEvent.TIMER,counter);
			mainTimer.reset();
			_model.removeEventListener(Model.GAME_FIN,gameFin);
			_model.removeEventListener(Model.GAME_READY,gameReady);
			_model.removeEventListener(Model.FALL,gameOut);
			TweenLite.killTweensOf(this);
			clearTimeout(tOut);
		}
	}
}