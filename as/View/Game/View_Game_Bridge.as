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
	import com.greensock.*;
	import com.greensock.easing.*;
	public class View_Game_Bridge extends MovieClip{
		private var _model:Model;
		private var _controller:Controller;
		private var pArray:Array=new Array();
		private var pVar:int;
		private var tVar:int;
		
		public function init($model:Model,$controller:Controller){
			_model=$model;
			_model.addEventListener(Model.JUMP,jump);
			_model.addEventListener(Model.FALL,fall);
			_model.addEventListener(Model.GAME_FIN,gameFin);
			_model.addEventListener(Model.TAKE_PLANK,takePlank);
			initPlanks();
			pVar=-1;
			tVar=-1;
			smallMan.alpha=0;
			main.alpha=0;
		}
		
		private function takePlank(e:Event){
			if(pVar>0){
				tVar++;
				TweenLite.to(pArray[tVar],2,{alpha:0});
				if(tVar>=pVar){
					_model.manFall();
				}
			}
		}
		
		private function gameFin(e:Event){
			TweenLite.to(main,1,{alpha:0,delay:1});
			for(var i=0;i<18;i++){
				TweenLite.to(pArray[i],1,{alpha:0,delay:1});
			}
		}
		
		private function initPlanks(){
			for(var i=0;i<18;i++){
				pArray[i]=this["p"+i];
				pArray[i].alpha=0;
			}
		}
		
		public function start(){
			TweenLite.to(smallMan,1,{alpha:1});
			TweenLite.to(main,1,{alpha:1,delay:1});
			for(var i=0;i<17;i++){
				TweenLite.to(pArray[i],1,{alpha:1,delay:(2+i*0.1)});
			}
		}
		
		private function jump(e:Event){
			pVar++;
			TweenLite.to(smallMan,1,{x:pArray[pVar].x,y:pArray[pVar].y,ease:Back.easeIn});
		}
		
		private function fall(e:Event){
			if(pVar==-1){
				pVar=0;
			}
			TweenLite.to(pArray[pVar],1,{alpha:0});
			TweenLite.to(smallMan,2,{alpha:0,y:190,ease:Expo.easeIn});
		}
		
		public function deit(){
			_model.removeEventListener(Model.JUMP,jump);
			_model.removeEventListener(Model.FALL,fall);
			_model.removeEventListener(Model.GAME_FIN,gameFin);
			_model.removeEventListener(Model.TAKE_PLANK,takePlank);
			for(var i=0;i<18;i++){
				TweenLite.killTweensOf(pArray[i]);
			}
			TweenLite.killTweensOf(smallMan);
			TweenLite.killTweensOf(main);
		}
	}
}