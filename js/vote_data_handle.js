




// form.addEventListener('submit', (e) => {
//     e.preventDefault();

//     const name = document.getElementById('name').value;
//     const email = document.getElementById('email').value;

//     // Create a FormData object and append form data
//     const formData = new FormData();
//     formData.append('name', name);
//     formData.append('email', email);

//     // Send the form data to the PHP file using fetch()
//     fetch('process.php', {
//         method: 'POST',
//         body: formData
//     })
//     .then(response => response.text())
//     .then(data => {
//         // Handle the response from the PHP file
//         console.log(data);
//     })
//     .catch(error => {
//         // Handle any errors
//         console.error('Error:', error);
//     });

//     form.reset();
// });