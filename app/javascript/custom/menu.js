// メニュー操作

document.addEventListener("turbo:load", function() {
  // トグルリスナーを追加してクリックをリッスンする
  let hamburger = document.querySelector("#hamburger");
  hamburger.addEventListener("click", function(event) {
    event.preventDefault();
    let menu = document.querySelector("#navbar-menu");
    menu.classList.toggle("collapse");
  });

  let account = document.querySelector("#account");
  let menu = document.querySelector("#dropdown-menu");

  account.addEventListener("click", function(event) {
    event.preventDefault();
    menu.classList.toggle("active");
  });

  // クリックイベントをドキュメント全体でリッスンする
  document.addEventListener("click", function(event) {
    // クリックされた要素がアカウントリンクまたはドロップダウンメニュー内の要素であれば何もしない
    if (event.target === account || menu.contains(event.target)) {
      return;
    }

    // クリックされた要素がドロップダウン外部であればドロップダウンを閉じる
    menu.classList.remove("active");
  });
});
