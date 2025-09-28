import express, {  type Request , type Response } from "express"
const app  = express()
import { PrismaClient  } from "@prisma/client"
const db = new PrismaClient()


app.post("/" , async(req : Request , res : Response)=> {
   
   const response = await db.user.create({
    data : {
       username : JSON.stringify(Math.random()), 
       password : JSON.stringify(Math.random())
    }
   })

  return res.json({
    response
  })
})



app.get("/"   , async(req : Request , res : Response)=> {
   const data = await db.user.findMany()
  
  return res.json({
    data
  })
})


app.listen(3000 , ()=> {
    console.log("App is listenign on port 3000")
})