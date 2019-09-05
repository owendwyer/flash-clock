package com.opd.classes.util{
	import mx.rpc.http.*;
	import mx.rpc.events.ResultEvent;
	import com.adobe.serialization.json.*;
	import flash.events.EventDispatcher;
	import flash.events.Event;
	
	public class GoogleTranslate extends EventDispatcher{
		
		public static const TRANSLATED:String="translated";
		public static const ERRORED:String="errored";
		public var outText:String;
		
		public function sendReq(tar,lang){
			var service=new HTTPService();
			service.url = 'https://ajax.googleapis.com/ajax/services/language/translate';
			service.request.v = '2.0';
			service.request.q = tar;
			service.request.langpair = lang;
			service.request.key = 'ABQIAAAACvYNy0mRKvDMV9i9VoWeGxTiBie7RWxtn9DO0k2MMRDgFZ2KHhSSaM5nuEutueNCTcQUBJhDRDZ8Zg';
			service.resultFormat = 'text';
			service.addEventListener(ResultEvent.RESULT, onServerResponse);
			service.send();
		}
		
		private function onServerResponse(event:ResultEvent):void {
		  try {
			var json:Object = JSON.decode(event.result as String);
			outText=json.responseData.translatedText;
			dispatchEvent(new Event(TRANSLATED));
		  } catch(ignored:Error) {
			  dispatchEvent(new Event(ERRORED));
		  }
		}
	}
}