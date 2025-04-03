import { Request, Response } from "express"
import { IProduct } from "../interfaces/Product"
import ProductService from "../services/ProductService"

class ProductController {
  public async getProducts(req: Request, res: Response) {
    try {
      const products: IProduct[] = await ProductService.getProducts(req.query)
      res.json(products)
    } catch (error) {
      res.status(500).json({ error: "Failed to fetch products" })
    }
  }

  public async getFilters(req: Request, res: Response) {
    try {
      const { deleted } = req.query
      const filters = await ProductService.getFilters(deleted === "true")

      res.json(filters)
    } catch (error) {
      res.status(500).json({ error: "Failed to fetch filters" })
    }
  }

  public async getProductCount(req: Request, res: Response): Promise<void> {
    try {
      const count = await ProductService.getProductCount(req.query)
      res.json({ count })
    } catch (error) {
      res.status(500).json({ error: "Failed to fetch product count" })
    }
  }

  public async createProduct(req: Request, res: Response): Promise<void> {
    try {
      const product = await ProductService.createProduct(req.body)
      res.status(201).json(product)
    } catch (error) {
      res.status(500).json({ error: "Failed to create product" })
    }
  }

  public async updateProduct(req: Request, res: Response): Promise<void> {
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

  public async deleteProduct(req: Request, res: Response): Promise<void> {
    try {
      await ProductService.deleteProduct(parseInt(req.params.id))
      res.status(204).send()
    } catch (error) {
      res.status(500).json({ error: "Failed to delete product" })
    }
  }
}

export default new ProductController()
