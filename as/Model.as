/**
* @author: Owen Dwyer
* @author Email: odwyer@gmail.com
* date Oct/13/2010
*/

/**
* Clock game
*/
package{
	import flash.events.EventDispatcher;
	import flash.events.Event;
	import View.Game.cQue;
	public class Model extends EventDispatcher{
		
		public var valOb:Object=new Object();
		
		public static const PROG_VAR:String="progVar";
		public static const VIEW_CHANGE:String="viewChange";
		public static const TIME_VAR:String="timeVar";
		public static const SCORE_VAR:String="scoreVar";
		public static const HS_XML:String="hsXML";
		public static const HS_SEND:String="hsSend";
		public static const QUEST_ARRAY:String="qArray";
		public static const SEQ_ARRAY:String="sArray";
		public static const JUMP:String="jump";
		public static const FALL:String="fall";
		public static const HIT_VAR:String="hitVar";
		public static const TAR_VAR:String="tarVar";
		public static const GAME_READY:String="gameReady";
		public static const CUR_QUEST:String="curQuestion";
		public static const GAME_FIN:String="gameFin";
		public static const HIGH_SCORES:String="highScores";
		public static const HIGH_SCORES_URL:String="highScoresUrl";
		public static const HIGH_SCORES_NAME:String="hsName";
		public static const HIGH_SCORES_LOCAL:String="hsLocal";
		public static const TAKE_PLANK:String="takePlank";
		
		public function takePlank(){
			dispatchEvent(new Event(TAKE_PLANK));
		}
		
		public function sendScores($nom:String,$local:String){
			valOb[HIGH_SCORES_NAME]=$nom;
			valOb[HIGH_SCORES_LOCAL]=$local;
			dispatchEvent(new Event(HIGH_SCORES_NAME));
		}
		
		public function setHSUrl($url:String){
			valOb[HIGH_SCORES_URL]=$url;
		}
		
		public function setHighScores($hScrs:XML){
			valOb[HIGH_SCORES]=$hScrs;
			dispatchEvent(new Event(HIGH_SCORES));
		}
		
		public function setGameFin(){
			dispatchEvent(new Event(GAME_FIN));
		}
		
		public function setTimeVar($tVar:Number){
			valOb[TIME_VAR]=$tVar;
		}
		
		public function setCurQuest($quest:cQue){
			valOb[CUR_QUEST]=$quest;
			dispatchEvent(new Event(CUR_QUEST));
		}
		
		public function setProgVar($pVar:int){
			valOb[PROG_VAR]=$pVar;
		}
		
		public function setTarVar($tVar:int){
			valOb[TAR_VAR]=$tVar;
		}
		
		public function setReady(){
			dispatchEvent(new Event(GAME_READY));
		}
		
		public function setHitVar($hVar:int){
			valOb[HIT_VAR]=$hVar;
			dispatchEvent(new Event(HIT_VAR));
		}
		
		public function manJump(){
			dispatchEvent(new Event(JUMP));
		}
		
		public function manFall(){
			dispatchEvent(new Event(FALL));
		}
		
		public function setView($view:String){
			valOb[VIEW_CHANGE]=$view;
			dispatchEvent(new Event(VIEW_CHANGE));
		}
		
		public function setQuestArray($qArr:Array){
			valOb[QUEST_ARRAY]=$qArr;
		}
		
		public function setSeqArray($seqArr:Array){
			valOb[SEQ_ARRAY]=$seqArr;
		}
	}
}