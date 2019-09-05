/**
* @author: Owen Dwyer
* @author Email: odwyer@gmail.com
* date Oct/13/2010
*/

/**
* Clock game
*/
package View{
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	import com.greensock.*;
	public class myButton extends MovieClip{
		private var _model:Model;
		private var _controller:Controller;
		
		private var tarString:String;
		
		public function init($model:Model,$controller:Controller,$target:String){
			tarString=$target;
			_model=$model;
			back2.alpha=0;
			addEventListener(MouseEvent.CLICK, clicker);
			addEventListener(MouseEvent.MOUSE_OVER, overer);
			addEventListener(MouseEvent.MOUSE_OUT, outer);
			buttonMode=true;
		}
		
		private function overer(e:MouseEvent){
			TweenLite.to(back2,0.5,{alpha:1});
			TweenLite.to(back,0.5,{alpha:0});
		}
		
		private function outer(e:MouseEvent){
			TweenLite.to(back2,0.5,{alpha:0});
			TweenLite.to(back,0.5,{alpha:1});
		}
		
		private function clicker(e:MouseEvent){
			if(tarString!="more"){
				_model.setView(tarString);
			}else{
				navigateToURL(new URLRequest("http://gamestolearnenglish.com"),"_blank");
			}
		}
		
		public function deit(){
			removeEventListener(MouseEvent.CLICK, clicker);
			removeEventListener(MouseEvent.MOUSE_OVER, overer);
			removeEventListener(MouseEvent.MOUSE_OUT, outer);
			buttonMode=false;
			TweenLite.killTweensOf(back2);
			TweenLite.killTweensOf(back);
		}
	}
}