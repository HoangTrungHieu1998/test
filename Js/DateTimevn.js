// JScript File

function startclock()
	{
		var curTime=new Date();
		var nhours=curTime.getHours();
		var nmins=curTime.getMinutes();
		var nsecn=curTime.getSeconds();
		var nday=curTime.getDay();
		var nmonth=curTime.getMonth();
		var ntoday=curTime.getDate();
		var nyear=curTime.getYear();
		var AMorPM=" ";

		if (nhours==0)
        nhours=12;
        if (nsecn<10)
        nsecn="0"+nsecn;
        if (nmins<10)
        nmins="0"+nmins;
        if (nday==0)
        nday="Chủ nhật";
        if (nday==1)
        nday="Thứ hai";
        if (nday==2)
        nday="Thứ ba";
        if (nday==3)
        nday="Thứ tư";
        if (nday==4)
        nday="Thứ năm";
        if (nday==5)
        nday="Thứ sáu";
        if (nday==6)
        nday="Thứ bảy";
		nmonth+=1;

		if (nyear<=99)
			nyear= "19"+nyear;

		if ((nyear>99) && (nyear<2000))
			nyear+=1900;
		var d;
		d= document.getElementById("theClock");
		d.innerHTML=nday+", " + ntoday +"-" + nmonth +"-"+nyear + ", " + nhours+":"+nmins + ":"+nsecn + " GMT+7";

		setTimeout('startclock()',1000);

} 
