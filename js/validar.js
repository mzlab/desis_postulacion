//Función que contiene todas las validaciones personalizadas del formulario
function validarFormulario() {

    const nombre = document.getElementById("nombre_completo");
    const alias = document.getElementById("alias");
    const email = document.getElementById("email");
    const rut = document.getElementById("rut");
    const region = document.getElementById("region");
    const comuna = document.getElementById("comuna");
    const candidato = document.getElementById("candidato");
    const checkboxes = document.querySelectorAll('input[name="choice"]:checked');

    const errorContainer = document.getElementById("error");
    
    let isValid = false; // Variable para verificar la validez de todas las validaciones

    /* Valida cada uno de los campos, la variable isValid para siendo false y solo retornará true si todos
       las validaciones son verdaderas */
    isValid = validarCampo(nombre, errorContainer);
    isValid = validarAlias(alias, errorContainer) && isValid;
    isValid = validarEmail(email, errorContainer) && isValid;
    isValid = validarRut(rut, errorContainer) && isValid;
    isValid = validarRutDuplicado(rut, errorContainer) && isValid;
    isValid = validarSelect(region, errorContainer) && isValid;
    isValid = validarSelect(comuna, errorContainer) && isValid;
    isValid = validarSelect(candidato, errorContainer) && isValid;
    isValid = validarCheckbox(checkboxes, errorContainer) && isValid;

    return isValid;
}   