import bodyParser from "body-parser"
import express from "express"
import ProductRoutes from "./routes/ProductRoutes"

const app = express()
app.use(bodyParser.json())

app.use("/products", ProductRoutes)

app.listen(3000, () => {
  console.log("Servidor rodando na porta: 3000")
})

export default app
