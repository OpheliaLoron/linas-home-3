const menu = document.querySelector(".burger");
const navLinks = document.querySelector(".nav-more");
const logo = document.querySelector(".logo");

let isMenuOpen = false;

menu.addEventListener("click", () => {
  if (isMenuOpen) {
    navLinks.classList.add("menu");

    logo.style.display = "block";
  } else {
    navLinks.classList.remove("menu");
  }

  isMenuOpen = !isMenuOpen;
});
