//// JavaScript Document
//function openImageNews(vLink, vHeight, vWidth)
//{
//	var sLink = (typeof(vLink.href)=='undefined') ? vLink : vLink.href;

//	if (sLink=='')
//	{
//		return false;
//	}

//	winDef = 'status=no,resizable=no,scrollbars=no,toolbar=no,location=no,fullscreen=no,titlebar=yes,height='.concat(vHeight).concat(',').concat('width=').concat(vWidth).concat(',');
//	winDef = winDef.concat('top=').concat((screen.height - vHeight)/2).concat(',');
//	winDef = winDef.concat('left=').concat((screen.width - vWidth)/2);
//	newwin = open('', '_blank', winDef);

//	newwin.document.writeln('<title>Chi tiết hình ảnh!</title><body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">');
//	newwin.document.writeln('<a href="" onClick="window.close(); return false;"><img src="', sLink, '" alt="', 'Dong lai', '" border=0></a>');
//	newwin.document.writeln('</body>');

//	if (typeof(vLink.href) != 'undefined')
//	{
//		return false;
//	}
//}


function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}


//SELECT CELL
	var theoldcell = ""
	function showhide(thecell)
	{	
		if(theoldcell == thecell){
			eval('document.all.'+thecell).style.display = 'none'
			eval('document.all.'+theoldcell).style.display = 'none'
			theoldcell = ""
		}else{
			if(theoldcell != thecell){
				if(theoldcell != "")
				eval('document.all.'+theoldcell).style.display = 'none'
				eval('document.all.'+thecell).style.display = ''
				theoldcell = thecell
			}
		}
	}


	
//NEW MOUSE
function showhidebrotherrows(currentrow)
{
	currentelement = document.getElementById(currentrow) ;
	menunumber = currentrow.split('mastermenu')[1] ;
	
	if (currentelement.parentNode.rows)
	{
		//alert(currentelement.parentNode.rows) ;
		//alert(menunumber) ;
		for (i=0; i<currentelement.parentNode.rows.length; i++)
		{
			subelement = currentelement.parentNode.rows[i] ;
			if (subelement.id != "")
			{
				subnumber = "" ;
				issubnumber = subelement.id.split('detailmenu')[0] ;
				if (issubnumber != subelement.id)
				{
					subnumber = subelement.id.split('detailmenu')[1] ;
					//alert("menunumber : " + menunumber + " id : " + subelement.id + " no : " + subnumber + " show hide : " + (subnumber == menunumber)) ;
					if (subnumber == menunumber)
					{
						if (subelement.style.display == "none")
							subelement.style.display = "" ;
						else
							subelement.style.display = "none" ;
					}
					else
					{
						subelement.style.display = "none" ;						
					}
				}
			}
		}
	}
}