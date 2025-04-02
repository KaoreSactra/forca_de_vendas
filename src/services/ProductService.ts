import { PrismaClient } from "@prisma/client"

const prisma = new PrismaClient()

class ProductService {
  static async getProducts(query: any) {
    return prisma.variants.findMany({
      include: {
        skus: true,
        products: true,
      },
    })
  }

  static async getFilters() {
    return {
      brands: await prisma.brands.findMany(),
      categories: await prisma.categories.findMany(),
    }
  }

  static async getProductCount(query: any) {
    return prisma.variants.count()
  }

  static async createProduct(data: any) {
    return prisma.products.create({ data })
  }

  static async updateProduct(id: number, data: any) {
    return prisma.products.update({ where: { id }, data })
  }

  static async deleteProduct(id: number) {
    return prisma.products.update({
      where: { id },
      data: { deleted_at: new Date() },
    })
  }
}

export default ProductService
