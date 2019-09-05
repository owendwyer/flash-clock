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
	import com.greensock.*;
	public class View_Instruct extends MovieClip{
		private var _model:Model;
		private var _controller:Controller;
		
		public function init($model:Model,$controller:Controller){
			_model=$model;
			_controller=$controller;
			but_start.init(_model,_controller,"start");
			fadeIn();
		}
		
		private function fadeIn(){
			title.alpha=0;
			instructions.alpha=0;
			but_start.alpha=0;
			
			TweenLite.to(title,1,{alpha:1,delay:0.4});
			TweenLite.to(instructions,1,{alpha:1,delay:0.6});
			TweenLite.to(but_start,1,{alpha:1,delay:0.8});
		}
		
		public function deit(){
			TweenLite.killTweensOf(title);
			TweenLite.killTweensOf(instructions);
			TweenLite.killTweensOf(but_start);
			but_start.deit();
		}
	}
}