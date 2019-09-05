package com.opd.classes.util{
	import flash.display.MovieClip;
	import flash.text.*;
	public class MyTextField500 extends MovieClip{
		private var myFormat;
		private var myFont;
		public function MyTextField500($txt:String,$myFont=null,$col="0x555555",$size=20,$wdth=100){
			myFormat=new TextFormat();
			var tf=new TextField();
			if($myFont!=null){
				myFont=new $myFont;
				myFormat.font=myFont.fontName;
			}
			myFormat.size=$size;
			myFormat.color=$col;
			myFormat.align=TextFormatAlign.CENTER;
			myFormat.bold=true;
			tf.defaultTextFormat=myFormat;
			tf.selectable=true;
			if($myFont!=null){
				tf.embedFonts=true;
				//tf.antiAliasType=AntiAliasType.ADVANCED;
			}
			tf.autoSize=TextFieldAutoSize.CENTER;
			tf.multiline=true;
			tf.wordWrap=true;
			tf.width=$wdth;
			tf.text=$txt;
			addChild(tf);
			tf.x=-tf.width/2;
			tf.y=-tf.height/2;
		}
	}
}