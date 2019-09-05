/**
* @author: Owen Dwyer
* @author Email: odwyer@gmail.com
* date Oct/13/2010
*/

/**
* Clock game
*/
package View.Game{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import com.greensock.*;
	public class View_Game_Clock extends MovieClip{
		public var tarVar:int;
		private var _model:Model;
		
		public function setTime($tVar:Number,$tarVar:int){
			var minVar=Math.round(($tVar%1)*600);
			big.rotation=minVar;
			small.rotation=Math.floor($tVar)*30;
			small.rotation+=minVar/12;
			tarVar=$tarVar;
		}
		
		public function init($model:Model){
			_model=$model;
			alpha=0;
			TweenLite.to(this,1,{alpha:1,onComplete:function(){addList()}});
		}
		
		private function addList(){
			buttonMode=true;
			addEventListener(MouseEvent.CLICK,clicker);
		}
		
		private function clicker(e:MouseEvent){
			_model.setHitVar(tarVar);
		}
		
		public function deit(){
			buttonMode=false;
			removeEventListener(MouseEvent.CLICK,clicker);
			TweenLite.killTweensOf(this);
		}
		
		public function crumble(){
			TweenLite.to(this,1,{alpha:0});
		}
	}
}