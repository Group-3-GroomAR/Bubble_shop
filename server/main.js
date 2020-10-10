const express = require("express");
const mysql = require('mysql2/promise');
// const bodyparser = require('body-parser');

 

let db = null;
const app = express();


app.use(express.json());



app.post('/makereservation', async(req, res, next)=>{
  console.log(`Making Reservation for ${req.body.customerId} at ${req.body.shopId}`);
  var service=req.body.service;

  var i;
  for(i=0;i<service.length;i++)
  {
    console.log(service[i])
  }
  var startTime=req.body.startTime;
  var hour=parseInt(startTime.substring(0,2));
  var min=parseInt(startTime.substring(3,5));
  
  //this is to get min and hour separately
  var temphour=parseInt(req.body.duration/60);
  var tempmin=req.body.duration%60;

  var endhour=hour+temphour;
  var endmin=min+tempmin;
  if(endmin>59)
  {
    console.log("This is getting bro")
    endhour=endhour+1;
    //var temp=60-endmin;
    //console.log(`This is getting bro${temp}`)
    endmin=endmin-60;
  }
  console.log(`hour${endhour} min${endmin}`);

  var sql=`INSERT INTO reservation(salon_id,customer_id,payment_id,	total,date,start_time,duration,end_time,status,note) VALUES('${req.body.shopId}','${req.body.customerId}','${req.body.paymentId}','${req.body.total}','${req.body.year}-${req.body.month}-${req.body.day}','${req.body.startTime}','${req.body.duration}','${endhour}:${endmin}:00',0,'${req.body.note}')`;
  const row=await db.query(sql);     //sending the request
  //console.log(row);

  res.send({status:"OK"});
  next();
});

//get shop details from database for main
app.get('/customerupcoming',async(req,res,next)=>{
  var obj=JSON.parse(req.query.data);    //obj has all the values
  console.log(`Getting reservation data for customer ${obj.customerId} `);

  var sql=`SELECT * FROM reservation WHERE customer_id='${obj.customerId}' AND status=0 ORDER BY date ASC`;

  const [rows]=await db.query(sql);     //sending the request
  var len=rows.length;
  console.log(len)

  res.json(rows);
  next();
}
);
//get profile of the person
app.get('/customerdetail',async(req,res,next)=>{
  var obj=JSON.parse(req.query.data);    //obj has all the values
  console.log(`Getting profile data for customer ${obj.customerId} `);

  var sql=`SELECT * FROM customer WHERE customer_id='${obj.customerId}'`;

  const row=await db.query(sql);     //sending the request


  res.json(row);
  // res.send({status:"OK"});
  next();
}
)

//get shop details from database for main
app.get('/customerhistory',async(req,res,next)=>{
  var obj=JSON.parse(req.query.data);    //obj has all the values
  console.log(`Getting reservation data for customer ${obj.customerId} `);

  var sql=`SELECT * FROM reservation WHERE customer_id='${obj.customerId}' AND status=1 ORDER BY date ASC`;

  const [rows]=await db.query(sql);     //sending the request
  var len=rows.length;
  console.log(len)

  res.json(rows);
  next();
}
)

//this is for notification
app.get('/customernotification',async(req,res,next)=>{
  var obj=JSON.parse(req.query.data);    //obj has all the values
  console.log(`Getting reservation notification data for customer ${obj.customerId} `);

  var sql=`SELECT * FROM reservation WHERE customer_id='${obj.customerId}' AND date='${obj.year}-${obj.month}-${obj.day}' ORDER BY date ASC`;

  const [rows]=await db.query(sql);     //sending the request
  var len=rows.length;
  console.log(len)

  res.json(rows);
  next();
}
)


//get shop details fro a peticuler shop id
app.get('/shop',async(req,res,next)=>{
  var obj=JSON.parse(req.query.data);    //obj has all the values

  console.log(`getting shop details of shop id ${obj.shopId}`);

  var sql=`SELECT * FROM salon WHERE salon_id='${obj.shopId}'`;

  const row=await db.query(sql);     //sending the request


  res.json(row);
  next();
}
)

