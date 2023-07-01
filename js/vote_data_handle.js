
const form = document.getElementById('vote_form');

form.addEventListener('submit', (e) => { 
    e.preventDefault();

    //Si el formulario fue correctamente validado
    if (validarFormulario()) {

        const nombre = document.getElementById("nombre_completo").value;
        const alias = document.getElementById("alias").value;
        const rut = document.getElementById("rut").value;
        const email = document.getElementById("email").value;
        const regionId = document.getElementById("region").value;
        const comunaId = document.getElementById("comuna").value;
        const candidatoId = document.getElementById("candidato").value;

        const checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
        const valores = Array.from(checkboxes).map(checkbox => checkbox.value);

        const voto = {
            nombre_completo: nombre,
            alias: alias,
            rut: rut,
            email: email,
            region: regionId,
            comuna: comunaId,
            candidato: candidatoId,
            referencia: valores
        };

        fetch("app/voto.php", {
            method: "POST",
            headers: {
              "Content-Type": "application/json"
            },
            body: JSON.stringify(voto)
          })
          .then((response) => {
            console.log(response);
          })
          .catch((error) => {
            console.log(error);
          });
        
        form.submit();
    }   
});

