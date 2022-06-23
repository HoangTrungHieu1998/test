function ChangeTab(val)
		{	
			if (val == "1")
			{
				document.getElementById("Th_1").style.color="#630817"
            	document.getElementById("Th_2").style.color="#6F6F6F"
       
				document.getElementById("tblTG1").style.display = "inline";
				document.getElementById("tblTG2").style.display = "none";
			}
			if (val == "2")
			{				
				document.getElementById("Th_1").style.color="#6F6F6F"
				document.getElementById("Th_2").style.color="#630817"
            					
				document.getElementById("tblTG1").style.display = "none";
				document.getElementById("tblTG2").style.display = "inline";
			}
					
        	if (val == "3")
			{
				document.getElementById("Th_3").style.color="#630817"
            	document.getElementById("Th_4").style.color="#6F6F6F"
       
				document.getElementById("tblTG3").style.display = "inline";
				document.getElementById("tblTG4").style.display = "none";
			}
			if (val == "4")
			{				
				document.getElementById("Th_3").style.color="#6F6F6F"
				document.getElementById("Th_4").style.color="#630817"
            					
				document.getElementById("tblTG3").style.display = "none";
				document.getElementById("tblTG4").style.display = "inline";
			}
			
		}