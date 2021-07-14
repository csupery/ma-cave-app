// const addAppellation = ()=> {
//   const createButton = document.getElementById(“addAppellation”);
//   createButton.addEventListener(“click”, () => {

//     const lastId = document.querySelector(‘#fieldsetContainer’).lastElementChild.id;

//     const newId = parseInt(lastId, 10) + 1;

//     const newFieldset = document.querySelector('[id=”0"]').outerHTML.replace(/0/g,newId);

//     document.querySelector(“#fieldsetContainer”).insertAdjacentHTML(
//         “beforeend”, newFieldset
//     );
//   });
// }

// function removeField() {
//   document.body.addEventListener("click", (e) => {
//     if ( e.target.nodeName === "A" &&
//          e.target.parentNode.previousElementSibling) {

// /* to prevent from removing the first fieldset as it's previous sibling is null */

//       e.target.parentNode.remove();
//     }
//   });
// }

// export { addAppellation }
