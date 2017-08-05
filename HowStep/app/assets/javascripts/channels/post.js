App.post = App.cable.subscriptions.create('PostChannel', {
        received: function(data) {
            $("#comments").removeClass('hidden');
            return $('#comments').append(data['comment']);
        }
    });

$(document).on('turbolinks:load', function() {
    submitNewComment();
});

function submitNewComment(){
    $('textarea#comment_content').keydown(function(event) {
        if (event.keyCode == 13) {
                $('[data-send="comment"]').click();
                $('[data-textarea="comment"]').val("");
                return true;
            }
    });
}

var getCommentElement = function(data) {
    var comment = $('<div class="row"></div>');
    var div_1 = $('<div class="col-md-2">');
    var link = $('<a></a>');
    $(link).attr('href', data.user);
    var image = $('<img>');
    $(image).attr('src', data.image);
    link.append(image);
    div_1.append(link);

    var div_2 = $('<div class="col-md-10">');
    $(div_2).append(data.comment);

    var div_3 = $('<div class="col-md-12">');
    $(div_3).append($('<hr/>'));

    comment.append(div_1);
    comment.append(div_2);
    comment.append(div_3);

    return comment;

}