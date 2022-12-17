var express = require('express');
 
 
var app = express();
 
 
app.use(express.urlencoded({ extended: true }));
app.use(express.static(__dirname + '/'));
 
app.get('/', function (req, res) {
    res.sendFile(__dirname + "/index.html");
});
 
app.get('/login', function (req, res) {
    res.sendFile(__dirname + "/login.html");
});
 
const puerto = process.env.PUERTO || 3000;
 
app.listen(puerto, function () {
  console.log("Servidor funcionando en puerto: " + puerto);
});
 
//Recursos
app.use(express.static(__dirname+'/'));

var mysql = require("mysql");
 
var cors = require("cors");
 
app.use(express.json());
app.use(cors());
 
//Verficar si esta informacion es correcta de acuerdo a tu localhost
var conexion = mysql.createConnection({
    host: "34.230.250.81",
    user: "H221S2_26",
    password: "1234",
    database: "registrate",
});
 
//Verificar si la conexion a base de datos fue exitosa ,de lo contrario te devolvera un error
conexion.connect(function (error) {
    if (error) {
      throw error;
    } else {
      console.log("Conexión exitosa");
    }
  });
 
 
 
app.post("/api/educando", (req, res) => {
    let data = {
        dniedu: req.body.DNIEDU,
        nomedu: req.body.NOMEDU,
        apeedu: req.body.APEEDU,
        sexedu: req.body.SEXEDU,
        teledu: req.body.TELEDU,
        graedu: req.body.GRAEDU
      };
    let sql = "INSERT INTO educando SET ?";
    conexion.query(sql, data, function (error, results) {
    if (error) {
        throw error;
    } else {
        console.log(data);
        res.send(data);
    }
    });
  });
