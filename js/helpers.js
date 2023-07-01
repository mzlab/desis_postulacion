
/* Valida que un componente no quede vacío, de no cumplirse, muestra un mensaje personalizado y
   resalta el borde del input de color rojo.
    componente : elemento HTML input que contiene el valor del campo a evaluar.
    errorContainer : elemento HTML que contiene los errores.
*/
function validarCampo(componente, errorContainer){
    // Valida que los campos no queden vacios
    if (componente.value.length == 0) {
        errorContainer.appendChild(crearMensajeError("Completa el campo", componente.id));
        componente.classList.add('error-input');
        return false;
    } else {
        componente.classList.remove('error-input');
        eliminarMensajeError(componente.id);
    } 
    return true;
}


/* Valida que el email cumpla con el formato estándar, de no cumplirse, muestra un mensaje personalizado y
   resalta el borde del input de color rojo.
    email : elemento HTML input que contiene el valor email.
    errorContainer : elemento HTML que contiene los errores.
*/
function validarEmail(email, errorContainer) {
    // Expresión regular para validar el formato de email
    const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; 
    if (!regex.test(email.value)) {
      errorContainer.appendChild(crearMensajeError("Ingresa un email válido.", email.id));
      email.classList.add('error-input');
      return false;
    } else {
      email.classList.remove('error-input');
      eliminarMensajeError(email.id);
    }
    return true;    
  }


/* Valida que se seleccionen al menos 2 opciones en el checkbox, de no cumplirse, muestra un mensaje personalizado.
    checkboxArray : array con las opciones seleccionadas.
    errorContainer : elemento HTML que contiene los errores.
*/
function validarCheckbox(checkboxArray, errorContainer){
    if (checkboxArray.length < 2) {
        errorContainer.appendChild(crearMensajeError("Debes seleccionar al menos dos opciones.", 'checkbox'));
        return false;
    } else {
        eliminarMensajeError('checkbox');
    } 
    return true;
}


/* Valida que el alias contenga letras y números, además que su largo sea mayor a 5, de no cumplirse, 
   muestra un mensaje personalizado y resalta el borde del input de color rojo.
    alias : elemento HTML input que contiene el valor alias.
    errorContainer : elemento HTML que contiene los errores.
*/
function validarAlias(alias, errorContainer){
    //Expresión regular para verificar si un string contiene letras y números
    const regex = /^(?=.*[a-zA-Z])(?=.*\d).+$/; 
    if (!regex.test(alias.value) || alias.value.length < 5) {
        errorContainer.appendChild(
            crearMensajeError("La cantidad de caracteres debe ser mayor a 5 y debe contener letras y números.", alias.id));
        alias.classList.add('error-input');
        return false
    } else {
        alias.classList.remove('error-input');
        eliminarMensajeError(alias.id);
    } 
    return true;
}


/* Valida que el rut cumpla con el formato de Chile y que sea un rut genuino, de no cumplirse, 
   muestra un mensaje personalizado y resalta el borde del input de color rojo.
    rut : elemento HTML input que contiene el valor rut.
    errorContainer : elemento HTML que contiene los errores.
*/
function validarRut(rut, errorContainer){

    if (!rutValido(rut.value)) {
        errorContainer.appendChild(crearMensajeError("Rut no válido, use el formato indicado.", rut.id));
        rut.classList.add('error-input');
        return false
    } else {
        rut.classList.remove('error-input');
        eliminarMensajeError(rut.id);
    }
    return true;
}


/* Valida que el rut ingresado no esté repetido, de no cumplirse, muestra un mensaje personalizado y 
   resalta el borde del input de color rojo.
    rut : elemento HTML input que contiene el valor rut.
    errorContainer : elemento HTML que contiene los errores.
*/
async function validarRutDuplicado(rut, errorContainer) {
    try {
        const isDuplicated = await rutDuplicado(rut.value);
        if (isDuplicated) {
            errorContainer.appendChild(crearMensajeError("Sólo puedes votar 1 vez", rut.id));
            rut.classList.add('error-input');
            return false;
        } else {
            rut.classList.remove('error-input');
            eliminarMensajeError(rut.id);
        }
        return true;
    } catch (error) {
        console.log(error);
        return false;
    }
}


/* Valida que haya una opción seleccionada en el select, de no cumplirse, muestra un mensaje personalizado y 
   resalta el borde del input de color rojo.
    selectElement : elemento HTML select.
    errorContainer : elemento HTML que contiene los errores.
*/
function validarSelect(selectElement, errorContainer) {
    if (selectElement.selectedIndex === -1) {
      errorContainer.appendChild(crearMensajeError("Debes seleccionar una opción.", selectElement.id));
      selectElement.classList.add('error-input');
      return false;
    } else {
      selectElement.classList.remove('error-input');
      eliminarMensajeError(selectElement.id);
    }
    return true;
  }


/* Crea un mensaje de error y lo muestra al principio del formulario
    mensaje : string con el mensaje a mostrar
    refElemId : id del componente asociado al error
*/
function crearMensajeError(mensaje, refElemId){
    const idError = refElemId + "_error";
    const existe = document.getElementById(idError);

    if (!existe) {
        const mensajeError = document.createElement("div");
        mensajeError.innerHTML = mensaje;
        mensajeError.classList.add('error-style');
        mensajeError.id = idError;
        return mensajeError;
    }
    return existe;
}


/* Elimina un mensaje de error según el ID de su elemento referencia
    refElemId : id del componente asociado al error
*/
function eliminarMensajeError(refElemId){
    const idError = refElemId + "_error";
    const elemento = document.getElementById(idError);
    if (elemento) {
        elemento.remove();
    }
}


/* Obtiene los datos JSON de la URL entregada y crea opciones para el select 
    url : url del archivo php que devuelve datos JSON.
    selectId : Id del elemento select a poblar con los datos.
    valueKey : Nombre del id del elemento JSON.
    textKey : Nombre del texto descriptivo del elemento JSON.
*/
function fetchAndPopulateSelect(url, select, valueKey, textKey) {
    fetch(url)
        .then(response => response.json())
        .then(data => {
            // Recorrer los datos y crear las opciones para el select
            data.forEach(item => {
                const option = document.createElement('option');
                option.value = item[valueKey];
                option.text = item[textKey];
                select.appendChild(option);
            });

            select.selectedIndex = -1;
        })
        .catch(error => console.log(error));
}


/* Trae los datos desde rut.php, los convierte en JSON y recorre los datos para validar algun duplicado
    vRut : Rut a evaluar.
    Si encuentra un duplicado devuelve true.
    Si no encuentra un duplicado devuelve false.
*/
async function rutDuplicado(vRut) {
    try {
        const response = await fetch('app/rut.php');
        const data = await response.json();
        // Recorrer los datos y validar si el rut está duplicado, de ser así devuelve true
        return data.some(rut => rut === vRut);
    } catch (error) {
        console.log(error);
        return false;
    }
}

// Valida el rut con su cadena completa "XXXXXXXX-X"
function rutValido(rutCompleto) {
    rutCompleto = rutCompleto.replace("‐","-");
    if (!/^[0-9]+[-|‐]{1}[0-9kK]{1}$/.test( rutCompleto ))
        return false;
    var tmp 	= rutCompleto.split('-');
    var digv	= tmp[1]; 
    var rut 	= tmp[0];
    if ( digv == 'K' ) digv = 'k' ;
    
    return (dv(rut) == digv );
}

function dv(T){
    var M=0,S=1;
    for(;T;T=Math.floor(T/10))
        S=(S+T%10*(9-M++%6))%11;

    return S?S-1:'k';
}
