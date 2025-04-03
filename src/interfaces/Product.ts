export interface ISku {
  id: number;
  size: string;
  price: number;
  stock: number;
  min_quantity: number;
}

export interface IProduct {
  id: number | null;
  name: string;
  variant_name: string;
  hex_code: string;
  reference: string;
  gender: string;
  category: string | null;
  subcategory: string | null;
  prompt_delivery: boolean;
  description: string | null;
  type: string | null;
  open_grid: boolean;
  skus: ISku[];
  companies: { key: number | null };
  brand: string;
}
