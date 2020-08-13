// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import flatpickr from "flatpickr";
// import algoliasearch from 'algoliasearch';
import { initFlatpickr } from '../plugins/init_flatpickr';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  initFlatpickr();
});

// const results = document.querySelector(".results");

// const searchAlgoliaPlaces = (event) => {
//   const client = algoliasearch('AVCQZ3GIN7', 'f47cfc7b6408bf4df566b1f04a8181f9');
//   const index = client.initIndex('Planet');
//   index.search(event.currentTarget.value)
//     .then(function searchDone(content) {
//       results.innerHTML = "";
//       results.classList.remove('d-none');
//       content.hits.forEach((result) => {
//         console.log(result)
//         // const galaxies = `#{result.address}`;
//         results.insertAdjacentHTML("beforeend", `<p>${result.address}</p>`);
//       });
//     })
//     .catch(function searchFailure(err) {
//       console.error(err);
//     });
// };


// const input = document.querySelector("#keyword");
// input.addEventListener("keyup", searchAlgoliaPlaces);
