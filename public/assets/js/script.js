// const menu = document.querySelector(".burger");
// const navLinks = document.querySelector(".nav-more");
// const logo = document.querySelector(".logo");

// let isMenuOpen = false;

// menu.addEventListener("click", () => {
//   if (isMenuOpen) {
//     navLinks.classList.add("menu");

//     logo.style.display = "block";
//   } else {
//     navLinks.classList.remove("menu");
//   }

//   isMenuOpen = !isMenuOpen;
// });

function afficherInfosContact() {
  var infosContact = document.getElementById("infosContact");
  if (infosContact.style.display === "none") {
    infosContact.style.display = "block";
  } else {
    infosContact.style.display = "none";
  }
}
