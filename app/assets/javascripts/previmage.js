// 1. 画像要素を取得する。
const images = document.getElementsByClassName('image-wrapper')[0].getElementsByTagName('img');
// 2. 画像要素を配列に格納する。
const imageArray = Array.from(images);
// 3. 画像を表示するための変数を用意する。
let currentIndex = 0;
// 4. 次の画像を表示するための関数を定義する。
function nextImage() {
  currentIndex++;
  if (currentIndex >= imageArray.length) {
    currentIndex = 0;
  }
  showImage(currentIndex);
}
// 5. 前の画像を表示するための関数を定義する。
function prevImage() {
  currentIndex--;
  if (currentIndex < 0) {
    currentIndex = imageArray.length - 1;
  }
  showImage(currentIndex);
}
// 6. 次の画像を表示するためのイベントリスナーを追加する。
document.querySelector('.prev-btn').addEventListener('click', () => {
  nextImage();
  if (currentIndex === 0) {
    showImage(currentIndex);
  }
});
// 7. 前の画像を表示するためのイベントリスナーを追加する。
document.querySelector('.next-btn').addEventListener('click', () => {
  prevImage();
  if (currentIndex === 0) {
    showImage(currentIndex);
  }
});
// 画像を表示する関数
function showImage(index) {
  imageArray.forEach((image, i) => {
    if (i === index) {
      image.style.display = 'block';
    } else {
      image.style.display = 'none';
    }
  });
}
// すべての画像を非表示にする
showImage(currentIndex);
// currentIndexを0に設定する
currentIndex = 0;
// リロード時にcurrentIndexを0にリセットする
window.addEventListener('load', () => {
  currentIndex = 0;
});
// 最初の画像を表示する
if (imageArray.length === 1) {
  document.querySelector('.prev-btn').style.display = 'none';
  document.querySelector('.next-btn').style.display = 'none';
} else {
  showImage(currentIndex);
}