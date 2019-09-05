


package com.opd.classes.util{
	import flash.display.DisplayObject;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.display.PixelSnapping;
	public class ImageUtils{
		public static function imResize($im,$size){
			var ratio=$im.height/$im.width;
			if(ratio>1){
				$im.height=$size;
				$im.width=$im.height/ratio;
			}else{
				$im.width=$size;
				$im.height=$im.width*ratio;
			}
		}
		
		public static function bitDuplicate($im){
			var myBit=$im;
			var myMat=new Matrix(1,0,0,1,0,0);
			var myDat=new BitmapData(myBit.width,myBit.height,true, 0x000000)
			myDat.draw(myBit,myMat);
			return(new Bitmap(myDat,PixelSnapping.NEVER,true));
		}

		public static function imDuplicate(target:DisplayObject, autoAdd:Boolean = false):DisplayObject {
			var targetClass:Class = Object(target).constructor;
			var duplicate:DisplayObject = new targetClass() as DisplayObject;
			
			return duplicate;
		}
	}
}