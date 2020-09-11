window.addEventListener("load", function() {
  let price = document.getElementById("item-price");
  price.addEventListener("input", function() {
    let item_price = price.value
    let add_tax_price = document.getElementById("add-tax-price");
    let profit = document.getElementById("profit");
    
    tax_price = (item_price * 0.1)
    total = (item_price - tax_price)


    add_tax_price.innerHTML = tax_price;
    profit.innerHTML = total;
  })
})








// ①　JSを動かす記述
// ②　価格を入力するHTMLのクラスかIDを変数Aに入れる
// ③　上記で入れた変数Aに対しての発火条件を書く
// ④　②の中で入力された値を取り出して変数Bに入れる
// ⑤　変数Bに対して計算し変数C,Dに入れる（出品手数料Cと利益D）
// ⑥　手数料部分には変数Cをインサート
// ⑦　利益部分に変数Dをインサート