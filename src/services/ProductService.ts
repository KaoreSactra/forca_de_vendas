import { PrismaClient } from "@prisma/client"
import { IProduct, ISku } from "../interfaces/products"

class ProductService {
  private prisma: PrismaClient

  constructor() {
    this.prisma = new PrismaClient()
  }

  public async getProducts(query: any): Promise<IProduct[]> {
    const products = await this.prisma.variants.findMany({
      include: {
        skus: {
          select: {
            id: true,
            size: true,
            price: true,
            stock: true,
            min_quantity: true,
          },
        },
        products: {
          select: {
            id: true,
            name: true,
            reference: true,
            gender: true,
            prompt_delivery: true,
            description: true,
            type: true,
            open_grid: true,
            categories: { select: { name: true } },
            subcategories: { select: { name: true } },
            brands: { select: { name: true } },
            company_id: true,
          },
        },
      },
    })

    return products.map((variant) => ({
      id: variant.products?.id || null,
      name: variant.products?.name || "Sem Nome",
      variant_name: variant.name || "Variante Padrão",
      hex_code: variant.hex_code || "#FFFFFF",
      reference: variant.products?.reference || "Sem Referência",
      gender: variant.products?.gender || "Não informado",
      category: variant.products?.categories?.name || null,
      subcategory: variant.products?.subcategories?.name || null,
      prompt_delivery: variant.products?.prompt_delivery ?? false,
      description: variant.products?.description || null,
      type: variant.products?.type || null,
      open_grid: variant.products?.open_grid ?? false,
      skus: variant.skus.map((sku) => ({
        id: sku.id,
        size: sku.size,
        price: Number(sku.price),
        stock: sku.stock,
        min_quantity: sku.min_quantity,
      })) as ISku[],
      companies: { key: variant.products?.company_id || null },
      brand: variant.products?.brands?.name || "Sem Marca",
    }))
  }

  public async getFilters(onlyDeleted: boolean) {
    return {
      brands: await this.prisma.brands.findMany(),
      categories: await this.prisma.categories.findMany(),
      products: await this.prisma.products.findMany({
        where: {
          deleted_at: onlyDeleted ? { not: null } : undefined,
        },
      }),
    }
  }

  public async getProductCount(query: any) {
    return this.prisma.variants.count()
  }

  public async createProduct(data: any) {
    return this.prisma.products.create({ data })
  }

  public async updateProduct(id: number, data: any) {
    return this.prisma.products.update({ where: { id }, data })
  }

  public async deleteProduct(id: number) {
    return this.prisma.products.update({
      where: { id },
      data: { deleted_at: new Date() },
    })
  }
}

export default new ProductService()
