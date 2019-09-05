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
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	public class BackgroundMusicDual{
		private var _model:Model;
		private var loop1;
		private var loop2;
		private var curTrack;
		private var myChannel:SoundChannel;
		private var myTransform:SoundTransform;
		private var myTimer;
		private var myTimerVar;
		private var curVol;
		private var musicBool;
		
		public function BackgroundMusicDual($model:Model,$track1,$track2){
			_model=$model;
			_model.set(Model.MUSIC,"on");
			myTransform=new SoundTransform();
			myTransform.volume=0.1;
			myChannel=new SoundChannel();
			myChannel.soundTransform=myTransform;
			loop1=$track1;
			loop2=$track2;
			curTrack=loop1;
			_model.addEventListener(Model.MUSIC,music);
			_model.addEventListener(Model.MUSIC_AVAILABLE,musicAvailable);
			myTimer=new Timer(200,0);
			musicBool=false;
			music(null);
		}
		
		private function music(e:Event){
			if(_model.get(Model.MUSIC)=="off"){
				stopMusic();
			}else{
				if(_model.get(Model.MUSIC_AVAILABLE)>0){
					playMusic();
				}
			}
		}
		
		private function playMusic(){
			if(musicBool==false){
				musicBool=true;
				curVol=0.1;
				myChannel=curTrack.play(0,200);
				var myTrans=new SoundTransform(curVol);
				myChannel.soundTransform=myTrans;
			}
			myTimer.removeEventListener(TimerEvent.TIMER,fadeOut);
			myTimer.addEventListener(TimerEvent.TIMER,fadeIn);
			myTimer.start();
		}
		
		private function stopMusic(){
			myTimer.removeEventListener(TimerEvent.TIMER,fadeIn);
			myTimer.addEventListener(TimerEvent.TIMER,fadeOut);
			myTimer.start();
		}
		
		private function fadeIn(e:TimerEvent){
			curVol+=0.04;
			if(curVol>=0.6){
				curVol=0.6;
				myTimer.removeEventListener(TimerEvent.TIMER,fadeIn);
				myTimer.stop();
			}
			var myTrans=new SoundTransform(curVol);
			myChannel.soundTransform=myTrans;
		}
		
		private function fadeOut(e:TimerEvent){
			curVol-=0.04;
			if(curVol<=0){
				musicBool=false;
				curVol=0;
				myTimer.removeEventListener(TimerEvent.TIMER,fadeOut);
				myTimer.stop();
				myChannel.stop();
			}
			var myTrans=new SoundTransform(curVol);
			myChannel.soundTransform=myTrans;
		}
		
		private function musicAvailable(e:Event){
			if(_model.get(Model.MUSIC_AVAILABLE)==0){
				stopMusic();
			}else{
				if(_model.get(Model.MUSIC_AVAILABLE)==1){
					if(curTrack!=loop1){
						curTrack=loop1;
						musicBool=false;
						myChannel.stop();
					}
				}else{
					if(curTrack!=loop2){
						curTrack=loop2;
						musicBool=false;
						myChannel.stop();
					}
				}
				if(_model.get(Model.MUSIC)=='on'){
					playMusic();
				}
			}
		}
		
		public function deit(){
			myTimer.removeEventListener(TimerEvent.TIMER,fadeOut);
			myTimer.removeEventListener(TimerEvent.TIMER,fadeIn);
			_model.removeEventListener(Model.MUSIC,music);
			_model.removeEventListener(Model.MUSIC_AVAILABLE,musicAvailable);
			myChannel.stop();
			myChannel=null;
		}
	}
}