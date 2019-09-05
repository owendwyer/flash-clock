
package com.opd.classes.util{
	public class SiteLock{
		public static function CheckSite($tar,$cur){
			var out=false;
			var aSite=$tar;
			var cSite=$cur.split("/")[2];
			if(cSite.indexOf(aSite)==(cSite.length-aSite.length)){
				if(cSite.indexOf(aSite)!=-1){
					out=true;
				}
			}
			return(out);
		}
	}
}
