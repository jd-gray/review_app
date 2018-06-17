import Vue from 'vue'
import App from '../meals.vue'

document.addEventListener('DOMContentLoaded', () => {
  document.body.appendChild(document.createElement('meals'));
  const app = new Vue(App).$mount('meals');
});