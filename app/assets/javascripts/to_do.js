$(document).ready(function() {
//  $('.scrollable_table').fixedHeaderTable({ footer: true, cloneHeadToFoot: false, fixedColumn: false });
  $('.mark_done').click(function(){
    var current = $(this);
    current.prev().val(current.prop('checked') ? '1' : '0')
    current.parent().submit()

  });
  setTimeout(function() {
    $('.notice').toggle('fade', 1000)
  }, 1000)

  // $('table.scrollable_table').fixedHeaderTable({ footer: true, cloneHeadToFoot: true, fixedColumn: false });


// http://www.kirupa.com/html5/setting_css_styles_using_javascript.htm
});
function addClass(element, classToAdd) {
    var currentClassValue = element.className;

    if (currentClassValue.indexOf(classToAdd) == -1) {
        if ((currentClassValue == null) || (currentClassValue === "")) {
            element.className = classToAdd;
        } else {
            element.className += " " + classToAdd;
        }
    }
}

function removeClass(element, classToRemove) {
    var currentClassValue = element.className;

    if (currentClassValue == classToRemove) {
        element.className = "";
        return;
    }

    var classValues = currentClassValue.split(" ");
    var filteredList = [];

    for (var i = 0 ; i < classValues.length; i++) {
        if (classToRemove != classValues[i]) {
            filteredList.push(classValues[i]);
        }
    }

    element.className = filteredList.join(" ");
}
