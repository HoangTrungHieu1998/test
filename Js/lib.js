function link(url)
{
    window.location = url;
}
function hf_findTextBoxHtml(strObjectName) {	
	
	return document.getElementById(strObjectName);
}
function isEmail(emailStr) {
var emailPat=/^(.+)@(.+)$/
var specialChars="\\(\\)<>@,;:\\\\\\\"\\.\\[\\]"
var validChars="\[^\\s" + specialChars + "\]"
var quotedUser="(\"[^\"]*\")"
var ipDomainPat=/^\[(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\]$/
var atom=validChars + '+'
var word="(" + atom + "|" + quotedUser + ")"
var userPat=new RegExp("^" + word + "(\\." + word + ")*$")
var domainPat=new RegExp("^" + atom + "(\\." + atom +")*$")
var matchArray=emailStr.match(emailPat)
if (matchArray==null) {
	//alert("Email address seems incorrect (check @ and .'s)")
	return false
}
var user=matchArray[1]
var domain=matchArray[2]

if (user.match(userPat)==null) {
    //alert("The username doesn't seem to be valid.")
    return false
}

var IPArray=domain.match(ipDomainPat)
if (IPArray!=null) {
    // this is an IP address
	  for (var i=1;i<=4;i++) {
	    if (IPArray[i]>255) {
	        //alert("Destination IP address is invalid!")
		return false
	    }
    }
    return true
    }
}

function _show(id)
{
//    document.getElementById("isVideo").style.display = 'inline';
    document.getElementById("isChangeVideo").innerHTML = "<object id=\"isVideo\" codebase=\"http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=6,4,5,715\" type=\"application/x-oleobject\" height=\"174\" width=\"174\" standby=\"Loading Microsoft Windows Media Player components...\" classid=\"CLSID:6BF52A52-394A-11D3-B153-00C04F79FAA6\">"
                                                       +"  <param name=\"URL\" value=\"getVideo.ashx?v=" + id + "\">"
                                                       +"     <param name=\"rate\" value=\"1\">"
                                                       +"     <param name=\"balance\" value=\"0\">"
                                                       +"     <param name=\"currentPosition\" value=\"0\">"
                                                       +"     <param name=\"defaultFrame\" value=\"0\">"
                                                       +"     <param name=\"playCount\" value=\"999\">"
                                                       +"     <param name=\"CursorType\" value=\"-1\">"
                                                       +"     <param name=\"autoStart\" value=\"0\">"
                                                       +"     <param name=\"autoplay\" value=\"0\">"
                                                       +"     <param name=\"currentMarker\" value=\"0\">"
                                                       +"     <param name=\"invokeURLs\" value=\"-1\">"
                                                       +"     <param name=\"volume\" value=\"50\">"

                                                       +"     <param name=\"mute\" value=\"0\">"
                                                       +"     <param name=\"stretchToFit\" value=\"-1\">"
                                                       +"     <param name=\"windowlessVideo\" value=\"0\">"
                                                       +"     <param name=\"enabled\" value=\"1\">"
                                                       +"     <param name=\"fullScreen\" value=\"0\">"
                                                       +"     <param name=\"enableContextMenu\" value=\"0\">"
                                                       +"     <param name=\"enableErrorDialogs\" value=\"0\">"
                                                       +"     <embed type=\"application/x-mplayer2\"  filename=\"getVideo.ashx?v=" + id + "\" src=\"getVideo.ashx?v=" + id + "\" pluginspage=\"http://www.microsoft.com/Windows/MediaPlayer/\" height=\"174\" width=\"174\" autosize=\"1\""
                                                       +"         autostart=\"1\" clicktoplay=\"1\" displaysize=\"1\" enablecontextmenu=\"0\" enablefullscreencontrols=\"1\""
                                                       +"         enabletracker=\"1\" mute=\"0\" playcount=\"999\" showcontrols=\"1\" showaudiocontrols=\"1\""
                                                       +"         showdisplay=\"0\" showgotobar=\"0\" showpositioncontrols=\"0\" showstatusbar=\"1\" showtracker=\"0\">"
                                                       +"     </embed>"
                                                       +"  </object>";
}

