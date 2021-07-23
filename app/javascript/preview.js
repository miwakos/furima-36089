if (location.pathname.match("items/new")) { 
  document.addEventListener('DOMContentLoaded', () => {
    // 画像配置場所の要素取得
    const imageList = document.getElementById('image-list');

    // 選択肢た画像を表示する関数
    const createImageHTML = (blob) => {
      // 画像を表示するためのdiv要素を生成
      const divElement = document.createElement('div');
      // 画像を表示するためのimg要素を生成
      const imgElement = document.createElement('img');
      // class名とimg要素にsrc属性を指定
      divElement.setAttribute('class', "item-img-block");
      imgElement.setAttribute('src', blob);
      imgElement.setAttribute('class', "item-img");
      // div要素の中にimg要素を追加
      divElement.appendChild(imgElement);
      imageList.appendChild(divElement);
    };

    // 画像up時にイベント発火
    document.getElementById('item-image').addEventListener('change', (e) => {
      // 画像情報取得
      const file = e.target.files[0];
      // 画像のURLを生成
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob)
    });
  });
};