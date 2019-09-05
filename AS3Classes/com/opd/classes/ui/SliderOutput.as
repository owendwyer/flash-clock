//SliderOutput
package com.opd.classes.ui 
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    
    public class SliderOutput extends flash.display.MovieClip
    {
        public function SliderOutput()
        {
            inited = false;
            return;
        }

        public function init():*
        {
            inited = true;
            myRect = new Rectangle(slide.x, slide.y, slide.width, 0);
            myRatio = slide.width / 100;
            return;
        }

        private function outputter():*
        {
            var loc1:*=undefined;
            if (this.parent) 
            {
                loc1 = this.parent as Object;
                loc1.sliderOutputHandler(this);
            }
            return;
        }

        public function setter(arg1:*):*
        {
            myScore = arg1;
            but.x = myScore * myRatio;
            return;
        }

        public function starter():*
        {
            if (inited == false) 
            {
                init();
            }
            but.addEventListener(MouseEvent.MOUSE_DOWN, dragger);
            but.buttonMode = true;
            return;
        }

        private function dragger(arg1:flash.events.Event):*
        {
            but.startDrag(false, myRect);
            stage.addEventListener(MouseEvent.MOUSE_UP, dropper);
            stage.addEventListener(MouseEvent.MOUSE_MOVE, updatePos);
            return;
        }

        private function updatePos(arg1:flash.events.Event):*
        {
            myScore = Math.round(but.x / myRatio);
            outputter();
            return;
        }

        private function dropper(arg1:flash.events.Event):*
        {
            but.stopDrag();
            stage.removeEventListener(MouseEvent.MOUSE_UP, dropper);
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, updatePos);
            return;
        }

        public function stopper():*
        {
            this.removeEventListener(MouseEvent.MOUSE_UP, dropper);
            but.removeEventListener(MouseEvent.MOUSE_DOWN, dragger);
            but.buttonMode = false;
            return;
        }

        public var myScore:Number;

        private var inited:Boolean=false;

        private var myRect:flash.geom.Rectangle;

        private var myRatio:Number;
    }
}


