
import { useMemo } from 'react';

interface TransformedResource {
  id: number;
  title: string;
  description: string;
  url: string;
  category: string;
  tags: string[];
  featured: boolean;
}

export const useResourceSort = (
  resources: TransformedResource[],
  sortBy: string,
  sortOrder: 'asc' | 'desc'
) => {
  return useMemo(() => {
    const sorted = [...resources].sort((a, b) => {
      let comparison = 0;
      
      switch (sortBy) {
        case 'title':
          comparison = a.title.localeCompare(b.title);
          break;
        case 'category':
          comparison = a.category.localeCompare(b.category);
          break;
        case 'featured':
          comparison = (b.featured ? 1 : 0) - (a.featured ? 1 : 0);
          break;
        default:
          comparison = 0;
      }
      
      return sortOrder === 'asc' ? comparison : -comparison;
    });
    
    return sorted;
  }, [resources, sortBy, sortOrder]);
};
