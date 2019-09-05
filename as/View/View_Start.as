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
	public class View_Start extends MovieClip{
		private var _model:Model;
		private var _controller:Controller;
		
		public function init($model:Model,$controller:Controller){
			_model=$model;
			_controller=$controller;
			myClock.init();
			but_game.init(_model,_controller,"game");
			but_instruct.init(_model,_controller,"instruct");
			but_end.init(_model,_controller,"end");
			but_more.init(_model,_controller,"more");
			
			fadeIn();
		}
		
		private function fadeIn(){
			title.alpha=0;
			myClock.alpha=0;
			myClock.navBar.alpha=0;
			but_game.alpha=0;
			but_instruct.alpha=0;
			but_end.alpha=0;
			but_more.alpha=0;;
			TweenLite.to(title,1,{alpha:1,delay:0.4});
			TweenLite.to(but_game,1,{alpha:1,delay:0.6});
			TweenLite.to(but_instruct,1,{alpha:1,delay:0.7});
			TweenLite.to(but_end,1,{alpha:1,delay:0.8});
			TweenLite.to(but_more,1,{alpha:1,delay:0.9});
			TweenLite.to(myClock,1,{alpha:1,delay:1.1});
			TweenLite.to(myClock.navBar,1,{alpha:1,delay:1.3});
		}
		
		public function deit(){
			myClock.deit();
			but_game.deit();
			but_instruct.deit();
			but_end.deit();
			but_more.deit();
			
			TweenLite.killTweensOf(title);
			TweenLite.killTweensOf(but_game);
			TweenLite.killTweensOf(but_instruct);
			TweenLite.killTweensOf(but_end);
			TweenLite.killTweensOf(but_more);
			TweenLite.killTweensOf(myClock);
			TweenLite.killTweensOf(myClock.navBar);
		}
	}
}