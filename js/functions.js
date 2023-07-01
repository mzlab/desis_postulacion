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


//Función que contiene todas las validaciones personalizadas del formulario
function validarFormulario() {
    const checkboxes = document.querySelectorAll('input[name="choice"]:checked');
    const errorContainer = document.getElementById("error");
    const alias = document.getElementById("alias");
    const rut = document.getElementById("rut");
    const regex = /^(?=.*[a-zA-Z])(?=.*\d).+$/; //Expresión regular para verificar si un string contiene letras y números
    let isValid = true; // Variable para verificar la validez de todas las validaciones

    // Valida que se seleccionen al menos 2 opciones en el checkbox
    if (checkboxes.length < 2) {
        isValid = false; 
        errorContainer.appendChild(crearMensajeError("Debes seleccionar al menos dos opciones.", 'checkbox'));
    } else {
        eliminarMensajeError('checkbox');
    } 

    // Valida alias a través de una expresión regular
    if (!regex.test(alias.value)) {
        isValid = false; 
        errorContainer.appendChild(crearMensajeError("La cantidad de caracteres debe ser mayor a 5 y debe contener letras y números.", alias.id));
        alias.classList.add('error-input');
    } else {
        alias.classList.remove('error-input');
        eliminarMensajeError(alias.id);
    } 

    //Valida rut
    if (!validaRut(rut.value)) {
        isValid = false; 
        errorContainer.appendChild(crearMensajeError("Rut no válido, use el formato indicado.", rut.id));
        rut.classList.add('error-input');
    } else {
        rut.classList.remove('error-input');
        eliminarMensajeError(rut.id);
    }
    

    return isValid;
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

// Valida el rut con su cadena completa "XXXXXXXX-X"
function validaRut(rutCompleto) {
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
