package com.opd.classes.util
{
	import flash.display.*;
	import flash.ui.*;
	import flash.net.*;
	import flash.events.*;
	public class MyUtils extends Sprite
	{
		//randomizes an array
		public static function randomizeArray(inArray:Array):Array{
			var outArray:Array = new Array();
			while(inArray.length>0){
				outArray.push(inArray.splice(Math.round(Math.random()*inArray.length-1), 1)[0]); 
			} 
			return outArray;
		}
		
		//randomizes an array
		public static function randomizeArrayInit(inArray:Array,init):Array{
			var outArray = new Array();
			while(inArray.length>0){
				outArray.push(inArray.splice(Math.round(Math.random()*inArray.length-1), 1)[0]); 
			}
			var rvs=reverseArray(outArray,init);
			var str=outArray[0];
			outArray[0]=outArray[rvs];
			outArray[rvs]=str;
			return outArray;
		}
		
		public static function reverseArray(inArray:Array,inVar:int){
			for(var i in inArray){
				if(inArray[i]==inVar){
					return(i);
				}
			}
		}
		
		public static function scramblePositions($inArr:Array){
			var tArr=new Array;
			var xArr=new Array;
			var yArr=new Array;
			for(var i in $inArr){
				tArr[i]=i;
				xArr[i]=$inArr[i].x;
				yArr[i]=$inArr[i].y;
			}
			do{
				tArr=randomizeArray(tArr);
			}while($inArr[0].x==xArr[tArr[0]]&&$inArr[0].y==yArr[tArr[0]])
			for(i in tArr){
				$inArr[i].x=xArr[tArr[i]];
				$inArr[i].y=yArr[tArr[i]];
			}
		}
		
		public static function getRanArr($lim:int){
			var myArr=new Array;
			for(var i=0;i<$lim;i++){
				myArr.push(i);
			}
			return(randomizeArray(myArr));
		}
		
		//returns the date
        public static function returnDate():String{
            var myDate = new Date();
            var myDay = myDate.getDate();
            var myMonth = myDate.getMonth();
            var myYear = myDate.getFullYear();
			var monArray=new Array();
			monArray[0] = "Jan";
            monArray[1] = "Feb";
            monArray[2] = "Mar";
            monArray[3] = "Apr";
            monArray[4] = "May";
            monArray[5] = "Jun";
            monArray[6] = "Jul";
            monArray[7] = "Aug";
            monArray[8] = "Sep";
            monArray[9] = "Oct";
            monArray[10] = "Nov";
            monArray[11] = "Dec";
			var output = myDay.toString() + "/" + monArray[myMonth] + "/" + myYear.toString();
            return output;
        }
		
		public static function SetRightClick($stage){
			var myMenu:ContextMenu = new ContextMenu();
			myMenu.hideBuiltInItems();
			
			var copyrightNotice:ContextMenuItem = new ContextMenuItem("© 2013 GTLE");
			var mySiteLink:ContextMenuItem = new ContextMenuItem("Games To Learn English");
			copyrightNotice.separatorBefore = true;
			
			myMenu.customItems.push(mySiteLink, copyrightNotice);
			$stage.contextMenu = myMenu;
			mySiteLink.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, gotoMySite);
			
			function gotoMySite(e:ContextMenuEvent){
				navigateToURL(new URLRequest("http://gamestolearnenglish.com"), "_blank");
			}
		}
		
		public static function ReturnRotation($sourceX:Number,$sourceY:Number,$mouseX:Number,$mouseY:Number){
			var theX:int = $mouseX - $sourceX;
			var theY:int = ($mouseY - $sourceY) * -1;
			var angle = Math.atan(theY/theX)/(Math.PI/180);
			if (theX<0) {
				angle += 180;
			}
			if (theX>=0 && theY<0) {
				angle += 360;
			}
			angle = (angle*-1) + 90;
			if(angle<0){
				angle+=360;
			}
			return(angle);
		}
		
		public static function DegreesToRadians($deg){
			var rad=$deg*(Math.PI/180);
			return(rad);
		}
		
		public static function RadiansToDegrees($rad){
			var deg=$rad/(Math.PI/180);
			return(deg);
		}
		
		public static function ArrayContains($arr,$val){
			var ret=false;
			for(var i in $arr){
				if($val==$arr[i]){
					ret=true;
				}
			}
			return(ret);
		}
	}
}