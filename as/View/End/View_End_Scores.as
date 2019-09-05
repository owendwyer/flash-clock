/**
* @author: Owen Dwyer
* @author Email: odwyer@gmail.com
* date Oct/13/2010
*/

/**
* Clock game
*/
package View.End{
	import flash.events.Event;
	import flash.display.MovieClip;
	public class View_End_Scores extends MovieClip{
		private var _model:Model;
		private var _controller:Controller;
		
		public function init($model:Model,$controller:Controller){
			_model=$model;
			var tVar=_model.valOb[Model.TIME_VAR];
			tText.text=tVar.toString()+"s";
		}
		
		public function deit(){
		}
	}
}