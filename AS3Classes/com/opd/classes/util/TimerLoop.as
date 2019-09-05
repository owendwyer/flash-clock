/**
* @author: Owen Dwyer
* @author Email: odwyer@gmail.com
* date Oct/11/2010
*/

/**
* Loop Timer
*/
package com.opd.classes.util{
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	public class TimerLoop{
		private var _par;
		
		private var loopVar:int;
		private var loopLim:int;
		private var loopTimer:Timer;
		private var callBack;
		private var endFun;
		
		public function TimerLoop(){
			loopTimer=new Timer(1000, 0);
		}
		
		public function startLoop($par, $loopVar, $loopLim, $loopTime, $callBack, $endFun){
			_par=$par;
			loopVar=$loopVar;
			loopLim=$loopLim;
			callBack=$callBack;
			endFun=$endFun;
			loopTimer.delay=$loopTime;
			loopTimer.addEventListener(TimerEvent.TIMER, loopFun);
			loopTimer.start();
		}
		
		private function loopFun(e:TimerEvent){
			loopVar++;
			if(loopVar<loopLim){
				callBack(loopVar);
			}else{
				loopTimer.reset();
				loopTimer.removeEventListener(TimerEvent.TIMER, loopFun);
				endFun();
			}
		}
		
		public function stopLoop(){
			loopTimer.reset();
			loopTimer.removeEventListener(TimerEvent.TIMER, loopFun);
		}
	}
}