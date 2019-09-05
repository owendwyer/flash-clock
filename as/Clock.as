/**
* @author: Owen Dwyer
* @author Email: odwyer@gmail.com
* date Oct/13/2010
*/

/**
* Clock game
*/
package{
	import flash.display.MovieClip;
	public class Clock extends MovieClip{
		private var _model:Model;
		private var _controller:Controller;
		private var _view:View;
		public function Clock(){
			_model=new Model();
			_controller=new Controller(_model);
			_view=new View(_model,_controller);
			
			addChild(_view);
			_controller.init();
		}
	}
}