document.addEventListener('DOMContentLoaded', function() {
  var checkPageButton = document.getElementById('checkPage');
  checkPageButton.addEventListener('click', function() {

    chrome.tabs.getSelected(null, function(tab) {
	  //get the url of the current page...
      var url = tab.url;
	  var xhr = new XMLHttpRequest();
	  //redirect to the deployed page...Mine is http://localhost:8080/email_signature/ Change accordigly
      xhr.open("GET", "http://localhost:8080/email_signature/?url="+url, false);
      xhr.send();
    });
  }, false);
}, false);
