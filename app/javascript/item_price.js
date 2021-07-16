function tax () {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    const addTaxDom = document.getElementById("add-tax-price");
    const addProfitDom = document.getElementById("profit")
    addTaxDom.innerHTML = Math.floor(itemPrice.value * 0.1);
    addProfitDom.innerHTML = itemPrice.value - Math.floor(itemPrice.value * 0.1);
  });
};

window.addEventListener('load', tax)