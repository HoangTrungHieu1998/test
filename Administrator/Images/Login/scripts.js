function zoom_shipping() {
	var linkStr = "zoom_shipping.php";	
	window.open(linkStr,'ZOOM','width=500,height=500,scrollbars=1,resizable=0');
}

function zoom_order(linkStr, width, height) {
	newwindow = window.open(linkStr,'ZOOM','width='+width + ',height='+height + ',scrollbars=1,resizable=0');
}

function zoom_order_2(linkStr) {
	window.open(linkStr,'ZOOM','width=650,height=750,scrollbars=1,resizable=0');
}

function zoom_print(form,total_count_gif) {
	if(total_count_gif > 0){
		var yy = "";
		field = form.elements['gift_id[]'];
		var gifid_array=new Array(field.length)
		for (i = 0; i < field.length; i++) {
			var xx = "";
			if(field[i].checked){
				xx = "&gift_id_"+i+"=";
				xx = xx+field[i].value;
			}
			yy = yy + xx;
		}		
	}
	var linkStr = "zoom_print.php?aaa=1"+yy;	
	window.open(linkStr,'ZOOM','width=750,height=800,scrollbars=1,resizable=0');
}

function download_doc(product_id,file) {
	var linkStr = "download.php?product_id="+product_id+"&file="+file;	
	window.open(linkStr,'DownloadDocument','width=1,height=1');
}


function alert_expire(){
	window.focus();
	alert('The session will expire in 5 minutes.  Please save your work or log out.  Thank you.'); 
}

function _JS_Validation_URL(s) {
	var regexp = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/
	return regexp.test(s);
}

function _JS_replace(expression,find,replacement) {	
	if (expression.length>0) {
		atmp = expression.split(find)	
		stmp ="";
		for (ii=0;ii<atmp.length;ii++) {
			stmp += atmp[ii];
			if (ii < atmp.length - 1)
				stmp += replacement;
			
		}	
		return stmp
	}
	else
		return "";
}

function _JS_trim(text)
{
	pos=0;
	for(i=0; i < text.length; i++)
		if(text.charAt(i) == " ")
			pos = i + 1;
		else
			break;
	text = text.substr(pos,text.length - pos);
	pos = text.length;
	for(i = text.length - 1;i >= 0; i--)
		if(text.charAt(i) == " ")
			pos = i;
		else
			break;
	return text.substr(0,pos)
}

function _JS_checkNumber(object_value)

{
    //Returns true if value is a number or is NULL
    //otherwise returns false	
    if (object_value.length == 0)
        return true;

    //Returns true if value is a number defined as
    //   having an optional leading + or -.
    //   having at most 1 decimal point.
    //   otherwise containing only the characters 0-9.
	var start_format = " .+-0123456789";
	var number_format = " .0123456789";
	var check_char;
	var decimal = false;
	var trailing_blank = false;
	var digits = false;

    //The first character can be + - .  blank or a digit.
	check_char = start_format.indexOf(object_value.charAt(0))
    //Was it a decimal?
	if (check_char == 1)
	    decimal = true;
	else if (check_char < 1)
		return false;
        
	//Remaining characters can be only . or a digit, but only one decimal.
	for (var i = 1; i < object_value.length; i++)
	{
		check_char = number_format.indexOf(object_value.charAt(i))
		if (check_char < 0)
			return false;
		else if (check_char == 1)
		{
			if (decimal)		// Second decimal.
				return false;
			else
				decimal = true;
		}
		else if (check_char == 0)
		{
			if (decimal || digits)	
				trailing_blank = true;
        // ignore leading blanks
		}
	        else if (trailing_blank)
			return false;
		else
			digits = true;
	}	
    //All tests passed, so...
    return true
}

function _JS_numberRange(object_value, min_value, max_value)
{
    // check minimum
    if (min_value != null)
	{
        if (object_value < min_value)
			return false;
	}
    // check maximum
    if (max_value != null)
	{
		if (object_value > max_value)
			return false;
	}
    //All tests passed, so...
    return true;
}

function _JS_checkDay(checkYear, checkMonth, checkDay)
{
	maxDay = 31;
	if (checkMonth == 4 || checkMonth == 6 ||
			checkMonth == 9 || checkMonth == 11)
		maxDay = 30;
	else
	if (checkMonth == 2)
	{
		if (checkYear % 4 > 0)
			maxDay =28;
		else
		if (checkYear % 100 == 0 && checkYear % 400 > 0)
			maxDay = 28;
		else
			maxDay = 29;
	}
	return _JS_numberRange(checkDay, 1, maxDay); //check day
}

function _JS_onError(input_object, error_message)
{
	input_object.focus()
 	return false
}

function _JS_setFocusObj(input_object)
{
  //focusobj: global variable
  if (focusobj == "UNDEFINED"){
		focusobj = input_object;
	}
}

