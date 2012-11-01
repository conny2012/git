function printer() {
    var s = document.theform.text.value;
    var regExp=/\n/gi;
    s = s.replace(regExp,'<br>');
    pWin = window.open('','pWin','location=yes, menubar=yes, toolbar=yes');
    pWin.document.open();
    pWin.document.write('<html><head></head><body>');
    pWin.document.write(s);
    pWin.document.write('</body></html>');
    pWin.print();
    pWin.document.close();
    pWin.close();
}

function isBlank(){
	var x = document.theform.text.value;
	if (x == "" ||  x== 0) {
		alert('keine leere eingabe erlaubt ,bitte erneut schreiben');
         return false;
     }
	return true;
}
	


