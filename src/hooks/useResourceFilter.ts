
import { TransformedResource } from "@/hooks/useResourceTransform";

export const useResourceFilter = (
  resources: TransformedResource[],
  selectedCategory: string,
  searchQuery: string
) => {
  let filteredResources = resources;
  
  // Filter by category
  if (selectedCategory !== "All") {
    filteredResources = filteredResources.filter(resource => 
      resource.category === selectedCategory
    );
  }
  
  // Filter by search query
  if (searchQuery) {
    filteredResources = filteredResources.filter(resource =>
      resource.title.toLowerCase().includes(searchQuery.toLowerCase()) ||
      resource.description.toLowerCase().includes(searchQuery.toLowerCase()) ||
      resource.category.toLowerCase().includes(searchQuery.toLowerCase())
    );
  }
  
  return filteredResources;
};
