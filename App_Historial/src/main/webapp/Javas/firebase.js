/**
 * Configuración e inicialización de Firebase para el sistema de veterinaria.
 * Este archivo configura Firebase Authentication para permitir login con Google y Facebook.
 */

// Importar las funciones necesarias de los SDKs de Firebase
import { initializeApp } from "https://www.gstatic.com/firebasejs/10.3.1/firebase-app.js";
import { getAuth } from "https://www.gstatic.com/firebasejs/10.3.1/firebase-auth.js";

// Configuración de Firebase para la aplicación web
// Para Firebase JS SDK v7.20.0 y posteriores, measurementId es opcional
const firebaseConfig = {
  apiKey: "AIzaSyBe3rIsBkLIZz9jTpbP8p_6Sz0gxsdwQ-E",
  authDomain: "veterinaria-4ffa4.firebaseapp.com",
  projectId: "veterinaria-4ffa4",
  storageBucket: "veterinaria-4ffa4.appspot.com",
  messagingSenderId: "424332393510",
  appId: "1:424332393510:web:54eb9cfd5eea49712f3ae7",
  measurementId: "G-MH7QJ6GE92",
};

// Inicializar Firebase y exportar las instancias para uso en otros módulos
export const app = initializeApp(firebaseConfig);
export const auth = getAuth(app);
