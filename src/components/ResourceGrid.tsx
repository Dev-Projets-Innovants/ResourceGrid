
import { Bookmark } from "lucide-react";
import { CategoryHeader } from "@/components/CategoryHeader";
import { ResourceCard } from "@/components/ResourceCard";
import { NoResults } from "@/components/NoResults";

interface TransformedResource {
  id: number;
  title: string;
  description: string;
  url: string;
  category: string;
  tags: string[];
  featured: boolean;
}

interface ResourceGridProps {
  resources: TransformedResource[];
  selectedCategory: string;
}

export const ResourceGrid = ({ resources, selectedCategory }: ResourceGridProps) => {
  return (
    <div>
      <CategoryHeader
        title={selectedCategory === "All" ? "All Resources" : selectedCategory}
        count={resources.length}
        icon={<Bookmark className="w-5 h-5" />}
      />
      
      {resources.length > 0 ? (
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
          {resources.map((resource) => (
            <ResourceCard key={resource.id} resource={resource} />
          ))}
        </div>
      ) : (
        <NoResults />
      )}
    </div>
  );
};
