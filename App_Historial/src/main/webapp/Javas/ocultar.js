/**
 * Script para controlar el menú hamburguesa en dispositivos móviles.
 * Permite mostrar y ocultar el menú de navegación al hacer clic en el ícono de hamburguesa.
 */

// Obtener los elementos del DOM: botón hamburguesa y menú de navegación
const hamburguesa=document.querySelector(".hamburguesa");
const navegacionEncabezado=document.querySelector(".navegacionEncabezado");
// Variable para controlar el estado del menú (abierto/cerrado)
let pase=true;

// Agregar evento click al botón hamburguesa
hamburguesa.addEventListener("click",()=>{
    if(pase){
        // Si el menú está cerrado, mostrarlo
        navegacionEncabezado.style.display="flex";
        pase=false;
    }else{
        // Si el menú está abierto, ocultarlo
        navegacionEncabezado.style.display="none";
        pase=true;
    }
});

