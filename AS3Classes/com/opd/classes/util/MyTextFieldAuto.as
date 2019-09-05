package com.opd.classes.util{
	import flash.display.MovieClip;
	import flash.text.*;
	
	public class MyTextFieldAuto extends MovieClip{
		private var myFormat;
		private var myFont;
		private var tf;
		
		public function MyTextFieldAuto($txt:String,$myFont=null,$col="0x555555",$size=20,$wdth=500){
			myFormat=new TextFormat();
			tf=new TextField();
			if($myFont!=null){
				myFont=new $myFont;
				myFormat.font=myFont.fontName;
			}
			myFormat.size=$size;
			myFormat.color=$col;
			myFormat.align=TextFormatAlign.LEFT;
			myFormat.bold=true;
			tf.defaultTextFormat=myFormat;
			tf.selectable=false;
			if($myFont!=null){
				tf.embedFonts=true;
				//tf.antiAliasType=AntiAliasType.ADVANCED;
			}
			tf.autoSize=TextFieldAutoSize.LEFT;
			tf.multiline=true;
			tf.wordWrap=true;
			tf.width=$wdth;
			tf.text=$txt;
			//var addX=tf.getLineMetrics(0);
			//trace('mets is '+addX.x);
			tf.width=tf.textWidth+5;
			addChild(tf);
			//tf.x=-tf.width/2;
			//tf.y=-tf.height/2;
		}
		
		public function setGold(){
			myFormat.color='0xffffff';
			tf.setTextFormat(myFormat);
		}
	}
}