import express, { Application } from "express"
import cors from "cors"
import router from "./routes"

class Server {
  private app: Application
  private port: number

  constructor(port: number) {
    this.app = express()
    this.port = port
    this.middlewares()
    this.routes()
  }

  private middlewares(): void {
    this.app.use(
      cors({
        origin: `http://localhost:${this.port}`,
        methods: ["GET", "POST", "PUT", "DELETE"],
        allowedHeaders: ["Content-Type", "Authorization"],
        credentials: true,
      })
    )
    this.app.use(express.json())
  }

  private routes(): void {
    this.app.use("/api", router)
  }

  public start(): void {
    this.app.listen(this.port, () => {
      console.log(`API rodando...\nhttp://localhost:${this.port}/api`)
    })
  }
}

const server = new Server(3000)
server.start()

export default server