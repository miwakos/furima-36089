
  document.addEventListener('DOMContentLoaded', () => {
    // 画像投稿フォームが存在している場合のみ
    if (document.getElementById('image-list')) { 

    // 選択した画像を表示する関数
    const createImageHTML = (blob) => {
      // 画像配置場所の要素取得
      const imageList = document.getElementById('image-list');

      // 画像を表示するためのdiv要素を取得
      let imgElementNum = document.querySelectorAll('.image-block').length
      const imageBlock = document.getElementById(`image_block_${imgElementNum}`);

      // 画像を表示するためのimg要素を生成
      const imgElement = document.createElement('img');
      // img要素にsrc属性とclass名を指定
      imgElement.setAttribute('src', blob);
      imgElement.setAttribute('class', "item-img");

      // div要素の中にimg要素を追加
      imageBlock.appendChild(imgElement);

      // 次の画像のためのdiv要素を生成
      const divElement = document.createElement('div');
      divElement.setAttribute('class', "image-block");
      divElement.setAttribute('id', `image_block_${imgElementNum+1}`);
      const inputHTML = document.createElement('input');
      inputHTML.setAttribute('name', 'item[images][]');
      inputHTML.setAttribute('class', 'item-image');
      inputHTML.setAttribute('id', `item_image_${imgElementNum+1}`);
      inputHTML.setAttribute('type', 'file');

      // 画像と次の画像のためのdiv要素を表示
      divElement.appendChild(inputHTML);
      imageList.appendChild(divElement);

      // 2枚目以降の画像投稿も表示
      inputHTML.addEventListener('change', (e) => {
        file = e.target.files[0];
        blob = window.URL.createObjectURL(file);

        createImageHTML(blob)
      })
    };

    // 画像up時にイベント発火
    let imgElementNum = document.querySelectorAll('.image-block').length
    document.getElementById(`item_image_${imgElementNum}`).addEventListener('change', (e) => {
      // 画像情報取得
      let file = e.target.files[0];
      // 画像のURLを生成
      let blob = window.URL.createObjectURL(file);

      createImageHTML(blob)
    });
  };
});