import cors from "cors"
import express, { Application } from "express"
import router from "./routes"

class App {
  public app: Application

  constructor() {
    this.app = express()
    this.middlewares()
    this.routes()
  }

  private middlewares(): void {
    this.app.use(
      cors({
        origin: "http://localhost:300",
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
}

export default new App().app
