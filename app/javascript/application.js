// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "popper"
import "bootstrap"


function insertKeywordsIntoForm(keywords){
	var para, hiddenInput, br;
	para = document.getElementById('article_keywords');
	//console.log(keywords);
	para.setAttribute('value',keywords);
	return false; //Have this function return true if you want to post right away after adding the hidden value, otherwise leave it to false
}

$(document).ready(function() {
  $('.keyword').click( function() {
    if ($(this).hasClass("btn-light")) {	
    	$(this).addClass('btn-primary').removeClass('btn-light');
    } else if ($(this).hasClass("btn-primary")) {
    	$(this).addClass('btn-light').removeClass('btn-primary');
    }
    const buttons = document.getElementById("keyword_buttons");
	var keywordList = "";
	var first = true;
    for (const child of buttons.children) {
    //console.log(child.value);
  		if (child.classList.contains("btn-primary")) {
  			if (!first) {
  				keywordList+=",";
  			}
  			first = false;
  			keywordList+=child.value;
  		}
	}
    insertKeywordsIntoForm(keywordList);
  });
});