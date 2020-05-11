
// 當圖片載入後才執行
$(window).load(function () {
    // 先取得先關區塊及圖片的寬高
    // 並設定每張圖片的邊距、縮放倍數及動畫速度
    var $block = $('#photos'),
        $li = $block.find('li'),
        $img = $li.find('img'),
        _width = $img.width(),
        _height = $img.height(),
        _margin = 5,
        _ratio = 3,
        _speed = 400;

    // 把每一個 li 橫向排列好
    $li.each(function (i) {
        var $this = $(this),
            _top= i * (_height + _margin);

        // 先把排列後的位置記錄在 .data('position') 中
        $this.css('top', _top).data('position', {
            top: _top,
            top: parseInt($this.css('top'), 10) || 0
        });
    }).hover(function(){	// 當滑鼠移入 $li 時
		var $this = $(this), 
			positionData = $this.data('position');
 
		// 改變 z-index 以免被遮到, 並移動 left 及 top
		// 同時找到 img 縮放寬高為原來的 _ratio 倍
		$this.css('z-index', 1).stop().animate({
			left: positionData.left - (_width * _ratio - _width) / 2,
            top: positionData.top - (_height * _ratio - _height) / 2,
          
		}, _speed).find('img').stop().animate({
			width: _width * _ratio, 
			height: _height * _ratio
		}, _speed);
	}, function(){	// 當滑鼠移出 $li 時
		var $this = $(this), 
			positionData = $this.data('position');
 
		// 還原 z-index 並移回原來的 left 及 top
		// 同時找到 img 還原寬高
		$this.css('z-index', 0).stop().animate({
			left: positionData.left,
			top: positionData.top
		}, _speed).find('img').stop().animate({
			width: _width, 
			height: _height
		}, _speed);
	});
});








/*小畫家*/
// Canvas DOM 元素 
const canvas = document.getElementById('canvas')
const ctx = canvas.getContext('2d')

//起始點座標
let x1= 0
let y1= 0

// 終點座標
let x2= 0
let y2= 0

// 宣告一個 hasTouchEvent 變數，來檢查是否有 touch 的事件存在
const hasTouchEvent = 'ontouchstart' in window ? true : false

// 透過上方的 hasTouchEvent 來決定要監聽的是 mouse 還是 touch 的事件
const downEvent = hasTouchEvent ? 'ontouchstart' : 'mousedown'
const moveEvent = hasTouchEvent ? 'ontouchmove' : 'mousemove'
const upEvent = hasTouchEvent ? 'touchend' : 'mouseup'

// 宣告 isMouseActive 為滑鼠點擊的狀態，因為我們需要滑鼠在 mousedown 的狀態時，才會監聽 mousemove 的狀態
let isMouseActive = false

canvas.addEventListener(downEvent, function(e){
  isMouseActive = true
})

canvas.addEventListener(downEvent, function(e){
  isMouseActive = true  
  x1 = e.offsetX
  y1 = e.offsetY
  
  ctx.lineWidth = 5
  ctx.lineCap = 'round'
  ctx.lineJoin = 'round'
})

canvas.addEventListener(moveEvent, function(e){
      if(!isMouseActive){
        return
      }
      // 取得終點座標
      x2 = e.offsetX
      y2 = e.offsetY
      
      // 開始繪圖
      ctx.beginPath()
      ctx.moveTo(x1, y1)
      ctx.lineTo(x2, y2)
      ctx.stroke()
      
      // 更新起始點座標
      x1 = x2
      y1 = y2
})

canvas.addEventListener(upEvent, function(e){
  isMouseActive = false
})


/*圖片典籍ㄋㄟ*/

var imgs=document.getElementById('photos').getElementsByTagName('img')
var img=document.getElementById('painter').getElementsByTagName('img')[0]
for (var i=0;i<imgs.length;i++) {

	imgs[i].onclick=function(){

		img.src=this.src;

	}

}


