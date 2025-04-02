import { Request, Response } from "express"
import ProductService from "../services/ProductService"

class ProductController {
  static async getProducts(req: Request, res: Response) {
    try {
      const products = await ProductService.getProducts(req.query)
      res.json(products)
    } catch (error) {
      res.status(500).json({ error: "Failed to fetch products" })
    }
  }

  static async getFilters(req: Request, res: Response) {
    try {
      const filters = await ProductService.getFilters()
      res.json(filters)
    } catch (error) {
      res.status(500).json({ error: "Failed to fetch filters" })
    }
  }

  static async getProductCount(req: Request, res: Response) {
    try {
      const count = await ProductService.getProductCount(req.query)
      res.json({ count })
    } catch (error) {
      res.status(500).json({ error: "Failed to fetch product count" })
    }
  }

  static async createProduct(req: Request, res: Response) {
    try {
      const product = await ProductService.createProduct(req.body)
      res.status(201).json(product)
    } catch (error) {
      res.status(500).json({ error: "Failed to create product" })
    }
  }

  static async updateProduct(req: Request, res: Response) {
    try {
      const updatedProduct = await ProductService.updateProduct(
        parseInt(req.params.id),
        req.body
      )
      res.json(updatedProduct)
    } catch (error) {
      res.status(500).json({ error: "Failed to update product" })
    }
  }

  static async deleteProduct(req: Request, res: Response) {
    try {
      await ProductService.deleteProduct(parseInt(req.params.id))
      res.status(204).send()
    } catch (error) {
      res.status(500).json({ error: "Failed to delete product" })
    }
  }
}

export default ProductController
