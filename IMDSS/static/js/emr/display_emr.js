function search_icon_to_green() {
    var icon = document.getElementById("search-icon")
    var bar = document.getElementById("search-bar")
    icon.src = green_pic
    bar.style.border = "1px solid #009688"
}

function search_icon_to_black() {
    var icon = document.getElementById("search-icon")
    var bar = document.getElementById("search-bar")
    icon.src = black_pic
    bar.style.border = "1px solid black"
}