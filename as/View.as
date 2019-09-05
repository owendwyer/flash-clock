/**
* @author: Owen Dwyer
* @author Email: odwyer@gmail.com
* date Oct/13/2010
*/

/**
* Clock game
*/
package{
	import flash.events.Event;
	import flash.display.MovieClip;
	import View.*;
	
	public class View extends MovieClip{
		private var _model:Model;
		private var _controller:Controller;
		
		private var curView=null;

		public function View($model:Model,$controller:Controller){
			_model=$model;
			_controller=$controller;
			
			_model.addEventListener(Model.VIEW_CHANGE, switchView);
		}
		
		private function switchView(e:Event){
			if(curView!=null){
				curView.deit();
				removeChild(curView);
			}
				
			switch(_model.valOb[Model.VIEW_CHANGE]){
				case "start":
				curView=new View_Start();
				break;
				
				case "game":
				curView=new View_Game();
				break;
				
				case "instruct":
				curView=new View_Instruct();
				break;
				
				case "end":
				curView=new View_End();
				break;
			}
			addChild(curView);
			curView.init(_model,_controller);
		}
	}
}