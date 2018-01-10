$(document).ready(function(){
    $('#search_button').click( function() {
        console.log('hui');
        var query = document.getElementById('search_input').value;
        location.href = "/posts?search="+query;
    });
});