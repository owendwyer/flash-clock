/**
* @author: Owen Dwyer
* @author Email: odwyer@gmail.com
* date Oct/11/2010
*/

/**
* Class to play sounds
*/
package com.opd.classes.util{
	import flash.media.Sound;
	import flash.media.SoundMixer;
	public class SoundPlayer{
		private var sArr:Array=new Array();
		public function SoundPlayer($sArr:Array){
			sArr=$sArr;
		}
		
		public function playSound($val:int){
			SoundMixer.stopAll();
			sArr[$val].play();
		}
		
		public function getLen($val:int){
			return(sArr[$val].length);
		}
		
		public function stopper(){
			SoundMixer.stopAll();
		}
		
		public function deit(){
			SoundMixer.stopAll();
		}
	}
}