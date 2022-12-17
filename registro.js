const url = "http://34.230.250.81:3000/api/educando/";
let resultados = '';
const formArticulo = document.querySelector("form");
const dniedu = document.getElementById("DNIEDU");
const nomedu = document.getElementById("NOMEDU");
const apeedu = document.getElementById("APEEDU");
const sexedu = document.getElementById("SEXEDU");
const teledu = document.getElementById("TELEDU");
const graedu = document.getElementById("GRAEDU")

var opcion = '';
 
btnCrear.addEventListener('click', () => {
    console.log("Acción de listar activada");
    opcion = 'crear';
});
 
formArticulo.addEventListener('submit',
    (e) => {
     e.preventDefault();
     if (opcion == 'crear') {
         if (USERPED.value == "" || EMAUSPED.value == "" || CELUSPED.value == "" || FOODPED.value == "" || MSGPED.value == "") {
             alert("Asegúrese de que todos los campos estén completos");
             return false;
         } else {
             console.log("Todos los campos están completos");
             fetch(
                 url,
                 {
                     method: 'POST',
                     headers: {
                         'content-Type':'application/json'
                     },
                     body: JSON.stringify(
                         {
                            DNIEDU: DNIEDU.value,
                            NOMEDU: NOMEDU.value,
                            APEEDU: APEEDU.value,
                            SEXEDU: SEXEDU.value,
                            TELEDU: TELEDU.value,
                            GRAEDU: GRAEDU.value
                         }
                     )
                 }
             )
             .then(
                 response => response.json()
             )
             .then(
                 response => location.reload()
             );
         }
     } else if(opcion == 'editar'){
         console.log("Activado el ");
     }
    }
);
