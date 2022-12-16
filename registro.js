const url = "http://127.0.0.1:3000/api/EDUCANDO/";
let resultados = '';
const formArticulo = document.querySelector("form");
const dniedu = document.getElementById("DNIEDU");
const nomedu = document.getElementById("NOMEDU");
const apeedu = document.getElementById("APEEDU");
const sexedu = document.getElementById("SEXEDU");
const teledu = document.getElementById("TELEDU");
const disedu = document.getElementById("DISEDU");
const proedu = document.getElementById("PROEDU");
const depedu = document.getElementById("DEPEDU");
const diredu = document.getElementById("DIREDU");
const graedu = document.getElementById("GRAEDU");
const fecedu = document.getElementById("FECEDU");

var opcion = '';

btn.addEventListener('click', () => {
    console.log("Acción de listar activada");
    opcion = 'crear';
});

formArticulo.addEventListener('submit',
    (e) => {
   	 e.preventDefault();
   	 if (opcion == 'crear') {
   		 if (DNIEDU.value == "" || NOMEDU.value == "" || APEEDU.value == "" || SEXEDU.value == "" || TELEDU.value == "" || DISEDU.value == "" || PROEDU.value == "" || DEPEDU.value == "" || DIREDU.value == "" || GRAEDU.value == "" || FECEDU.value == "") {
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
                            DISEDU: DISEDU.value,
                            PROEDU: PROEDU.value,
                            DEPEDU: DEPEDU.value,
                            DIREDU: DIREDU.value,
                            GRAEDU: GRAEDU.value,
                            FECEDU: FECEDU.value
                            
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