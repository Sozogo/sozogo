var signup = {}
signup.organizationTypeHandler = function() {
  $("#organization_organization_type").change(function() {
    if ($("#organization_organization_type").val() == "Church") {
      $(".church-fields").slideDown();
    } else {
      $(".church-fields").slideUp();
    }
  });
}

signup.selectHandler = function() {
  $("#volunteer_language_ids").select2();
  $("#volunteer_focus_ids").select2();
}

$(document).ready(function() {
  signup.organizationTypeHandler();
  signup.selectHandler();
});
