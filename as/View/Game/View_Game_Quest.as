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
	import flash.utils.setTimeout;
	import flash.utils.clearTimeout;
	import flash.text.*;
	import com.opd.classes.util.TextUtils;
	import com.greensock.*;
	import flash.utils.setTimeout;
	public class View_Game_Quest extends MovieClip{
		private var _model:Model;
		private var _controller:Controller;
		private var tArray=new Array();
		private var tOut;
		
		public function init($model:Model,$controller:Controller){
			_model=$model;
			_model.addEventListener(Model.CUR_QUEST,newRound);
			_model.addEventListener(Model.HIT_VAR,hitVar);
			this.alpha=0;
		}
		
		private function hitVar(e:Event){
			tOut=setTimeout(crumble,1500);
		}
		
		private function crumble(){
			TweenLite.to(this,1,{alpha:0});
		}
		
		private function newRound(e:Event){
			tOut=setTimeout(clearText,2000);
		}
		
		private function clearText(){
			dText.text="";
			TweenLite.to(this,1,{alpha:1});
			showText();
		}
		
		private function showText(){
			var myQ=_model.valOb[Model.CUR_QUEST];
			var tVar=_model.valOb[Model.TAR_VAR];
			var myTime=retTime(myQ.tArray[tVar]);
			dText.text=myTime;
			dText.autoSize = TextFieldAutoSize.CENTER;
			dText.y=0;
			dText.y-=dText.height/2;
		}
		
		private function retTime($inTime:Number){
			var mins=Math.round($inTime%1*100);
			var hrs=Math.floor($inTime);
			var out=TextUtils.TimeToText(hrs,mins);
			return(out);
		}
		
		public function deit(){
			_model.removeEventListener(Model.CUR_QUEST,newRound);
			_model.removeEventListener(Model.HIT_VAR,hitVar);
			clearTimeout(tOut);
			TweenLite.killTweensOf(this);
		}
	}
}