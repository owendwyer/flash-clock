//ButSetOutput
package com.opd.classes.ui
{
    import flash.display.*;
    import flash.events.*;
    
    public class ButSetOutput extends flash.display.MovieClip
    {
        public function ButSetOutput()
        {
            bArray = new Array();
            hitVar = 0;
            inited = false;
            return;
        }

        private function init():*
        {
            var loc1:*=undefined;
            inited = true;
            loc1 = 1;
            while (this["b" + loc1]) 
            {
                bArray[loc1] = this["b" + loc1];
                bArray[loc1].buttonMode = true;
				bArray[loc1].gotoAndStop(1);
                loc1 = (loc1 + 1);
            }
            tot = loc1;
            return;
        }

        private function clicker(arg1:flash.events.Event):*
        {
            var loc1:*=undefined;
            reset();
            loc1 = 1;
            while (loc1 < tot) 
            {
                var loc2:*=arg1.target;
                switch (loc2) 
                {
                    case bArray[loc1]:
                    {
                        hitVar = loc1;
                        break;
                    }
                }
                loc1 = (loc1 + 1);
            }
            bArray[hitVar].gotoAndStop(2);
            outputter();
            return;
        }

        public function setter(arg1:*):*
        {
            reset();
            hitVar = arg1;
            if (hitVar > 0) 
            {
                bArray[hitVar].gotoAndStop(2);
            }
            return;
        }

        private function outputter():*
        {
            var loc1:*=undefined;
            if (this.parent) 
            {
                loc1 = this.parent as Object;
                loc1.butSetOutputHandler(this);
            }
            return;
        }

        private function reset():*
        {
            var loc1:*=undefined;
            loc1 = 1;
            while (loc1 < tot) 
            {
                bArray[loc1].gotoAndStop(1);
                loc1 = (loc1 + 1);
            }
            return;
        }

        public function starter():*
        {
            if (inited == false) 
            {
                init();
            }
            addEventListener(MouseEvent.CLICK, clicker, true);
            return;
        }

        public function stopper():*
        {
            removeEventListener(MouseEvent.CLICK, clicker);
            return;
        }

        private var bArray:*;

        public var id:int;

        private var tot:int;

        public var hitVar:int=0;

        private var inited:Boolean=false;
    }
}


