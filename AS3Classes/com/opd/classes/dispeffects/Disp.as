package com.opd.classes.dispeffects
{
	import flash.display.*;
	import com.greensock.*;
	import com.greensock.easing.*;
	
	public class Disp extends MovieClip
	{
		public static function Show($mc,$del){
			$mc.visible=true;
			$mc.alpha=0;
			TweenLite.to($mc,$del,{alpha:1});
		}
		
		public static function Hide($mc,$del){
			TweenLite.to($mc,$del,{alpha:0,onComplete:function(){$mc.visible=false;}});
		}
	}
}