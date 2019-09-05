package com.opd.classes.util{
	import flash.display.*;
	import flash.net.*;
	import flash.media.*;
	public class Speaker{
		public static function SpeakThis($str:String){
			var speech=new Sound();
			var chan=new SoundChannel();
			var req="http://translate.google.com/translate_tts?tl=en&q="+$str;
			var myReq=new URLRequest(req);
			speech.load(myReq);
			chan=speech.play();
		}
	}
}