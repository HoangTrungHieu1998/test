// JScript File

var frm = document.aspnetForm;	    
	    function CheckAll( checkAllBox )
	    {
	        var actVar = checkAllBox.checked ;
	        for(i=0;i< document.aspnetForm.length;i++)
	        {
		        e = document.aspnetForm.elements[i];
		        if ( e.type=='checkbox'&& e.name.indexOf("contract") != -1)
		        e.checked= actVar ;
	        }
	    }
	    function CheckAll1( checkAllBox )
	    {
	        var actVar = checkAllBox.checked ;
	        for(i=0;i< document.aspnetForm.length;i++)
	        {
		        e = document.aspnetForm.elements[i];
		        if ( e.type=='checkbox'&& e.name.indexOf("contract1") != -1)
		        e.checked= actVar ;
	        }
	    }
	     function CheckAll2( checkAllBox )
	    {
	        var actVar = checkAllBox.checked ;
	        for(i=0;i< document.aspnetForm.length;i++)
	        {
		        e = document.aspnetForm.elements[i];
		        if ( e.type=='checkbox'&& e.name.indexOf("contract") != -1)
		        e.checked= actVar ;
	        }
	    }

	    function UnCheck()
	    {
	      var allchecked = true; 
		    for(i=0;i< document.aspnetForm.length;i++)
		    { 
			    e = document.aspnetForm.elements[i];
		    if ( e.type=='checkbox' && e.name.indexOf("contract") != -1 ) 
		    { 
			    if ( !e.checked ) 
			    allchecked = false;
		    } 
		    } 
		    for(i=0;i< document.aspnetForm.length;i++) 
		    { e = document.aspnetForm.elements[i];
			    if ( e.type=='checkbox' && e.name.indexOf("checkAll") != -1 )
			    { 
				    e.checked= allchecked ;
				    break;
			    }
		    } 
	    }
	  
	function CheckAll1( checkAllBox )
	    {
		    var actVar = checkAllBox.checked ;
		    for(i=0;i< document.aspnetForm.length;i++)
		    {
			    e=document.aspnetForm.elements[i];
			    if ( e.type=='checkbox'&& e.name.indexOf("contract1") != -1)
			    e.checked= actVar ;
		    }
	    }
    function UnCheck1()
    {
	    var allchecked = true; 
	    for(i=0;i< document.aspnetForm.length;i++)
	    { 
		    e=document.aspnetForm.elements[i];
	    if ( e.type=='checkbox' && e.name.indexOf("contract1") != -1 ) 
	    { 
		    if ( !e.checked ) 
		    allchecked = false;
	    } 
	    } 
	    for(i=0;i< document.aspnetForm.length;i++) 
	    { e=document.aspnetForm.elements[i];
		    if ( e.type=='checkbox' && e.name.indexOf("checkAll1") != -1 )
		    { 
			    e.checked= allchecked ;
			    break;
		    }
	    } 
    }	   
	    
	    
	 function CheckAll2( checkAllBox )
     {
        var actVar = checkAllBox.checked ;
        for(i=0;i< document.aspnetForm.length;i++)
        {
	        e=document.aspnetForm.elements[i];
	        if ( e.type=='checkbox'&& e.name.indexOf("contract2") != -1)
	        e.checked= actVar ;
        }
     }
    function UnCheck2()
    {
	    var allchecked = true; 
	    for(i=0;i< document.aspnetForm.length;i++)
	    { 
		    e=document.aspnetForm.elements[i];
	    if ( e.type=='checkbox' && e.name.indexOf("contract2") != -1 ) 
	    { 
		    if ( !e.checked ) 
		    allchecked = false;
	    } 
	    } 
	    for(i=0;i< document.aspnetForm.length;i++) 
	    { e=document.aspnetForm.elements[i];
		    if ( e.type=='checkbox' && e.name.indexOf("checkAll2") != -1 )
		    { 
			    e.checked= allchecked ;
			    break;
		    }
	    } 
    }