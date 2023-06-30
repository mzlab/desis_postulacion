
const form = document.getElementById('vote_form');

form.addEventListener('submit', (e) => { 
    e.preventDefault();

    if (validarFormulario()) {
        form.submit();
    }   
});

