$(document).on('turbolinks:load', function() {

    $("body").off('click').on('click'," [data-do='like']",function (e) {
        e.preventDefault();
        var that = this;
        $.ajax({
            type:'POST',
            url:'/like',
            data: {
                picture_id: $(that).data('id')
            },
            success:function(data){
              $("#nb-like-" + data.picture_id).text(data.number_like);
              if(data.liked){
                  $(that).addClass("liked");
              }
              else{
                  $(that).removeClass("liked");
              }
            }
          });
    });


    $("#more-button").off('click').on('click', function (e) {
        e.preventDefault();
        var that = this;
        $(this).prop('disabled', true);
        var ref = $(that).attr('href');
        console.log(window.last)
        $.ajax({
            type:"GET",
            url: ref,
            data: {
                last_id: window.last
            },
            success: function(data){
                $("#photos").append(data.data);
                window.last = data.last_id
                if (data.last_id <= 1) {
                  $("[data-do='more']").hide();
                }
            },
            error: function(){
                $("[data-do='more']").hide();
            }
        })
    });
})
