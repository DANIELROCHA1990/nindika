// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import 'controllers'
import useAppToast from '@/app/use_app_toast'

import '@fortawesome/fontawesome-free/css/all.min.css'
import "@splidejs/splide/dist/css/splide.min.css"

Rails.start()

const onPageLoad = () => {
  halfmoon.onDOMContentLoaded();
  useAppToast()
  document.getElementById('sidebar-overlay').addEventListener('click', () => halfmoon.toggleSidebar())
  document.getElementById('sidebar-toggle').addEventListener('click', () => halfmoon.toggleSidebar())
}

document.addEventListener('DOMContentLoaded', onPageLoad)