//get shop details from database for main
app.get('/shoplist',async(req,res,next)=>{
  var obj=JSON.parse(req.query.data);    //obj has all the values

  console.log(`getting shop details from ${obj.dist}`);
  
  var sql=`SELECT * FROM salon WHERE district='${obj.dist}' ORDER BY shop_name ASC`;
  const [rows]=await db.query(sql);

  res.json(rows);
  next();
}
)
//get the availble time of a date fo the reservation
app.get('/availabletime',async(req,res,next)=>{
  var obj=JSON.parse(req.query.data);    //obj has all the values

  console.log(`getting avalable time for ${obj.shopId} at ${obj.day}/${obj.month}/${obj.year}`);    

  var sql=`SELECT end_time FROM reservation WHERE salon_id='${obj.shopId}' AND date='${obj.year}-${obj.month}-${obj.day}'`;
 // var sql=`SELECT end_time FROM reservation WHERE salon_id='ax3' AND date='2020-08-18'`;
  
  const [rows]=await db.query(sql);     //sending the request

  var len=rows.length;

  //this is to pass tha data to client
  var availabletimemorning;
  var availabletimeevening;

  //this is to set start end time
  var morning;
  var evening;

  var sqlm=`SELECT open_time,is_open   FROM time WHERE salon_id='${obj.shopId}' AND day=${obj.week}`;
  const [rowm]=await db.query(sqlm);     //sending the request
  morning=rowm[0].open_time;

  var sqle=`SELECT break_end,is_open   FROM time WHERE salon_id='${obj.shopId}' AND day=${obj.week}`;
  const [rowe]=await db.query(sqle);     //sending the request
  evening=rowe[0].break_end;

  var maxm=morning;
  var maxe=evening;


  

  //this is getting the time 
  if(len>0)   //if there is a time 
  {
    var i;    //this is for loop
    
    for(i=0;i<len;i++)
    {
      //this is for mornig shedule
      if(rows[i].end_time<evening)
      {
        
        // if(maxm=="no")
        // {
        //   console.log(`this is ${rows[i].end_time}`)
        //   maxm=rows[i].end_time;
        //   print(maxm)
        // }
        // else{
          if(rows[i].end_time>maxm)
          {
            //console.log("Problem")
            maxm=rows[i].end_time;
          }
       // }

      }
      //this is for evening schedule
      else
      {
        // if(maxe==null)
        // {
        //   maxe=rows[i].end_time;
        // }
        // else{
          if(rows[i].end_time>maxe)
          {
            maxe=rows[i].end_time;
          }
        //}


      }


      
    }

    availabletimemorning=maxm;
    availabletimeevening=maxe;


    // if(maxm==null)
    // {
    //   availabletimemorning=morning;
    // }else
    // {
    //   availabletimeevening=maxm;
    // }
    

    // if(maxe==null)
    // {
    //   availabletimeevening=evening;
    // }else{
    //   availabletimeevening=maxe;
    // }


    

  }
  else    //if their is no time in a day or previes reservation
  {
    // var sql2=`SELECT open_time,is_open   FROM time WHERE salon_id='${obj.shopId}' AND day=${obj.week}`;
    // const [row2]=await db.query(sql2);     //sending the request
    // //console.log(row2[0].is_open);

    if(rowm[0].is_open==1)
    {
      availabletimemorning=morning;
      availabletimeevening=evening;
    }
    else
    {
      availabletimemorning=0;
      availabletimeevening=0;
    }
    
  }

  console.log(`morning ${availabletimemorning}: evening ${availabletimeevening}`)

  res.send({morning:availabletimemorning,evening:availabletimeevening});
  next();
}
)

//getting service list of the saloon
app.get('/servicelist',async(req,res,next)=>{
  var obj=JSON.parse(req.query.data);    //obj has all the values
  console.log(`getting servicelist for shop'${obj.shopId}'`);  
 var sql=`SELECT * FROM service WHERE salon_id='${obj.shopId}'`;
 
 const [rows]=await db.query(sql);

 res.json(rows);
 next();
}
)

//getting open time of the saloon
app.get('/opentime',async(req,res,next)=>{
  var obj=JSON.parse(req.query.data);    //obj has all the values
  console.log(`getting open time of shop'${obj.shopId}'`);  

 var sql=`SELECT * FROM time WHERE salon_id='${obj.shopId}'`;
 
 const [rows]=await db.query(sql);

 res.json(rows);
 next();
}
)

// app.get('/shop',async(req,res,next)=>{
//   console.log("HIII");
//   const [rows]=await db.query("SELECT * FROM salon;");

//   res.json(rows);
//   next();
// }
// )


