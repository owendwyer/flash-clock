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
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import flash.utils.setTimeout;
	import flash.utils.clearTimeout;
	import com.opd.classes.util.MyUtils;
	import com.greensock.*;
	import com.greensock.easing.*;
	public class View_Game_Body extends MovieClip{
		private var _model:Model;
		private var _controller:Controller;
		private var tOut;
		private var oArray:Array=new Array();
		private var cArray:Array=new Array();
		
		public function init($model:Model,$controller:Controller){
			_model=$model;
			_controller=$controller;
			_model.addEventListener(Model.CUR_QUEST,newRound);
			_model.addEventListener(Model.HIT_VAR,clockHit);
			_model.addEventListener(Model.FALL,manFall);
			_model.addEventListener(Model.GAME_FIN,gameFin);
			
			for(var i=0;i<3;i++){
				oArray[i]=i;
				cArray[i]=this["dClock"+(i+1)];
				cArray[i].alpha=0;
			}
			man.retX=man.x;
			man.retY=man.y;
			man.alpha=0;
			gOver.visible=false;
			gOver.but_start.init(_model,_controller,"start");
		}
		
		private function gameFin(e:Event){
			TweenLite.to(this,1,{alpha:0});
		}
		
		private function newRound(e:Event){
			tOut=setTimeout(showClocks,1000);
		}
		
		public function showClocks(){
			oArray=MyUtils.randomizeArray(oArray);
			var myQ=_model.valOb[Model.CUR_QUEST];
			for(var i=0;i<3;i++){
				cArray[i].setTime(myQ.tArray[oArray[i]],oArray[i]);
			}
			addLists();
			resetMan();
		}
		
		private function addLists(){
			for(var i=0;i<3;i++){
				cArray[i].init(_model);
			}
		}
		
		private function resetMan(){
			man.alpha=0;
			man.x=man.retX;
			man.y=man.retY;
			TweenLite.to(man,1,{alpha:1,ease:Back.easeIn});
		}
		
		private function manFall(e:Event){
			TweenLite.to(man,1,{alpha:0});
			tOut=setTimeout(gameOver,3000);
			removeLists();
		}
		
		private function gameOver(){
			gOver.visible=true;
			gOver.alpha=0;
			TweenLite.to(gOver,1,{alpha:1});
		}
		
		private function clockHit(e:Event=null){
			var hVar=_model.valOb[Model.HIT_VAR];
			for(var i=0;i<3;i++){
				if(cArray[i].tarVar==hVar){
					TweenLite.to(man,1,{x:cArray[i].x,y:cArray[i].y,ease:Back.easeIn});
				}
			}
			_model.manJump();
			removeLists();
			tOut=setTimeout(crumble,1500);
		}
		
		private function crumble(){
			for(var i=0;i<3;i++){
				if(cArray[i].tarVar!=_model.valOb[Model.TAR_VAR]){
					cArray[i].crumble();
				}
			}
		}
		
		private function removeLists(){
			for(var i=0;i<3;i++){
				cArray[i].deit();
			}
		}
		
		public function deit(){
			removeLists()
			_model.removeEventListener(Model.CUR_QUEST,newRound);
			_model.removeEventListener(Model.HIT_VAR,clockHit);
			_model.removeEventListener(Model.FALL,manFall);
			_model.removeEventListener(Model.GAME_FIN,gameFin);
			clearTimeout(tOut);
			TweenLite.killTweensOf(this);
			TweenLite.killTweensOf(man);
			TweenLite.killTweensOf(gOver);
		}
	}
}