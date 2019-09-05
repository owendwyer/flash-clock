package com.opd.classes.dispeffects
{
	import flash.display.*;
	import com.opd.classes.util.*;
	public class Scrambler extends MovieClip
	{
		public static function scramble(inArray){
			var seqArray=new Array();
			for(var i in inArray){
				inArray[i].retX=inArray[i].x;
				inArray[i].retY=inArray[i].y;
				seqArray[i]=i;
			}
			seqArray=MyUtils.randomizeArray(seqArray);
			for(var j in inArray){
				inArray[j].x=inArray[seqArray[j]].retX;
				inArray[j].y=inArray[seqArray[j]].retY;
			}
		}
	}
}