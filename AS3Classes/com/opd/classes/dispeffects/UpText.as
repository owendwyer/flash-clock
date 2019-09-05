package com.opd.classes.dispeffects
{
	import flash.display.*;
	import com.greensock.*;
	import com.greensock.easing.*;
	
	public class UpText extends MovieClip
	{
		public function UpText(){
			this.visible=false;
		}
		
		public function rise(xPos,yPos,newText){
			dText.text=newText;
			this.x=xPos;
			this.y=yPos;
			this.visible=true;
			TweenLite.to(this,1,{y:yPos-70,ease:Sine.easeOut,onComplete:fin});
		}
		
		private function fin(){
			this.visible=false;
		}
		
		public function stopper(){
			TweenLite.killTweensOf(this);
			this.visible=false;
		}
	}
}