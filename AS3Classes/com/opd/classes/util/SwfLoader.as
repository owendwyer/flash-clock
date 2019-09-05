package com.opd.classes.util
{
	import flash.display.*;
	import flash.net.*;
	import flash.events.*;
	import flash.events.EventDispatcher;
	public class SwfLoader extends MovieClip
	{
		private var loader:Loader;
		private var myPar;
		
		public var lOb=new Object;
		public static const LOADED="loaded";
		public static const DUR_LOAD="durLoad";
		
		public function loadThis(mySwf){
			var tar=new URLRequest(mySwf);
			myPar=this.parent as DisplayObject;
			loader=new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loaded);
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, durLoad);
			loader.load(tar);
		}
		
		private function loaded(e:Event){
			lOb[LOADED]=loader.content;
			loader.unload();
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, loaded);
			loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, durLoad);
			dispatchEvent(new Event(LOADED));
		}
		
		private function durLoad(e:ProgressEvent){
			var bLd=e.currentTarget.bytesLoaded;
			var bTl=e.currentTarget.bytesTotal;
			var per=bLd/bTl;
			per=Math.round(per*100);
			lOb[DUR_LOAD]=per;
			dispatchEvent(new Event(DUR_LOAD));
		}
		
		public function deit(){
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, loaded);
			loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, durLoad);
		}
	}
}