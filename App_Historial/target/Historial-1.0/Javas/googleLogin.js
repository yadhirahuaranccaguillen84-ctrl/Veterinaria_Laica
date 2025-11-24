/**
 * Módulo de autenticación con Google usando Firebase.
 * Permite a los usuarios iniciar sesión usando su cuenta de Google.
 */

// Importar las funciones necesarias de Firebase Authentication
import {
  GoogleAuthProvider,
  signInWithPopup,
} from "https://www.gstatic.com/firebasejs/10.3.1/firebase-auth.js";
import { auth } from "./firebase.js";

// Obtener el botón de login con Google del DOM
const googleButon = document.querySelector("#googleLogin");

// Agregar evento click al botón de Google
googleButon.addEventListener("click", () => {
  // Crear un nuevo proveedor de autenticación de Google
  const provider = new GoogleAuthProvider();
  try {
    // Iniciar sesión con popup usando el proveedor de Google
    const credenciales = signInWithPopup(auth, provider);
    console.log(credenciales);
  } catch (error) {
    // Manejar errores de autenticación
    console.log(error);
  }
});
