var express = require("express");
var mysql = require("mysql");
var app = express();
var cors = require("cors");

app.use(express.json());
app.use(cors());


//Añadir el api
app.use(express.static(__dirname + '/'));

var conexion = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "REGISTRATE",
  });
  
  conexion.connect(function (error) {
    if (error) {
      throw error;
    } else {
      console.log("Conexión exitosa");
    }
  });

const puerto = process.env.PUERTO || 3000;

app.listen(puerto, function () {
  console.log("Servidor funcionando en puerto: " + puerto);
});

app.post("/api/EDUCANDO", (req, res) => {
	let data = {
    	dniedu: req.body.DNIEDU,
      nomedu: req.body.NOMEDU,
    	apeedu: req.body.APEEDU,
    	sexedu: req.body.SEXEDU,
    	teledu: req.body.TELEDU,
      disedu: req.body.DISEDU,
      proedu: req.body.PROEDU,
      depedu: req.body.DEPEDU,
      diredu: req.body.DIREDU,
      graedu: req.body.GRAEDU,
      fecedu: req.body.FECEDU
    };
	let sql = "INSERT INTO EDUCANDO SET ?";
	conexion.query(sql, data, function (error, results) {
  	if (error) {
    	throw error;
  	} else {
    	console.log(data);
    	res.send(data);
  	}
	});
  });
