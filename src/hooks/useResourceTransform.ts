
import { Resource } from "@/hooks/useResources";

export interface TransformedResource {
  id: number;
  title: string;
  description: string;
  url: string;
  category: string;
  tags: string[];
  featured: boolean;
}

export const useResourceTransform = (resources: Resource[]): TransformedResource[] => {
  return resources.map(resource => ({
    id: parseInt(resource.id.replace(/-/g, '').substring(0, 8), 16),
    title: resource.title,
    description: resource.description,
    url: resource.url,
    category: resource.categories?.name || 'Uncategorized',
    tags: [resource.categories?.name || 'Uncategorized'],
    featured: resource.featured
  }));
};
