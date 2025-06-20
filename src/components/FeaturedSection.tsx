
import { Star } from "lucide-react";
import { CategoryHeader } from "@/components/CategoryHeader";
import { ResourceCard } from "@/components/ResourceCard";

interface TransformedResource {
  id: number;
  title: string;
  description: string;
  url: string;
  category: string;
  tags: string[];
  featured: boolean;
}

interface FeaturedSectionProps {
  resources: TransformedResource[];
  selectedCategory: string;
}

export const FeaturedSection = ({ resources, selectedCategory }: FeaturedSectionProps) => {
  if (selectedCategory !== "All" || resources.length === 0) {
    return null;
  }

  return (
    <div className="mb-8">
      <CategoryHeader
        title="Featured Resources"
        count={resources.length}
        icon={<Star className="w-5 h-5" />}
      />
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
        {resources.map((resource) => (
          <ResourceCard key={resource.id} resource={resource} featured />
        ))}
      </div>
    </div>
  );
};
