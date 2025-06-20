
import { ChevronRight, Home } from "lucide-react";

interface BreadcrumbProps {
  selectedCategory: string;
  searchQuery?: string;
  totalResults: number;
}

export const Breadcrumb = ({ selectedCategory, searchQuery, totalResults }: BreadcrumbProps) => {
  return (
    <div className="flex items-center space-x-2 text-sm text-purple-200 mb-6">
      <Home className="w-4 h-4" />
      <span>Home</span>
      
      {selectedCategory && selectedCategory !== "All" && (
        <>
          <ChevronRight className="w-4 h-4" />
          <span className="text-white font-medium">{selectedCategory}</span>
        </>
      )}
      
      {searchQuery && (
        <>
          <ChevronRight className="w-4 h-4" />
          <span className="text-purple-300">Search: "{searchQuery}"</span>
        </>
      )}
      
      <span className="text-purple-300">•</span>
      <span className="text-purple-300">
        {totalResults} {totalResults === 1 ? 'resource' : 'resources'}
      </span>
    </div>
  );
};
