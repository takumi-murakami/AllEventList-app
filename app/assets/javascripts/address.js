// function address() {
//   const btn = document.getElementById('btn');
//   console.log(btn);

//   btn.addEventListener('click', () => {
//     const address = document.getElementById('black-address');
//     const insertAddress = address.textContent;
//     console.log(insertAddress)
//     const searchTarget = document.getElementById('pac-input');

//     searchTarget.getAttribute("value");
//     searchTarget.setAttribute("value", insertAddress)
//   });
// }
// window.addEventListener("load", address)

function address() {
  const btn = document.getElementsByClassName('btn-input');
  // 全て取得
  // console.log(btn[1]); //２番目の要素取得
  // for使って繰り返し処理、保留中

    btn[0].addEventListener('click', () => {
      const address = document.getElementsByClassName('black-address')[0];
      const insertAddress = address.textContent;
      console.log(insertAddress);
      const searchTarget = document.getElementById('pac-input');
  
      searchTarget.getAttribute("value");
      searchTarget.setAttribute("value", insertAddress);
    });

    btn[1].addEventListener('click', () => {
      const address = document.getElementsByClassName('black-address')[1];
      const insertAddress = address.textContent;
      console.log(insertAddress);
      const searchTarget = document.getElementById('pac-input');
  
      searchTarget.getAttribute("value");
      searchTarget.setAttribute("value", insertAddress);
    });

    btn[2].addEventListener('click', () => {
      const address = document.getElementsByClassName('black-address')[2];
      const insertAddress = address.textContent;
      console.log(insertAddress);
      const searchTarget = document.getElementById('pac-input');
  
      searchTarget.getAttribute("value");
      searchTarget.setAttribute("value", insertAddress);
    });

    btn[3].addEventListener('click', () => {
      const address = document.getElementsByClassName('black-address')[3];
      const insertAddress = address.textContent;
      console.log(insertAddress);
      const searchTarget = document.getElementById('pac-input');
  
      searchTarget.getAttribute("value");
      searchTarget.setAttribute("value", insertAddress);
    });

    btn[4].addEventListener('click', () => {
      const address = document.getElementsByClassName('black-address')[4];
      const insertAddress = address.textContent;
      console.log(insertAddress);
      const searchTarget = document.getElementById('pac-input');
  
      searchTarget.getAttribute("value");
      searchTarget.setAttribute("value", insertAddress);
    });

    btn[5].addEventListener('click', () => {
      const address = document.getElementsByClassName('black-address')[5];
      const insertAddress = address.textContent;
      console.log(insertAddress);
      const searchTarget = document.getElementById('pac-input');
  
      searchTarget.getAttribute("value");
      searchTarget.setAttribute("value", insertAddress);
    });

}
window.addEventListener("load", address)