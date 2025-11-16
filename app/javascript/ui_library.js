
const initUILibraryModalLinks = () => {
  document.querySelectorAll("a[data-modal]").forEach(modalLink => {
    modalLink.addEventListener("click", (e) => {
      let modalId = e.target.getAttribute("data-modal")
      let modal = document.querySelector(`#${modalId}`)
      modal.style.display = "flex";
      modal.setAttribute("data-modal-open", "true")
    })
  })

  document.querySelectorAll("[data-modal-close]").forEach(modalCloseLink => {
    modalCloseLink.addEventListener("click", (e) => {
      let link = e.target.closest("a")
      let modalId = link.getAttribute("data-modal-close")
      let modal = document.querySelector(`#${modalId}`)
      modal.removeAttribute("data-modal-open")
      modal.style.display = "none"
    })
  })

  window.addEventListener("click", (e) => {
    let openModal = document.querySelector("[data-modal-open='true']")
    if (openModal) {
      if (!openModal.contains(e.target)) {
        if (!e.target.getAttribute("data-modal")) {
          openModal.removeAttribute("data-modal-open")
          openModal.style.display = "none"
        }
      }
    }
  })
}
document.addEventListener("turbo:load", initUILibraryModalLinks)