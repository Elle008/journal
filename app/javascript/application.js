// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"

const avatar = document.querySelector('[data-avatar]')
const avatarDropdown = document.querySelector('[data-avatarDropdown]')
const alert = document.querySelector('#alert')
const notice = document.querySelector('#notice')

avatar.addEventListener('click', (e) => {
  e.preventDefault()
  if (avatarDropdown.classList.contains('show')) {
    avatarDropdown.classList.remove('show')
  }
  else {
    avatarDropdown.classList.add('show')
  }
})

