
    document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementsByClassName('photo-post-img');

      // 選択した画像を表示する関数
      const createImageHTML = (blob) => {
      // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div');
          
      // 表示する画像を生成
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      // 生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage);
      ImageList[0].appendChild(imageElement);
      };

    document.getElementById('photo_image').addEventListener('change', function(e){
         // 画像が表示されている場合のみ、すでに存在している画像を削除する
      const imageContent = document.querySelector('img');
        if (imageContent){
        imageContent.remove();
        }
      
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  });

  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementsByClassName('user-avatar-img');

      // 選択した画像を表示する関数
      const createImageHTML = (blob) => {
      // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div');
          
      // 表示する画像を生成
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      // 生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage);
      ImageList[0].appendChild(imageElement);
      };

    document.getElementById('user_avatar').addEventListener('change', function(e){
         // 画像が表示されている場合のみ、すでに存在している画像を削除する
      const imageContent = document.querySelector('img');
        if (imageContent){
        imageContent.remove();
        }
      
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  });