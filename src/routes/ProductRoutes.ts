import express from "express"
import ProductController from "../controllers/ProductController"

const router = express.Router()

router.get("/", ProductController.getProducts)
router.get("/filters", ProductController.getFilters)
router.get("/count", ProductController.getProductCount)
router.post("/", ProductController.createProduct)
router.put("/:id", ProductController.updateProduct)
router.delete("/:id", ProductController.deleteProduct)

export default router