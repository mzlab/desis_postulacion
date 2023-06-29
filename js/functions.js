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