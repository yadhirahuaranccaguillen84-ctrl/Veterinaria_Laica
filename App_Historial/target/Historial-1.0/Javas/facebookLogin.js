/**
 * Módulo de autenticación con Facebook usando Firebase.
 * Permite a los usuarios iniciar sesión usando su cuenta de Facebook.
 */

// Importar las funciones necesarias de Firebase Authentication
import {
  FacebookAuthProvider,
  signInWithPopup,
} from "https://www.gstatic.com/firebasejs/10.3.1/firebase-auth.js";
import { auth } from "./firebase.js";

// Obtener el botón de login con Facebook del DOM
const facebookButon = document.querySelector("#facebookLogin");

// Agregar evento click al botón de Facebook
facebookButon.addEventListener("click", () => {
  // Crear un nuevo proveedor de autenticación de Facebook
  const provider = new FacebookAuthProvider();
  try {
    // Iniciar sesión con popup usando el proveedor de Facebook
    const credenciales = signInWithPopup(auth, provider);
    console.log(credenciales);
  } catch (error) {
    // Manejar errores de autenticación
    console.log(error);
  }
});
