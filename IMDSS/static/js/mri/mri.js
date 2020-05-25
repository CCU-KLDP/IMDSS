/*切換XRAY跟MRI*/
$(function () {
  //隐藏div
  //给div添加change事件
  $("#dd_sel").change(function () {
    if ($(this).val() == 1) {
      $("#XRAY").show();
      $("#MRI").hide();

    } else if ($(this).val() == 2) {
      $("#MRI").show();
      $("#XRAY").hide();

    }

  })
})




/*小畫家*/
var _canvas = document.getElementById('canvas');
var ctx = _canvas.getContext('2d');
canvas.width = window.innerWidth - 475;
canvas.height = window.innerHeight - 250;
ctx.strokeStyle = "orange"
$('.color input').change(function () {
  r = $('#red').val();
  g = $('#green').val();
  b = $('#blue').val();
  changeColor(r, g, b);
  //取出input中的數值
});

function changeColor(r, g, b) {


  colors = {
    red: r,
    green: g,
    blue: b
  }
  $.each(colors, function (_color, _value) {
    $('#v' + _color).val(_value);
  });
  ctx.strokeStyle = "rgb(" + r + "," + g + "," + b + ")";
  //將顏色的值寫到ctx.strokeStyle即可
};

var x = 0;
var y = 0;

function getMousePos(canvas, evt) {
  var rect = canvas.getBoundingClientRect();
  //getBoundingClientRect 取得物件完整座標資訊，包含寬高等
  return {
    x: evt.clientX - rect.left,
    y: evt.clientY - rect.top
  };
  //這個function將會傳回滑鼠在 _canvas上的座標
};

function mouseMove(evt) {
  var mousePos = getMousePos(_canvas, evt);
  //透過getMousePos function 去取得滑鼠座標
  //mousePos 是一個物件，包含x和y的值
  ctx.lineTo(mousePos.x, mousePos.y);
  //利用取回的值畫線
  ctx.stroke();
  /*var grad = ctx.createLinearGradient(150, 0, 280, 0);
  grad.addColorStop("0", "orange");
  ctx.strokeStyle = grad */ //畫!

  var x = document.getElementById("bsize").value;

  ctx.lineWidth = x / 10
  if (x = 0) {
    ctx.lineWidth = 0;
  }
};

canvas.addEventListener('mousedown', function (evt) {
  var mousePos = getMousePos(_canvas, evt);
  //從按下去就會執行第一次的座標取得
  evt.preventDefault();
  ctx.beginPath();
  //建立path物件
  ctx.moveTo(mousePos.x, mousePos.y);
  //每次的點用moveTo去區別開，如果用lineTo會連在一起  
  canvas.addEventListener('mousemove', mouseMove, false);
  //mousemove的偵聽也在按下去的同時開啟
});

canvas.addEventListener('mouseup', function () {
  canvas.removeEventListener('mousemove', mouseMove, false);
}, false);
//如果滑鼠放開，將會停止mouseup的偵聽

$('#save').on('click', function () {
  var _url = _canvas.toDataURL();
  //利用toDataURL() 把canvas轉成data:image
  this.href = _url;
  //再把href載入上面的Data:image
});




/*圖片點擊放大XRAY*/

var imgs = document.getElementById('#XRAY').getElementsByTagName('openvariable')
var img = document.getElementById('painter').getElementsByTagName('img')[0]
for (var i = 0; i < imgs.length; i++) {

  imgs[i].onclick = function () {
    img.src = this.src;
  }
  if (img.onclick) {
    canvas.clearRect()
  }
}
/*CLEAR CANVAS*/
function clearCanvas() {
  ctx.clearRect(0, 0, canvas.width, canvas.height);
}

/*圖片點擊放大MRI*/

var imgs = document.getElementById('#MRI').getElementsByTagName('mri')
var img = document.getElementById('painter').getElementsByTagName('img')[0]
for (var i = 0; i < imgs.length; i++) {

  imgs[i].onclick = function () {
    img.src = this.src;
  }

}


/*CANVAS存圖片 */
// 取得input
const input = document.querySelector('input')

// 當使用者修改內容(選擇檔案)
input.addEventListener('change', function (event) {
  const files = this.files  // 取得所有 file
  const container = this.parentNode // 設定一個preview容器

  // 處理每一個檔案
  Array.prototype.forEach.call(files, file => {
    filePreview(file, container)
  })
})

// 這個將會把file的預覽圖加入指定container
function filePreview(file, container) {
  const url = URL.createObjectURL(file)   // 建立檔案url
  const image = new Image
  image.style.width = '150px'
  image.style.height = 'auto'
  image.alt = file.name
  image.addEventListener('load', function (event) {
    container.appendChild(this)
  })
  image.src = url
}


// 建立 file
function test() {
  // 使用canvas的toBlob方法將其轉為blob
  const blob = canvas.toBlob(blob => {
    // 有了blob我們就可以使三 URL.createObjectURL建立url
    const url = URL.createObjectURL(blob)
    const link = document.createElement('a')
    link.innerText = 'Download'
    link.href = url // 將url 設定給 a tage 的 href
    link.download = 'circle.png'    // 設定 download name
    document.body.appendChild(link) // 加到指定元素之中，即可點擊下載
  })



  const dataURL = canvas.toDataURL('image/png')
  const blobBin = atob(dataURL.split(',')[1])
  const array = []
  for (let i = 0; i < blobBin.length; i++) {
    array.push(blobBin.charCodeAt(i))
  }
  const file = new Blob([new Uint8Array(array)], { type: 'image/png' })

  // 將file 加至 formData
  const formData = new FormData()
  formData.append('file', file, 'test.png')

  $.ajax({
    type: "GET",
    url: "http://127.0.0.1:8000/mri/save_pic",
    data: { "form_data": 123 },
    success: function (result) {
      alert(result)
    }
  });
}