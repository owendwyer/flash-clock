package com.opd.classes.dispeffects
{
	import flash.display.*;
	public class MaskBar extends MovieClip
	{
		private var myWidth:Number;
		public function MaskBar(){
			myWidth=myMask.width;
		}
			
		public function setWidth(mex){
			myMask.width=myWidth*mex;
		}
	}
}