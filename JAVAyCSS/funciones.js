/*FUNCION PARA EL CURSOR DEL RATON*/

const cursor = document.querySelector('.cursor');

document.addEventListener('mousemove', e => {
    cursor.setAttribute("style", "top: " + (e.pageY -10) + "px; left: "+ (e.pageX - 15) + "px;");
})

/*FUNCION TARJETA CON EFECTO*/
/*tarjeta con efecto*/
const card = document.querySelector('.card');
/*al pasar el cursor aumenta la escala*/
card.addEventListener('mouseenter', () => {
  card.style.transform = 'scale(1.5)';
});
/*al alejar el cursor regresa a la escala original*/
card.addEventListener('mouseleave', () => {
  card.style.transform = 'scale(1)';
});

/* Hypervinculos */
function Boton_facebook(){
    location.href="https://www.facebook.com/iemariaenriqueta.dominici.7";
}

function Boton_linkedin(){
    location.href="https://www.linkedin.com/in/maria-enriqueta-aguilar-alvarez-18254578/";
}

function Boton_instagram(){
    location.href="https://www.instagram.com/";
}