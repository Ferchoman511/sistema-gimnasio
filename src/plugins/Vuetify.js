import Vue from "vue";

Vue.use(Vuetify, {
  theme: {
    dark: false
  },
  themes: {
    light: {
      primary: "#23262E",
      secondary: "#7F7F7F",
      accent: "#4CC0E9",
      error: "#b71c1c"
    }
  }
});

const opts = {};

export default new Vuetify(opts);

// src/plugins/Vuetify.js
