function address() {
  const btn = document.getElementById('btn');

  btn.addEventListener('click', () => {
    const address = document.getElementById('black-address');
    const insertAddress = address.textContent;
    const searchTarget = document.getElementById('pac-input');

    searchTarget.getAttribute("value");
    searchTarget.setAttribute("value", insertAddress)
  });
}
window.addEventListener("load", address)