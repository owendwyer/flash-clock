/**
* @author: Owen Dwyer
* @author Email: odwyer@gmail.com
* date Oct/13/2010
*/

/**
* Clock game
*/
package View{
	import flash.events.Event;
	import flash.display.MovieClip;
	import View.Game.gameInit;
	import flash.utils.setTimeout;
	import flash.utils.clearTimeout;
	import com.greensock.*;
	public class View_Game extends MovieClip{
		private var _model:Model;
		private var _controller:Controller;
		private var tOut1;
		private var tOut2;
		
		public function init($model:Model,$controller:Controller){
			_model=$model;
			_controller=$controller;
			
			_model.addEventListener(Model.GAME_FIN,gameFin);
			
			but_start.init(_model,_controller,"start");
			body.init(_model,_controller);
			bridge.init(_model,_controller);
			quest.init(_model,_controller);
			scores.init(_model,_controller);
			
			var gInit=new gameInit(_model);
			fadeIn();
			alpha=0;
		}
		
		private function gameFin(e:Event){
			but_start.deit();
			but_start.visible=false;
			TweenLite.to(back,2,{alpha:0});
			TweenLite.to(back2,2,{alpha:0});
		}
		
		private function fadeIn(){
			TweenLite.to(this,2,{alpha:1,delay:0.5});
			but_start.alpha=0;
			tOut1=setTimeout(bridge.start, 3000);
			tOut2=setTimeout(setReady, 7000);
		}
		
		private function setReady(){
			_model.setReady();
			TweenLite.to(but_start,1,{alpha:1});
		}
		
		public function deit(){
			_model.removeEventListener(Model.GAME_FIN,gameFin);
			
			but_start.deit();
			body.deit();
			bridge.deit();
			quest.deit();
			scores.deit();
			
			TweenLite.killTweensOf(back);
			TweenLite.killTweensOf(back2);
			TweenLite.killTweensOf(this);
			clearTimeout(tOut1);
			clearTimeout(tOut2);
		}
	}
}