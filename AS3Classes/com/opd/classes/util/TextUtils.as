package com.opd.classes.util{
	public class TextUtils{
		public static function RemoveSpaces($inStr:String){
			var tArray:Array=$inStr.split(' ');
			return(tArray.join(''));
		}
		
		public static function firstToUpper (word) {
			var firstLetter = word.substring(1, 0);
			var restOfWord = word.substring(1);
			return (firstLetter.toUpperCase()+restOfWord);
		}
		
		public static function firstToLower (word) {
			var firstLetter = word.substring(1, 0);
			var restOfWord = word.substring(1);
			return (firstLetter.toLowerCase()+restOfWord);
		}
		
		public static function NumToText($num:int){
			var nArray=new Array();
			nArray[1]="one";
			nArray[2]="two";
			nArray[3]="three";
			nArray[4]="four";
			nArray[5]="five";
			nArray[6]="six";
			nArray[7]="seven";
			nArray[8]="eight";
			nArray[9]="nine";
			nArray[10]="ten";
			nArray[11]="eleven";
			nArray[12]="twelve";
			nArray[13]="thirteen";
			nArray[14]="fourteen";
			nArray[15]="fifteen";
			nArray[16]="sixteen";
			nArray[17]="seventeen";
			nArray[18]="eighteen";
			nArray[19]="nineteen";
			nArray[20]="twenty";
			nArray[21]="twenty one";
			nArray[22]="twenty two";
			nArray[23]="twenty three";
			nArray[24]="twenty four";
			nArray[25]="twenty five";
			nArray[26]="twenty six";
			nArray[27]="twenty seven";
			nArray[28]="twenty eight";
			nArray[29]="twenty nine";
			nArray[30]="thirty";
			nArray[31]="thirty one";
			nArray[32]="thirty two";
			nArray[33]="thirty three";
			nArray[34]="thirty four";
			nArray[35]="thirty five";
			nArray[36]="thirty six";
			nArray[37]="thirty seven";
			nArray[38]="thirty eight";
			nArray[39]="thirty nine";
			nArray[40]="forty";
			nArray[41]="forty one";
			nArray[42]="forty two";
			nArray[43]="forty three";
			nArray[44]="forty four";
			nArray[45]="forty five";
			nArray[46]="forty six";
			nArray[47]="forty seven";
			nArray[48]="forty eight";
			nArray[49]="forty nine";
			nArray[50]="fifty";
			
			var out=nArray[$num];
			return(out);
		}
		
		public static function TimeToText($hrs:int,$mins:int){
			var hrs=$hrs;
			var mins=$mins;
			var tArray=new Array();
			tArray[0]=null;
			tArray[1]="one";
			tArray[2]="two";
			tArray[3]="three";
			tArray[4]="four";
			tArray[5]="five";
			tArray[6]="six";
			tArray[7]="seven";
			tArray[8]="eight";
			tArray[9]="nine";
			tArray[10]="ten";
			tArray[11]="eleven";
			tArray[12]="twelve";
			tArray[13]="thirteen";
			tArray[14]="fourteen";
			
			tArray[15]="quarter";
			
			tArray[16]="sixteen";
			tArray[17]="seventeen";
			tArray[18]="eighteen";
			tArray[19]="nineteen";
			tArray[20]="twenty";
			tArray[21]="twenty one";
			tArray[22]="twenty two";
			tArray[23]="twenty three";
			tArray[24]="twenty four";
			tArray[25]="twenty five";
			tArray[26]="twenty six";
			tArray[27]="twenty seven";
			tArray[28]="twenty eight";
			tArray[29]="twenty nine";
			
			tArray[30]="half";
			

			var threwVar:String;
			if(mins>30){
				hrs++;
				mins=60-mins;
				threwVar="to";
			}else{
				threwVar="past";
			}
			if(hrs>12){
				hrs-=12;
			}
			if(hrs<0){
				hrs+=12;
			}
			hrs=tArray[hrs];
			mins=tArray[mins];
			if(mins==null){
				return(hrs+" o clock");
			}
			return(mins+" "+threwVar+" "+hrs);
		}
	}
}