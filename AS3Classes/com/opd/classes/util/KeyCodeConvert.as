package com.opd.classes.util
{
	public class KeyCodeConvert
	{
		//returns letter from key code
		public static function returnLetter($inCode:int):String{
			var outString=new String;
			switch($inCode){
				case 81:
				outString='q';
				break;
				case 87:
				outString='w';
				break;
				case 69:
				outString='e';
				break;
				case 82:
				outString='r';
				break;
				case 84:
				outString='t';
				break;
				case 89:
				outString='y';
				break;
				case 85:
				outString='u';
				break;
				case 73:
				outString='i';
				break;
				case 79:
				outString='o';
				break;
				case 80:
				outString='p';
				break;
				case 65:
				outString='a';
				break;
				case 83:
				outString='s';
				break;
				case 68:
				outString='d';
				break;
				case 70:
				outString='f';
				break;
				case 71:
				outString='g';
				break;
				case 72:
				outString='h';
				break;
				case 74:
				outString='j';
				break;
				case 75:
				outString='k';
				break;
				case 76:
				outString='l';
				break;
				case 90:
				outString='z';
				break;
				case 88:
				outString='x';
				break;
				case 67:
				outString='c';
				break;
				case 86:
				outString='v';
				break;
				case 66:
				outString='b';
				break;
				case 78:
				outString='n';
				break;
				case 77:
				outString='m';
				break;
				case 32:
				outString=' ';
				break;
			}
			return outString;
		}
	}
}