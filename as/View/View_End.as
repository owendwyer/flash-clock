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
	public class View_End extends MovieClip{
		private var _model:Model;
		private var _controller:Controller;
		
		public function init($model:Model,$controller:Controller){
			_model=$model;
			_controller=$controller;
			but_start.init(_model,_controller,"start");
			but_more.init(_model,_controller,"more");
			
			highScores.init(_model,_controller);
			scores.init(_model,_controller);
			input.init(_model,_controller);
			
			fadeIn();
		}
		
		private function fadeIn(){
			title.alpha=0;
			scores.alpha=0;
			input.alpha=0;
			but_start.alpha=0;
			but_more.alpha=0;
			highScores.alpha=0;
			
			TweenLite.to(title,1,{alpha:1,delay:0.4});
			TweenLite.to(scores,1,{alpha:1,delay:0.6});
			TweenLite.to(input,1,{alpha:1,delay:0.8});
			TweenLite.to(highScores,1,{alpha:1,delay:1});
			TweenLite.to(but_start,1,{alpha:1,delay:1.4});
			TweenLite.to(but_more,1,{alpha:1,delay:1.2});
		}
		
		public function deit(){
			TweenLite.killTweensOf(title);
			TweenLite.killTweensOf(scores);
			TweenLite.killTweensOf(input);
			TweenLite.killTweensOf(highScores);
			TweenLite.killTweensOf(but_start);
			TweenLite.killTweensOf(but_more);
			
			but_start.deit();
			but_more.deit();
			
			highScores.deit();
			scores.deit();
			input.deit();
		}
	}
}