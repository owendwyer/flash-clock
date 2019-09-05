/**
* @author: Owen Dwyer
* @author Email: odwyer@gmail.com
* date Oct/11/2010
*/

/**
* Class to visualize sounds
*/
package com.opd.classes.util{
	import flash.media.SoundMixer;
	import flash.utils.ByteArray;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.display.Graphics;
	import flash.display.Sprite;
	public class SoundVisual extends Sprite{
		private var ba:ByteArray;
		private var time:Timer;
		public function SoundVisual(){
			ba=new ByteArray();
			
			time=new Timer(50);  
			time.addEventListener(TimerEvent.TIMER, timerHandler);  
			if(SoundMixer.areSoundsInaccessible()){
			}else{
				time.start();
			}
		}


		private function timerHandler(e:TimerEvent):void {
		try{
		  SoundMixer.computeSpectrum(ba, true);  	
		  var i:int;  	
		  this.graphics.clear();  	
		  this.graphics.lineStyle(0, 0x000066);  	
		  this.graphics.beginFill(0x000066);	  	
		  this.graphics.moveTo(0, 0);
		  var w:int = 0.1;  	
		  for (i=0; i<256; i+=2) {  		
			var t:Number = ba.readFloat();  		
			var n:Number=t*35;  		
			this.graphics.drawRect(i/8-16, 17, w, -n);
		  }
		}catch(er:Error){
			time.stop();
		}
		}
	}
}

