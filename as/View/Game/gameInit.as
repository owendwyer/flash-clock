/**
* @author: Owen Dwyer
* @author Email: odwyer@gmail.com
* date Oct/13/2010
*/

/**
* Clock game
*/
package View.Game{
	import flash.events.Event;
	import com.opd.classes.util.MyUtils;
	public class gameInit{
		private var _model:Model;
		public function gameInit($model:Model){
			_model=$model;
			
			initQuestArray();
			setSeqArray();
			_model.valOb[Model.PROG_VAR]=-1;
		}
		
		private function setSeqArray(){
			var seqArr:Array=new Array();
			var tArr:Array=new Array();
			
			for(var i=0;i<6;i++){
				tArr[i]=i;
			}
			tArr=MyUtils.randomizeArray(tArr);
			for(i=0;i<3;i++){
				seqArr[i]=tArr[i];
			}
			
			for(i=0;i<12;i++){
				tArr[i]=i+6;
			}
			tArr=MyUtils.randomizeArray(tArr);
			for(i=0;i<6;i++){
				seqArr[i+3]=tArr[i];
			}
			
			for(i=0;i<18;i++){
				tArr[i]=i+18;
			}
			tArr=MyUtils.randomizeArray(tArr);
			for(i=0;i<9;i++){
				seqArr[i+9]=tArr[i];
			}
			_model.setSeqArray(seqArr);
		}
		
		private function initQuestArray(){
			var qArr:Array=new Array();
			
			qArr[0]=new cQue(3,4,5);
			qArr[1]=new cQue(7,8,9);
			qArr[2]=new cQue(11,12,1);
			qArr[3]=new cQue(10.3,11.3,12.3);
			qArr[4]=new cQue(5.3,6.3,7.3);
			qArr[5]=new cQue(12.3,1.3,2.3);
			
			qArr[6]=new cQue(3.15,3.45,4.15);
			qArr[7]=new cQue(4.15,4.45,5.15);
			qArr[8]=new cQue(5.45,6.45,7.15);
			qArr[9]=new cQue(10.15,11.15,10.45);
			qArr[10]=new cQue(7.45,8.45,9.45);
			qArr[11]=new cQue(12.45,1.15,1.45);
			qArr[12]=new cQue(2.45,3.45,4.15);
			qArr[13]=new cQue(7.15,8.15,9.45);
			qArr[14]=new cQue(6.15,6.45,7.14);
			qArr[15]=new cQue(11.15,11.45,1.45);
			qArr[16]=new cQue(1.15,1.45,2.15);
			qArr[17]=new cQue(9.45,10.15,10.45);
	
			qArr[18]=new cQue(2.55,3.55,4.55);
			qArr[19]=new cQue(10.55,11.55,12.55);
			qArr[20]=new cQue(5.05,6.05,7.05);
			qArr[21]=new cQue(8.05,9.05,10.05);
			qArr[22]=new cQue(7.05,6.55,7.55);
			qArr[23]=new cQue(2.05,2.55,3.05);
			qArr[24]=new cQue(3.5,4.5,5.1);
			qArr[25]=new cQue(11.5,11.1,12.1);
			qArr[26]=new cQue(7.1,7.5,8.5);
			qArr[27]=new cQue(9.1,9.5,10.1);
			qArr[28]=new cQue(7.5,8.5,9.5);
			qArr[29]=new cQue(4.35,5.35,6.35);
			qArr[30]=new cQue(2.35,3.25,3.35);
			qArr[31]=new cQue(9.25,9.35,9.55);
			qArr[32]=new cQue(11.2,11.4,12.2);
			qArr[33]=new cQue(12.4,1.2,1.4);
			qArr[34]=new cQue(5.55,6.05,7.25);
			qArr[35]=new cQue(10.2,10.4,10.5);
			
			_model.setQuestArray(qArr);
		}
	}
}