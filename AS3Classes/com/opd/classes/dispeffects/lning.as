
package com.opd.classes.dispeffects{
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.oaxoa.fx.Lightning;
	import com.oaxoa.fx.LightningFadeType;
	import flash.filters.GlowFilter;
	import flash.display.BlendMode;
	
	public class lning extends MovieClip{
 
		private const cx:uint=360;
		private const cy:uint=320;
		private var color:uint=0xffff99;
		private var ll:Lightning;
		private var attVar=false;
		
		public function lning(){
			ll=new Lightning(color, 2);
			ll.blendMode=BlendMode.ADD;
			ll.childrenDetachedEnd=true;
			ll.childrenLifeSpanMin=.1;
			ll.childrenLifeSpanMax=2;
			ll.childrenMaxCount=4;
			ll.childrenMaxCountDecay=.5;
			ll.steps=150;
			ll.alphaFadeType=LightningFadeType.TIP_TO_END;
			var glow:GlowFilter=new GlowFilter();
			glow.color=color;
			glow.strength=3.5;
			glow.quality=3;
			glow.blurX=glow.blurY=10;
			addChild(ll);
			ll.childrenProbability=.3;
		}
		
		public function showLightning(){
			addEventListener(Event.ENTER_FRAME, onframe);
		}
		
		public function clearLightning(){
			removeEventListener(Event.ENTER_FRAME, onframe);
		}
		
		public function setLightning($sPnt=null,$ePnt=null,$att=null){
			if($sPnt!=null){
				ll.startX=$sPnt.x;
				ll.startY=$sPnt.y;
			}
			if($ePnt!=null){
				ll.endX=$ePnt.x;
				ll.endY=$ePnt.y;
			}
			if($att!=null){
				attVar=$att;
				if(attVar==true){
					ll.alphaFadeType=LightningFadeType.TIP_TO_END;
					ll.childrenProbability=0;
					ll._thickness=4;
				}else{
					ll.alphaFadeType=LightningFadeType.GENERATION;
					ll.childrenProbability=.3;
					ll._thickness=2;
				}
			}
			ll.killAllChildren();
		}
 
		function onframe(event:Event):void {
			if(attVar==true){
				ll.killAllChildren();
			}
			ll.update();
		}
		
		public function deit(){
			clearLightning();
		}
	}
}