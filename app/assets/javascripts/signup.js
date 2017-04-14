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
  $("#volunteer_language_ids").select2({
    placeholder: "What languages do you speak? *optional"
  });
  $("#volunteer_focus_ids").select2({
    placeholder: "What are your interests? *optional"
  });
  $("#organization_focus_ids").select2({
    placeholder: "What are your common events?"
  });
}

$(document).ready(function() {
  signup.organizationTypeHandler();
  signup.selectHandler();
});