function _JS_hasValue(obj, obj_type)
{	if (obj_type == "TEXT" || obj_type == "PASSWORD" || obj_type == "TEXTAREA")
	{
		obj.value = _JS_trim(obj.value);
    	if (obj.value.length == 0) 
      		return false;
    	else 
      		return true;
    }
    else if (obj_type == "SELECT")
	{
        for (i=0; i < obj.length; i++)
    	{
			if (obj.options[i].selected && obj.options[i].value != "")
				return true;
		}
       	return false;	
	}
    else if (obj_type == "SINGLE_VALUE_RADIO" || obj_type == "SINGLE_VALUE_CHECKBOX")
	{
		if (obj.checked)
			return true;
		else
       		return false;	
	}
    else if (obj_type == "RADIO" || obj_type == "CHECKBOX")
	{
		if (typeof(obj.length) == "undefined")  {
			return obj.checked			
		} 		
        for (i=0; i < obj.length; i++)
	    {
			if (obj[i].checked)				
				return true;
		}
       	return false;	
	}
	return false;	
}

function _JS_emailCheck (input_object) {
	var emailStr = input_object.value;
	var emailPat=/^(.+)@(.+)$/
	var specialChars="\\(\\)<>@,;:\\\\\\\"\\.\\[\\]"
	var validChars="\[^\\s" + specialChars + "\]"
	var quotedUser="(\"[^\"]*\")"
	var ipDomainPat=/^\[(\d{1,4})\.(\d{1,4})\.(\d{1,4})\.(\d{1,4})\]$/
	var atom=validChars + '+'
	var word="(" + atom + "|" + quotedUser + ")"
	var userPat=new RegExp("^" + word + "(\\." + word + ")*$")
	var domainPat=new RegExp("^" + atom + "(\\." + atom +")*$")
	var matchArray=emailStr.match(emailPat)
	
	if (matchArray==null) {
		return _JS_onError(input_object,"This address seems to be incorrect (they usually have an @ symbol)")
	}
	var user=matchArray[1]
	var domain=matchArray[2]
	if (user.match(userPat)==null) {
		return _JS_onError(input_object,"The username doesn't seem to be valid.")
	}
	var IPArray=domain.match(ipDomainPat)
	if (IPArray!=null) {
		for (var i=1;i<=4;i++) {
			if (IPArray[i]>255) {
				return _JS_onError(input_object,"Destination IP address is invalid!")
            }
		}
		return true
	}
	var domainArray=domain.match(domainPat)
	if (domainArray==null) {
		return _JS_onError(input_object,"The domain name doesn't seem to be valid.")
	}
	var atomPat=new RegExp(atom,"g")
	var domArr=domain.match(atomPat)
	var len=domArr.length
	if (domArr[domArr.length-1].length<2 ||	domArr[domArr.length-1].length>4) {
		return _JS_onError(input_object,"The address must end in a three-letter domain, or two letter country.")
	}
	if (len<2) {
		return _JS_onError(input_object,"This address is missing a hostname!")
	}
	return true;
}

function _JS_emailCheck2 (object_value) {
	var emailStr = object_value;
	var emailPat=/^(.+)@(.+)$/
	var specialChars="\\(\\)<>@,;:\\\\\\\"\\.\\[\\]"
	var validChars="\[^\\s" + specialChars + "\]"
	var quotedUser="(\"[^\"]*\")"
	var ipDomainPat=/^\[(\d{1,4})\.(\d{1,4})\.(\d{1,4})\.(\d{1,4})\]$/
	var atom=validChars + '+'
	var word="(" + atom + "|" + quotedUser + ")"
	var userPat=new RegExp("^" + word + "(\\." + word + ")*$")
	var domainPat=new RegExp("^" + atom + "(\\." + atom +")*$")
	var matchArray=emailStr.match(emailPat)
	
	if (matchArray==null) {
		//return _JS_onError(input_object,"This address seems to be incorrect (they usually have an @ symbol)")
		return false
	}
	var user=matchArray[1]
	var domain=matchArray[2]
	if (user.match(userPat)==null) {
		//return _JS_onError(input_object,"The username doesn't seem to be valid.")
		return false
	}
	var IPArray=domain.match(ipDomainPat)
	if (IPArray!=null) {
		for (var i=1;i<=4;i++) {
			if (IPArray[i]>255) {
				//return _JS_onError(input_object,"Destination IP address is invalid!")
				return false
            }
		}
		return true
	}
	var domainArray=domain.match(domainPat)
	if (domainArray==null) {
		//return _JS_onError(input_object,"The domain name doesn't seem to be valid.")
		return false
	}
	var atomPat=new RegExp(atom,"g")
	var domArr=domain.match(atomPat)
	var len=domArr.length
	if (domArr[domArr.length-1].length<2 ||	domArr[domArr.length-1].length>4) {
		//return _JS_onError(input_object,"The address must end in a three-letter domain, or two letter country.")
		return false
	}
	if (len<2) {
		//return _JS_onError(input_object,"This address is missing a hostname!")
		return false
	}
	return true;
}

