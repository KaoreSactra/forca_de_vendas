import { PrismaClient } from "@prisma/client"
import { IProduct, ISku } from "../interfaces/Products"

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
    const products = await this.prisma.products.findMany({
      where: {
        deleted_at: onlyDeleted ? { not: null } : undefined,
      },
      include: {
        categories: true,
        subcategories: true,
        brands: true,
      },
    })

    // Agrupamento e contagem
    const brandMap = new Map<
      number,
      { id: number; name: string; quantity: number }
    >()
    const typeMap = new Map<string, number>()
    const genderMap = new Map<string, number>()
    const promptDeliveryMap = { true: 0, false: 0 }
    const categoryMap = new Map<
      string,
      { name: string; quantity: number; subcategories: Map<string, number> }
    >()

    for (const product of products) {
      // Brand
      if (product.brands) {
        const b = brandMap.get(product.brands.id)
        if (b) b.quantity += 1
        else
          brandMap.set(product.brands.id, {
            id: product.brands.id,
            name: product.brands.name,
            quantity: 1,
          })
      }

      // Type
      if (product.type) {
        typeMap.set(product.type, (typeMap.get(product.type) || 0) + 1)
      }

      // Gender
      if (product.gender) {
        genderMap.set(product.gender, (genderMap.get(product.gender) || 0) + 1)
      }

      // Prompt delivery
      if (
        product.prompt_delivery !== null &&
        product.prompt_delivery !== undefined
      ) {
        const key = product.prompt_delivery ? "true" : "false"
        promptDeliveryMap[key]++
      }

      // Categories + Subcategories
      const catName = product.categories?.name
      const subName = product.subcategories?.name

      if (catName) {
        if (!categoryMap.has(catName)) {
          categoryMap.set(catName, {
            name: catName,
            quantity: 0,
            subcategories: new Map(),
          })
        }

        const cat = categoryMap.get(catName)!
        cat.quantity += 1

        if (subName) {
          cat.subcategories.set(
            subName,
            (cat.subcategories.get(subName) || 0) + 1
          )
        }
      }
    }

    // Formatando resultado final
    const brands = Array.from(brandMap.values())
    const types = Array.from(typeMap.entries()).map(([name, quantity]) => ({
      name,
      quantity,
    }))
    const genders = Array.from(genderMap.entries()).map(([name, quantity]) => ({
      name,
      quantity,
    }))
    const categories = Array.from(categoryMap.values()).map((cat) => ({
      name: cat.name,
      quantity: cat.quantity,
      subcategories: Array.from(cat.subcategories.entries()).map(
        ([name, quantity]) => ({ name, quantity })
      ),
    }))

    return {
      brands,
      types,
      genders,
      categories,
      promptDelivery: promptDeliveryMap,
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
