package com.opd.classes.util{
	public class TextDisp{
		public static function numStringZero($num){
			var out=(Math.round($num)).toString();
			return(out);
		}
		public static function numString($num){
			var out=(Math.round($num*10)/10).toString();
			if(out==Math.round(out)){
				out=out+".0";
				return(out);
			}
			return(out);
		}
		public static function numStringTwo($num){
			var out=(Math.round($num*100)/100).toString();
			if(out==Math.round(out)){
				out=out+".00";
				return(out);
			}
			if(out==Math.round(out*10)/10){
				out=out+"0";
				return(out);
			}
			return(out);
		}
	}
}