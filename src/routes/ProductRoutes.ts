import { Router } from "express"
import ProductController from "../controllers/ProductController"

class ProductRoutes {
  public router: Router

  constructor() {
    this.router = Router()
    this.initializeRoutes()
  }

  private initializeRoutes(): void {
    this.router.get(
      "/",
      ProductController.getProducts.bind(ProductController))
    this.router.get(
      "/filters",
      ProductController.getFilters.bind(ProductController)
    )
    this.router.get(
      "/count",
      ProductController.getProductCount.bind(ProductController)
    )
    this.router.post(
      "/",
      ProductController.createProduct.bind(ProductController)
    )
    this.router.put(
      "/:id",
      ProductController.updateProduct.bind(ProductController)
    )
    this.router.delete(
      "/:id",
      ProductController.deleteProduct.bind(ProductController)
    )
  }
}

export default new ProductRoutes().router
