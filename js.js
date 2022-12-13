const puerto = process.env.PUERTO || 3000;
 
app.listen(puerto, function () {
  console.log("Servidor funcionando en puerto: " + puerto);
});
 
//El contrato entre el servidor y el cliente para permitir la inserción de registros en la tabla
app.post("/api/contactanos", (req, res) => {
    console.log('datos : ', req.body);
    let data = {
        nomcon: req.body.nombre,
        corrcon: req.body.correo,
        asucon: req.body.asunto,
        descon: req.body.descripcion
    };
    //Insertamos los datos en tabla creada CONTACTANOS
    let sql = "INSERT INTO contactanos SET ?";
    conexion.query(sql, data, function (error, results) {
    if (error) {
        throw error;
    } else {
        console.log(data);
        res.send(data);
    }
    });
  });
