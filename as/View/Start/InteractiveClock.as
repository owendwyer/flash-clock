/**
* @author: Owen Dwyer
* @author Email: odwyer@gmail.com
* date Oct/13/2010
*/

/**
* Clock you can adjust and have time displayed
*/
package View.Start{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.utils.setTimeout;
	import flash.utils.clearTimeout;
	import com.opd.classes.util.MyUtils;
	import com.opd.classes.util.TextUtils;
	import com.opd.classes.util.Speaker;
	
	public class InteractiveClock extends MovieClip{
		private var mins:int;
		private var hrs:int;
		private var tOut;
		
		public function init(){
			setCurTime();
			addLists();
		}
		
		private function setCurTime(e:MouseEvent=null){
			var cTime:Date=new Date();
			hrs=cTime.hours;
			mins=cTime.minutes;
			mins=(Math.round(mins/5))*5;
			if(hrs>12){
				hrs-=12;
			}
			updateTime();
		}
		
		private function addLists(){
			addHandLists();
			navBar.but_reset.init(this.setCurTime);
			navBar.but_l1.init(this.goLessFive);
			navBar.but_l2.init(this.goLessQuarter);
			navBar.but_l3.init(this.goLessHour);
			navBar.but_r1.init(this.goMoreFive);
			navBar.but_r2.init(this.goMoreQuarter);
			navBar.but_r3.init(this.goMoreHour);
		}
		
		private function playAudio(e:MouseEvent=null){
			Speaker.SpeakThis(dText.text);
		}
		
		private function goLessFive(e:MouseEvent=null){
			mins-=1;
			mins=(Math.floor(mins/5))*5;
			updateTime();
		}
		
		private function goMoreFive(e:MouseEvent=null){
			mins+=1;
			mins=(Math.ceil(mins/5))*5;
			updateTime();
		}
		
		private function goLessQuarter(e:MouseEvent=null){
			mins-=1;
			mins=(Math.floor(mins/15))*15;
			updateTime();
		}
		
		private function goMoreQuarter(e:MouseEvent=null){
			mins+=1;
			mins=(Math.ceil(mins/15))*15;
			updateTime();
		}
		
		private function goLessHour(e:MouseEvent=null){
			hrs--;
			updateTime();
		}
		
		private function goMoreHour(e:MouseEvent=null){
			hrs++;
			updateTime();
		}
		
		private function updateTime(){
			if(hrs>12){
				hrs-=12;
			}
			if(hrs<=0){
				hrs+=12;
			}
			if(mins<0){
				mins+=60;
				hrs--;
			}
			if(mins>60){
				mins-=60;
				hrs++;
			}
			big.rotation=mins*6;
			small.rotation=hrs*30;
			small.rotation+=mins/2;
			if(mins>30){
				var side="to";
			}else{
				side="past";
			}
			dText.text=TextUtils.TimeToText(hrs,mins);
		}
		
		private function addHandLists(){
			big.init(this.bigDrag);
			small.init(this.smallDrag);
		}
		
		private function smallDrag(){
			stage.addEventListener(MouseEvent.MOUSE_UP, smallRelease);
			stage.addEventListener(Event.ENTER_FRAME, smallMover);
		}
		
		private function bigDrag(){
			dirCheck();
			stage.addEventListener(MouseEvent.MOUSE_UP, bigRelease);
			stage.addEventListener(Event.ENTER_FRAME, bigMover);
		}
		
		private function smallMover(e:Event){
			var rot=MyUtils.ReturnRotation(small.x,small.y,mouseX,mouseY);
			if(rot<0){
				rot=360+rot;
			}
			var tVar=Math.round(rot/2.5);
			hrs=Math.floor(tVar/12);
			mins=(tVar-hrs*12)*5;
			updateTime();
		}
		
		private function bigMover(e:Event){
			var rot=MyUtils.ReturnRotation(big.x,big.y,mouseX,mouseY);
			rot/=6;
			if(rot<0){
				rot=60+rot;
			}
			mins=Math.round(rot);
			hrsCheck();
			updateTime();
		}
		
		private function hrsCheck(){
			var ori=big.ori;
			dirCheck();
			if(ori=="to"&&big.ori=="past"){
				hrs++;
			}
			if(ori=="past"&&big.ori=="to"){
				hrs--;
			}
		}
		
		private function dirCheck(){
			big.ori="false";
			if(mins>=45){
				big.ori="to";
			}
			if(mins<=15){
				big.ori="past";
			}
		}
		
		private function bigRelease(e:MouseEvent){
			big.rAddList();
			stage.removeEventListener(MouseEvent.MOUSE_UP, bigRelease);
			stage.removeEventListener(Event.ENTER_FRAME, bigMover);
		}
		
		private function smallRelease(e:MouseEvent){
			small.rAddList();
			stage.removeEventListener(MouseEvent.MOUSE_UP, smallRelease);
			stage.removeEventListener(Event.ENTER_FRAME, smallMover);
		}
		
		public function deit(){
			big.deit();
			small.deit();
			navBar.but_reset.deit();
			navBar.but_l1.deit();
			navBar.but_l2.deit();
			navBar.but_l3.deit();
			navBar.but_r1.deit();
			navBar.but_r2.deit();
			navBar.but_r3.deit();
			clearTimeout(tOut);
			stage.removeEventListener(MouseEvent.MOUSE_UP, bigRelease);
			stage.removeEventListener(Event.ENTER_FRAME, bigMover);
			stage.removeEventListener(MouseEvent.MOUSE_UP, smallRelease);
			stage.removeEventListener(Event.ENTER_FRAME, smallMover);
		}
	}
}