const express = require("express");
const mysql = require('mysql2/promise');
const bodyparser = require('body-parser');

 

let db = null;
const app = express();


app.use(express.json());






app.get('/shop',async(req,res,next)=>{
  console.log("HIII");
  const [rows]=await db.query("SELECT * FROM salon;");

  res.json(rows);
  next();
}
)


app.post('/createuser', async(req, res, next)=>{
  console.log("inside the function");
  console.log(req.body);
  const name = req.body.name;
  const email = req.body.email;
  const location = req.body.location;
  const mobile = req.body.mobile;
  const certifiednumber = req.body.certifiednumber;
  
  console.log(name);
  var sql = `INSERT INTO salon (name,email,location,mobile,certifiednumber,password) VALUES ('${name}','${email}','${location}','${mobile}','${certifiednumber}','qwerty123')`;
  // var connection = connection.query(sql, function(err,rows,fields) {});
 await db.query(sql,function(err,rows,fields) {});

  res.json({status:"OK"});
  next();
});

app.get('/t', function (req, res) {
  res.send('hello world')
});

app.get('/gettoday', async (req, res, next) => {
  var obj=JSON.parse(req.query.data);
  var today= new Date();


  //inner join
  var query2 = `SELECT * FROM reservation
               INNER JOIN ref_reservation USING (id)
               INNER JOIN service USING (service_id)
               WHERE reservation.salon_id='${obj.uid}'
               `
  
const [rows] = await db.query(query2);
  //console.log(rows[0]);
  res.json(rows);
   next();
});


app.get('/getreservation', async (req, res, next) => {
  var obj=JSON.parse(req.query.data);
  
 
  // const email = req.body.email;
  // const password  = req.body.password;

  // const [rows] = await db.query("SELECT * FROM reservation where salon_id='ax3';");

  //query from 2 tables
  var query1 = `SELECT * FROM reservation,ref_reservation WHERE reservation.id = ref_reservation.id `

  //inner join
  var query2 = `SELECT * FROM reservation
               INNER JOIN ref_reservation USING (id)
               INNER JOIN service USING (service_id)
               WHERE reservation.salon_id='${obj.uid}'
               `
  var query3 = `SELECT *, (SELECT GROUP_CONCAT(service_name) FROM service WHERE service.service_id = ref_reservation.service_id) AS servicelist
  FROM reservation
  INNER JOIN ref_reservation USING (id)
  INNER JOIN service USING (service_id)
  WHERE reservation.salon_id='${obj.uid}'
  `

  //this query is the last one which grp the services
  var q4 = `SELECT reservation.*, GROUP_CONCAT(service.service_name SEPARATOR ', ') as services 
  FROM service 
  INNER JOIN ref_reservation USING (service_id) 
  INNER JOIN reservation USING (id) 
  WHERE reservation.salon_id='${obj.uid}' AND date(date) >= CURRENT_DATE
  GROUP BY ref_reservation.id`


const [rows] = await db.query(q4);
console.log(rows);
  res.json(rows);
   next();
});

app.get('/getuser', async (req, res, next) => {

  // const email = req.body.email;
  // const password  = req.body.password;

  const [rows] = await db.query("SELECT * FROM salon ;");
  

  //console.log(rows[0]);
  res.json(rows);
   next();
});


app.post('/learners', (req, res) => {
  let learner = req.body;
  var sql = "INSERT INTO users (name) VALUES learner.name"; 
 // CALL learnerAddOrEdit(@learner_id,@learner_name,@learner_email,@course_Id);";
  db.query(sql, [learner.name], (err, rows, fields) => {
  if (!err)
  rows.forEach(element => {
  if(element.constructor == Array)
  res.send('New Learner ID : '+ element[0].id);
  });
  else
  console.log(err);
  })
  });

async function main(){
  db = await mysql.createConnection({
    host:'localhost',
    user: 'root',
    password: '',
    database: 'newgroomar',
    
    // localAddress:'http://localhost:80'
    
   });

  db.connect((err)=> {
    
    if(!err)
    console.log('Connection Established Successfully');
    else
    console.log('Connection Failed!'+ JSON.stringify(err,undefined,2));
    });
    const port = process.env.PORT || 3000;
    app.listen(port, () => console.log(`Listening on port ${port}..`));

   


}

main();