function _JS_checkInteger(object_value)
{
    //Returns true if value is a number or is NULL
    //otherwise returns false
    if (object_value.length == 0)
        return true;
    //Returns true if value is an integer defined as
    //   having an optional leading + or -.
    //   otherwise containing only the characters 0-9.
	var decimal_format = ".";
	var check_char;
    //The first character can be + -  blank or a digit.
	check_char = object_value.indexOf(decimal_format)
    //Was it a decimal?
    if (check_char < 1)
		return _JS_checkNumber(object_value);
    else
		return false;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function validate_multi_select_box(my_multiselect) {
  for (var j=0; j<my_multiselect.length; j++) {
		if ((my_multiselect.options[j].selected)&(my_multiselect.options[j].value !='')){ 
			return true;
		}
  }
  return false;
}

function zoom_admin(pic_large,url,path) {
	var linkStr = "zoom_picture.php?pic_large="+pic_large+"&url="+url+"&path="+path;	
	window.open(linkStr,'ZOOM','width=500,height=346');
}

function check_all(field) {
	if (checkflag == "false") {
	for (i = 0; i < field.length; i++) {
	field[i].checked = true;}
	checkflag = "true";
	return "Bỏ chọn tất cả"; }
	else {
	for (i = 0; i < field.length; i++) {
	field[i].checked = false; }
	checkflag = "false";
	return "Chọn tất cả"; }
}

function check_delete(str_form,str_delete){
	if(confirm(' Bạn thật sự muốn xóa ?')){
		str_form.action = str_delete;
		str_form.submit();
		return true;
	}
}
function check_update(str_form,str_delete,str_value){
	if(confirm(' Are you sure ?')){
		str_form.action = str_delete;
		str_form.actiontype.value = str_value;
		str_form.submit();
		return true;
	}
}

//Move multi selectbox
function _moveItem(form,strlistFrom, strlistTo) {
	var iFrom, nFrom, nextStep, fff;
	var listFrom, listTo;
	frmlen=form.length;
	for (ielement=0;ielement<frmlen;ielement++) {
					ElenameName=form.elements[ielement].name;
					if (ElenameName == strlistFrom) list1 = form.elements[ielement];
					if (ElenameName == strlistTo) list2 = form.elements[ielement];
	}
	listFrom        =        list1;
	listTo                = list2;
	nFrom = listFrom.options.length

	for (i=0; i<nFrom; i++) {
		if (listFrom.options[i].selected == true && listFrom.options[i].value !="") {
			nTo = listTo.options.length
			fff = 0;
			for (j=0; j<nTo; j++) {
				if(listFrom.options[i].value == listTo.options[j].value){
					fff = 1;
					break;
				}
			}
			text        = listFrom.options[i].text;
			value        = listFrom.options[i].value;
			if(fff == 0){
				listTo.options[nTo] = new Option(text, value);
			}
			listFrom.options[i]        = null;
			i--;
			nFrom--;
		}
	}

	return true;
}

//Move multi selectbox
function _moveItem_submit(form,strlistFrom, strlistTo,strlistTo_all) {

	var iFrom, nFrom, nextStep, fff;
	var listFrom, listTo;
	frmlen=form.length;
	for (ielement=0;ielement<frmlen;ielement++) {
					ElenameName=form.elements[ielement].name;
					if (ElenameName == strlistFrom) list1 = form.elements[ielement];
					if (ElenameName == strlistTo) list2 = form.elements[ielement];
	}
	listFrom        =        list1;
	listTo                = list2;
	nFrom = listFrom.options.length

	for (i=0; i<nFrom; i++) {
		if (listFrom.options[i].selected == true && listFrom.options[i].value !="") {
			nTo = listTo.options.length
			fff = 0;
			for (j=0; j<nTo; j++) {
				if(listFrom.options[i].value == listTo.options[j].value){
					fff = 1;
					break;
				}
			}
			text        = listFrom.options[i].text;
			value        = listFrom.options[i].value;
			if(fff == 0){
				listTo.options[nTo] = new Option(text, value);
			}
			listFrom.options[i]        = null;
			i--;
			nFrom--;
		}
	}
	form.act.value = "change_type";
	var listTo_array = new Array();
	listTo_array = strlistTo_all.split(",");
	nlistTo = listTo_array.length;
	var listFrom, listTo,list2;
	for (h=0;h<nlistTo;h++){
		strlistTo1 = listTo_array[h];
		frmlen=form.length;
		for (ielement=0;ielement<frmlen;ielement++) {
						ElenameName=form.elements[ielement].name;
						if (ElenameName == strlistTo1) list2 = form.elements[ielement];
		}
		listTo                = list2;
		nTo = listTo.options.length;

		for (i=0;i<nTo;i++) {
			listTo.options[i].selected = true;	
		}
	}

	form.submit();
	//return true;
}