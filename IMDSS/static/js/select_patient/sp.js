$("#select-pats-table>tbody").on("click", "tr", function () {

  var selected_pats_id = $(this).find("td:eq(2)").text();
  $("#select-pats-table>tbody>tr").removeClass("selected")
  $(this).addClass("selected")

  $.ajax({
    type: "GET",
    data: { "selected_emr_id": selected_pats_id },
    dataType: "json",
    success: function (result) {

    }

  });
});

$(
    function () {
        var textWrapper = document.querySelector('.ml1 .letters');
        textWrapper.innerHTML = textWrapper.textContent.replace(/\S/g, "<span class='letter'>$&</span>");
        anime.timeline({ loop: false })
        .add({
            targets: '.ml1 .letter',
            scale: [0.3, 1],
            opacity: [0, 1],
            translateZ: 0,
            easing: "easeOutExpo",
            duration: 600,
            delay: (el, i) => 70 * (i + 1)
        }).add({
            targets: '.ml1 .line',
            scaleX: [0, 1],
            opacity: [0.5, 1],
            easing: "easeOutExpo",
            duration: 700,
            offset: '-=875',
            delay: (el, i, l) => 80 * (l - i)
        })
        var textWrapper = document.querySelector('.ml2 .letters');
        textWrapper.innerHTML = textWrapper.textContent.replace(/\S/g, "<span class='letter'>$&</span>");
        anime.timeline({ loop: false })
            .add({
                targets: '.ml2 .letter',
                scale: [0.3, 1],
                opacity: [0, 1],
                translateZ: 0,
                easing: "easeOutExpo",
                duration: 600,
                delay: (el, i) => 70 * (i + 1)
            }).add({
                targets: '.ml2 .line',
                scaleX: [0, 1],
                opacity: [0.5, 1],
                easing: "easeOutExpo",
                duration: 700,
                offset: '-=875',
                delay: (el, i, l) => 80 * (l - i)
            })
    }
);



// Wrap every letter in a span

  
    