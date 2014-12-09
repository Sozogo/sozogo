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

$(document).ready(function() {
  signup.organizationTypeHandler();
});
