$(".average-review-rating").raty({readOnly:!0,path:"/assets/",score:function(){return $(this).attr("data-score")}}),$("#rating-form").raty({path:"/assets/",scoreName:"review[rating]"}),$(".review-rating").raty({readOnly:!0,score:function(){return $(this).attr("data-score")},path:"/assets/"});