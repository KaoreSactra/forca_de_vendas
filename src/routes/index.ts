import { Router } from "express"
import productRoutes from "./ProductRoutes"

class Routes {
  public router: Router

  constructor() {
    this.router = Router()
    this.initializeRoutes()
  }

  private initializeRoutes(): void {
    this.router.use("/products", productRoutes)
  }
}

export default new Routes().router