app.post('/createuser', async(req, res, next)=>{
  console.log("inside the function");
  console.log(req.body);
  const name = req.body.name;
  const email = req.body.email;
  const location = req.body.location;
  const mobile = req.body.mobile;
  const certifiednumber = req.body.certifiednumber;
 
  
  console.log(name);
  var sql = `INSERT INTO salon (salon_id,email,contact,shop_name,	salon_address,district,certification_number,about) VALUES ('${name}','${email}','${location}','${mobile}','${certifiednumber}','qwerty123')`;
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
  console.log(obj.uid)
 
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
  var q4 = `SELECT reservation.*,customer.customer_name,reservation.status, GROUP_CONCAT(service.service_name SEPARATOR ', ') as services 
  FROM service 
  INNER JOIN ref_reservation USING (service_id) 
  INNER JOIN reservation USING (id) 
  INNER JOIN customer USING (customer_id) 
  WHERE reservation.salon_id='${obj.uid}' AND date(date) >= CURRENT_DATE AND reservation.status=0
  GROUP BY ref_reservation.id`


const [rows] = await db.query(q4);
console.log("Successfuly Fetched Rows");
  res.json(rows);
   next();
});

app.get('/getuser', async (req, res, next) => {
  var obj=JSON.parse(req.query.data);
  const id = obj.uid;
  // const email = req.body.email;
  // const password  = req.body.password;
 q =`SELECT *,GROUP_CONCAT(service.service_name SEPARATOR ',') as services FROM service INNER JOIN salon USING (salon_id)  WHERE salon_id ='${id}'`
  const [rows] = await db.query(q);
  

  console.log(rows);
  res.json(rows);
   next();
});

app.get('/getTime', async (req, res, next) => {
  var obj=JSON.parse(req.query.data);
  const id = obj.uid;
  // const email = req.body.email;
  // const password  = req.body.password;
 q =`SELECT day,open_time,close_time,is_open,break_start,break_end FROM time WHERE salon_id='${id}`
  const [rows] = await db.query(q);
  

  console.log(rows);
  res.json(rows);
   next();
});
//calendar
app.get('/getDates', async (req, res, next) => {

  var obj=JSON.parse(req.query.data);
  const id = obj.uid;
  console.log(id)
  var query =`SELECT date,id FROM reservation WHERE salon_id='${id}' AND status=0`;
  const [rows] = await db.query(query);
  

  console.log(rows);
  res.json(rows);
   next();
});

//services
app.get('/getservice', async (req, res, next) => {

 
  var query =`SELECT * FROM service_list `;
  const [rows] = await db.query(query);
  

  // console.log(rows);
  res.json(rows);
   next();
});
//scanning query
app.post('/checkQr', async (req, res, next) => {

  console.log(req.body)
  const Id= req.body.resnumber
  const salonId = req.body.shopId
  
  const resId = (Id - 60) / 99 
  
  var q1 =`SELECT id FROM reservation WHERE id='${resId}' AND salon_id='${salonId}' AND status=0`
 

  const [rows] = await db.query(q1);
  console.log(rows)
  if(typeof rows != "undefined" && rows != null && rows.length != null
  && rows.length > 0){
    res.json({status:"Verified"});
    
  }
  else{
    res.json({status:"QR Code Invalid"});
  }
 
  next();
});

app.post('/setStatus', async (req, res, next) => {

 
  const code= req.body.id
  
  const id = (code - 60) / 99 
  
  var q1 =`UPDATE reservation SET status=1 WHERE id='${id}' `
 

  const [rows] = await db.query(q1);
  console.log("Done ! Updated...")
  res.json({status:"OK"});
  
  next();
});

app.post('/updateServices', async (req, res, next) => {

  const id = req.body.id
  const name = req.body.name
  const price = req.body.price
  const duration = req.body.duration
  const female = req.body.female
  const male = req.body.male
  const child = req.body.child
  const category = req.body.category
  
  

  
  var sql = `INSERT INTO service (salon_id,is_male,is_female,	is_children,service_name,	price,duration,service_category) 
  VALUES ('${id}','${male}','${female}','${child}','${name}','${price}','${duration}','${category}')`;
 

  const [rows] = await db.query(sql);
  console.log("Done ! Added New Services")
  res.json({status:"OK"});
  
  next();
});

app.post('/Updateuser', async (req, res, next) => {

  const id = req.body.id
  const name = req.body.name
  const price = req.body.price
  const duration = req.body.duration
  const female = req.body.female
  const male = req.body.male
  const child = req.body.child
  const category = req.body.category
  
  

  
  var sql = `INSERT INTO service (salon_id,is_male,is_female,	is_children,service_name,	price,duration,service_category) 
  VALUES ('${id}','${male}','${female}','${child}','${name}','${price}','${duration}','${category}')`;
 

  const [rows] = await db.query(sql);
  console.log("Done ! Added New Services")
  res.json({status:"OK"});
  
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
    database:'groomar',
    
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