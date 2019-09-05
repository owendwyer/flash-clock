/**
* @author: Owen Dwyer
* @author Email: odwyer@gmail.com
* date Oct/06/2010
*/

package View.End{
	import flash.net.*;
	import flash.events.*;
	public class HighScoreHandler{
		private var urlReq:URLRequest;
		private var myVars:URLVariables;
		private var scoreOb:Object;
		public var scoresXML:XML;
		private var myLoader:URLLoader;
		private var _model:Model;
		private var isLoading:Boolean;
		
		public function HighScoreHandler($model:Model){
			_model=$model;
			urlReq=new URLRequest(_model.valOb[Model.HIGH_SCORES_URL]);
			urlReq.method=URLRequestMethod.POST;
			myVars=new URLVariables();
			myLoader=new URLLoader();
			myLoader.addEventListener(Event.COMPLETE, dataLoaded);
			isLoading=false;
		}
		
		public function fetchScores(){
			myVars.name=-1;
			urlReq.data=myVars;
			if(isLoading==true){
				myLoader.close();
			}
			isLoading=true;
			myLoader.load(urlReq);
		}
		
		public function sendScores(){
			myVars.name=_model.valOb[Model.HIGH_SCORES_NAME];
			myVars.local=_model.valOb[Model.HIGH_SCORES_LOCAL];
			myVars.time=_model.valOb[Model.TIME_VAR];
			urlReq.data=myVars;
			if(isLoading==true){
				myLoader.close();
			}
			isLoading=true;
			myLoader.load(urlReq);
		}
		
		private function dataLoaded(e:Event){
			isLoading=false;
			scoresXML=new XML(e.target.data);
			_model.setHighScores(scoresXML);
		}
		
		public function deit(){
			myLoader.removeEventListener(Event.COMPLETE, dataLoaded);
			if(isLoading==true){
				myLoader.close();
			}
		}
	}
}