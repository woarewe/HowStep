$(document).on('turbolinks:load', function() {

var blocks_counter = 1;

    $("#add_text").click(function () {
        var list_element = $("<li class='text-item'></li>");
        var form = $("<form class='ol-item'></form>");
        var form_group = $("<div class='form-group'></div>");
        form_group.append($("<label>Text</label>"));
        form_group.append($("<textarea class='form-control' rows='3' placeholder='Type here...'></textarea>"));
        var destroy_button = ($("<button type='danger' class='btn btn-danger button-margin'>Destroy</button>"));
        $(list_element).attr("id", "list_element_" + blocks_counter);
        $(destroy_button).attr("id", "button_destroy_" + blocks_counter);
        $(destroy_button).attr("onclick", "deleteElement(id)");
        form_group.append(destroy_button);

        form.append(form_group);
        list_element.append(form);
        $("#items").append(list_element);
        blocks_counter++;
    });

    var deleteElement = function (id) {
        $("#list_element_" + id.split("_")[2]).remove();
    };

    $("#add_video").click(function () {
        var list_element = $("<li class='video-item'></li>");
        var form = $("<form class='ol-item'></form>");
        var form_group = $("<div class='form-group'></div>");
        form_group.append($("<label>Video</label>"));
        form_group.append($("<input class='form-control' placeholder='Paste here youtube link...'></textarea>"));
        var destroy_button = ($("<button type='danger' class='btn btn-danger button-margin'>Destroy</button>"));
        $(list_element).attr("id", "list_element_" + blocks_counter);
        $(destroy_button).attr("id", "button_destroy_" + blocks_counter);
        $(destroy_button).attr("onclick", "deleteElement(id)");
        form_group.append(destroy_button);

        form.append(form_group);
        list_element.append(form);
        $("#items").append(list_element);
        blocks_counter++;
    });

    $("#add_image").click(function () {
        var list_element = $("<li class='video-item'></li>");
        var form = $("<form class='ol-item'></form>");
        var form_group = $("<div class='form-group'></div>");
        var drop_zone = $(" <div class='dropzone'></div>");

        drop_zone.append($("<div>Drop here...</div>"));
        drop_zone.append($("<input type='file' accept='image/png, image/jpeg'/>"));
        $(drop_zone).attr("id", "drop_zone_" + blocks_counter);


        form_group.append($("<label>Image</label>"));
        form_group.append(drop_zone);

        var destroy_button = ($("<button type='danger' class='btn btn-danger button-margin'>Destroy</button>"));
        $(list_element).attr("id", "list_element_" + blocks_counter);
        $(destroy_button).attr("id", "button_destroy_" + blocks_counter);
        $(destroy_button).attr("onclick", "deleteElement(id)");
        form_group.append(destroy_button);

        form.append(form_group);
        list_element.append(form);
        $("#items").append(list_element);
        blocks_counter++;

        $(function () {
            var temp = document.getElementsByClassName("dropzone");
            console.log(temp);
            for (var i = 0; i < temp.length; i++) {
                setImageDrop("#" + temp[i].id)
            }
        });

    });


    var setImageDrop = function (id) {
        var temp_img = id + " img";
        var temp_div = id + " div";
        $(id).on('dragover', function () {
            $(this).addClass('hover');
        });

        $(id).on('dragleave', function () {
            $(this).removeClass('hover');
        });
        var input_Temp = id + " input";
        $(input_Temp).on('change', function (e) {
            var file = this.files[0];

            $(id).removeClass('hover');

            if (this.accept && $.inArray(file.type, this.accept.split(/, ?/)) == -1) {
                return alert('File type not allowed.');
            }

            $(id).addClass('dropped');
            $(temp_img).remove();

            if ((/^image\/(gif|png|jpeg)$/i).test(file.type)) {
                var reader = new FileReader(file);

                reader.readAsDataURL(file);

                reader.onload = function (e) {
                    var data = e.target.result,
                        $img = $('<img />').attr('src', data).fadeIn();
                    $(temp_div).html($img);
                };
            } else {
                var ext = file.name.split('.').pop();

                $(temp_div).html(ext);
            }
        });
    };
});