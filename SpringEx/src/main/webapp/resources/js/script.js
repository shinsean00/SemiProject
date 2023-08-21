	// 파일 첨부
	document.getElementById('thumbnail_fileInput').addEventListener('change', function() {
      var file = this.files[0];
      if (file) {
        var reader = new FileReader();
        reader.onload = function(e) {
          document.getElementById('previewImage').src = e.target.result;
          document.getElementById('previewImage').style.display = 'block';
          document.getElementById('thumbnail_fileName').textContent = file.name;
        };
        reader.readAsDataURL(file);
      }
    });
  
    document.getElementById('detail_fileInput').addEventListener('change', function() {
      var file = this.files[0];
      if (file) {
        var reader = new FileReader();
        reader.onload = function(e) {
          document.getElementById('detailPreviewImage').src = e.target.result;
          document.getElementById('detailPreviewImage').style.display = 'block';
          document.getElementById('detail_fileName').textContent = file.name;
        };
        reader.readAsDataURL(file);
      }
    });
    
    // slider이미지
    function changeSliderImage() {
            var sliderImage = document.getElementById("sliderImage");
            var imageIndex = 1;
            var images = [
	            "../img/slider1.jpg",
				"../img/slider2.jpg",
				"../img/slider3.jpg"
            ];

            setInterval(function() {
                sliderImage.style.opacity = 0; // 이미지 투명도를 0으로 설정
                setTimeout(function() {
                    sliderImage.src = images[imageIndex];
                    sliderImage.style.opacity = 1; // 이미지 투명도를 1로 설정
                    imageIndex++;
                    if (imageIndex >= images.length) {
                        imageIndex = 0;
                    }
                }, 500); // 이미지 변경 후 0.5초 후에 투명도를 다시 1로 설정
            }, 5000);
        }
        window.addEventListener("load", changeSliderImage);
        
        //
        var bigPic = document.querySelector("#big"); // 큰사진
	    var smallPics = document.querySelectorAll(".small"); // 작은사진(여러개)
	
	    for (var i = 0; i < smallPics.length; i++) {
	      smallPics[i].addEventListener("click", changepic); // 이벤트 처리
	    }
	
	    function changepic() {
	      // 사진 바꾸는 함수
	      var smallPicAttribute = this.getAttribute("src");
	      bigPic.setAttribute("src", smallPicAttribute);
	    }
	
	    // 선택한 사진 제외하곤 투명하게 조정하는 함수
	    function showImage(element) {
	      const thumbnails = document.querySelectorAll(".small");
	      thumbnails.forEach((thumbnail) => {
	        thumbnail.classList.remove("active");
	      });
	      element.classList.add("active");
	    }
	
	    // up, down button에 따른 주문량 개수 변화하는 함수
	    const upBtn = document.querySelector('.up_btn');
	    const downBtn = document.querySelector('.down_btn');
	    const input = document.querySelector('#order_qty');
	
	    upBtn.addEventListener('click', () => {
	      input.value = parseInt(input.value) + 1;
	      calculateOrderTotal();
	    });
	    downBtn.addEventListener('click',() => {
	      input.value = parseInt(input.value) -1;
	      if (input.value < 1) {
	        input.value = 1;
	      }
	      calculateOrderTotal();
	    })
	
	    // 주문 금액 계산하는 함수
	    function calculateOrderTotal() {
	      const orderQty = parseInt(input.value);
	      const price = 30000;
	      const orderTotal = orderQty * price;
	      const orderTotalElement = document.getElementById('order_total');
	      orderTotalElement.textContent = '주문 금액 : ' + orderTotal.toLocaleString() + '원';
	    }
	
	    input.addEventListener('input',calculateOrderTotal);
        