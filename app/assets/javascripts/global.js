$(document).ready(function() {
  $("#requirements a.add_fields")
    .data("association-insertion-method", 'append')
    .data("association-insertion-node", "#requirement-items")
    .on("cocoon:before-insert", function(e, elm_to_be_added) {
        elm_to_be_added.fadeIn("slow");
      })
      .on("cocoon:after-insert", function(e, added_elm) {
        added_elm.css("background","red");
      })
      .on("cocoon:before-remove", function(e, elm) {
        $(this).data("remove-timeout", 1000);
        elm.fadeOut("slow");
      });;
});