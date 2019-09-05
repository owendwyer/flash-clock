/**
* @author: Owen Dwyer
* @author Email: odwyer@gmail.com
* date Jul/2011
*/

/**
* Flash spelling game for web or touch
*/

package com.opd.classes.sound{
	import flash.events.Event;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	public class musicPlayer{
		private var _model:Model;
		private var loop1;
		private var loop2;
		private var curTrack;
		private var myChannel:SoundChannel;
		private var myTransform:SoundTransform;
		
		public function musicPlayer($model:Model,$track1,$track2){
			_model=$model;
			_model.set(Model.MUSIC,"on");
			myTransform=new SoundTransform();
			myTransform.volume=0.1;
			myChannel=new SoundChannel();
			myChannel.soundTransform=myTransform;
			loop1=$track1;
			loop2=$track2;
			curTrack=loop1;
			music(null);
			_model.addEventListener(Model.MUSIC,music);
			_model.addEventListener(Model.MUSIC_TRACK,musicTrack);
		}
		
		private function music(e:Event){
			if(_model.get(Model.MUSIC)=="off"){
				myChannel.stop();
			}else{
				playMusic();
			}
		}
		
		private function musicTrack(e:Event){
			var startVar=0;
			if(_model.get(Model.MUSIC)=="on"){
				myChannel.stop();
				startVar=1;
			}
			switch(_model.get(Model.MUSIC_TRACK)){
				case 1:
				curTrack=loop1;
				break;
				case 2:
				curTrack=loop2;
				break;
				case 3:
				myChannel.stop();
				break;
			}
			if(startVar==1&&_model.get(Model.MUSIC_TRACK)!=3){
				playMusic();
			}
		}
		
		private function playMusic(){
			myChannel=curTrack.play(0,200);
			var myTrans=new SoundTransform(0.4);
			myChannel.soundTransform=myTrans;
		}
		
		public function deit(){
			_model.removeEventListener(Model.MUSIC,music);
			_model.removeEventListener(Model.MUSIC_TRACK,musicTrack);
			myChannel.stop();
			myChannel=null;
		}
	}
}