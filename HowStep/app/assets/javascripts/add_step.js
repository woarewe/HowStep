var blocks_counter = 1;

$(documet).on('turbolinks:ready', function () {


$('#save_step_changes').click( function() {
    var list_items = document.getElementsByClassName("list-group-item");

    var content = "";

    for(var i = 0; i < list_items.length; i++) {
        switch(list_items[i].className.split(' ')[1]) {
            case 'text-item':
                content += "<p>" + list_items[i].childNodes[1].value + "</p>";
                break;
            case 'image-item':
                content += "<img src=\"" +  list_items[i].childNodes[1].getAttribute('src') + "\">";
                break;
            case 'video-item':
                content +=  "<iframe width=\"100%\" height=\"100%\" src=\"https://www.youtube.com/embed/" + list_items[i].childNodes[1].value.split("v=")[1]
                    + "\" frameborder=\"0\" allowfullscreen></iframe>";
        }
        content += ' ';
    }

    console.log(content);

    $.ajax({
        url : '<%= post_step_path(@post, @step) %>',
        type : "put",
        data : { content: content, title: $('#step_title').value }
    });

});

document.getElementById("upload_widget_opener").addEventListener("click", function() {
    cloudinary.openUploadWidget({ cloud_name: 'drbv794rq', upload_preset: 'sut1j98o'},
        function(error, result) { console.log(result[0].secure_url); newImageElement(result[0].secure_url) });
}, false);


var newImageElement = function(image_url) {
    var list_element = $("<li class='list-group-item image-item'</li>");
    list_element.append($("<label><%= t('views.forms.steps.items.titles.image')%></label>"));
    var image = $("<img>");
    $(image).attr("src", image_url);
    list_element.append(image);
    var destroy_button = ($("<button type='danger' class='btn btn-danger button-margin' style='margin-top: 10px'><%= t('views.forms.steps.items.buttons.destroy') %></button>"));
    $(list_element).attr("id", "list_element_" + blocks_counter);
    $(destroy_button).attr("id", "button_destroy_" + blocks_counter);
    $(destroy_button).attr("onclick", "deleteElement(id)");
    list_element.append(destroy_button);
    $("#items").append(list_element);
    blocks_counter++;
};


$( function() {
    $( "#items" ).sortable({ containment: "parent" });
    $( "#items" ).disableSelection();
} );
$("#add_text").click(function () {
    var list_element = $("<li class='list-group-item text-item'</li>");
    list_element.append($("<label><%= t('views.forms.steps.items.titles.text')%></label>"));
    list_element.append($("<textarea class='form-control' rows='3' placeholder='<%= t('views.forms.steps.items.placeholders.text') %>'></textarea>"));
    var destroy_button = ($("<button type='danger' class='btn btn-danger button-margin' style='margin-top: 10px'><%= t('views.forms.steps.items.buttons.destroy') %></button>"));
    $(list_element).attr("id", "list_element_" + blocks_counter);
    $(destroy_button).attr("id", "button_destroy_" + blocks_counter);
    $(destroy_button).attr("onclick", "deleteElement(id)");
    list_element.append(destroy_button);
    $("#items").append(list_element);
    blocks_counter++;
});

var deleteElement = function (id) {
    $("#list_element_" + id.split("_")[2]).remove();
};

$("#add_video").click(function () {
    var list_element = $("<li class='list-group-item video-item'></li>");
    list_element.append($("<label><%= t('views.forms.steps.items.titles.video')%></label>"));
    list_element.append($("<input class='form-control' rows='3' placeholder='<%= t('views.forms.steps.items.placeholders.video') %>'></input>"));
    var destroy_button = ($("<button type='danger' class='btn btn-danger button-margin' style='margin-top: 10px'><%= t('views.forms.steps.items.buttons.destroy') %></button>"));
    $(list_element).attr("id", "list_element_" + blocks_counter);
    $(destroy_button).attr("id", "button_destroy_" + blocks_counter);
    $(destroy_button).attr("onclick", "deleteElement(id)");
    list_element.append(destroy_button);
    $("#items").append(list_element);
    blocks_counter++;
});
});



