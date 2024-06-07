//= require jquery3
//= require jquery_ujs
//= require_tree .

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery"
import "popper.js"
import "bootstrap"

import "../stylesheets/application" 

Rails.start()
Turbolinks.start()
ActiveStorage.start()

window.$ = window.jQuery = require('jquery');

import Raty from "raty.js"
window.raty = function(elem,opt) {
  let raty =  new Raty(elem,opt)
  raty.init();
  return raty;
}