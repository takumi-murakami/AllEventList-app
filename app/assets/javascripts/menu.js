function menu() {
  const open = document.getElementById('open');
  const overlay = document.querySelector('.overlay');
  const close = document.getElementById('close');
  const closeCalender = document.querySelector('.fc-view-container');
  const closeToolbar = document.querySelector('.fc-right');
  const closeAddeventbtn = document.querySelector('.addevent-btn');

  open.addEventListener('click', () => {
    overlay.classList.add('show');
    open.classList.add('hide');
    closeCalender.classList.add('hide');
    closeToolbar.classList.add('hide');
    closeAddeventbtn.classList.add('hide');
  });

  close.addEventListener('click', () => {
    overlay.classList.remove('show');
    open.classList.remove('hide');
    closeCalender.classList.remove('hide');
    closeToolbar.classList.remove('hide');
    closeAddeventbtn.classList.remove('hide');
  });

  const menuItem = document.querySelectorAll(".menubar li a");
  const contents = document.querySelectorAll(".content");
  
  menuItem.forEach(clickedItem => {
    clickedItem.addEventListener('click', e => {
      e.preventDefault();

      menuItem.forEach(item => {
        item.classList.remove('active');
      });

      clickedItem.classList.add('active');

      contents.forEach(content => {
        content.classList.remove('active');
      });

      document.getElementById(clickedItem.dataset.id).classList.add('active');
    });
  });

  const closeContent1 = document.getElementById("cancel-1");
  const closeContent2 = document.getElementById("cancel-2");
  const closeContent3 = document.getElementById("cancel-3");

  closeContent1.addEventListener('click', () => {
    const menuItem = document.querySelectorAll(".menubar li a");
    const contents = document.querySelectorAll(".content");

    contents.forEach(content => {
      content.classList.remove('active');
    });
    menuItem.forEach(item => {
      item.classList.remove('active');
    });
  });

  closeContent2.addEventListener('click', () => {
    const menuItem = document.querySelectorAll(".menubar li a");
    const contents = document.querySelectorAll(".content");

    contents.forEach(content => {
      content.classList.remove('active');
    });
    menuItem.forEach(item => {
      item.classList.remove('active');
    });
  });

  closeContent3.addEventListener('click', () => {
    const menuItem = document.querySelectorAll(".menubar li a");
    const contents = document.querySelectorAll(".content");

    contents.forEach(content => {
      content.classList.remove('active');
    });
    menuItem.forEach(item => {
      item.classList.remove('active');
    });
  });
}
window.addEventListener("load", menu)