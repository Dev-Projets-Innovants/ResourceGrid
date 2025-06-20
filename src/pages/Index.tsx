import { useState, useMemo } from "react";
import { Sidebar } from "@/components/Sidebar";
import { SearchBar } from "@/components/SearchBar";
import { AppHeader } from "@/components/AppHeader";
import { FeaturedSection } from "@/components/FeaturedSection";
import { ResourceGrid } from "@/components/ResourceGrid";
import { LoadingState } from "@/components/LoadingState";
import { useCategories } from "@/hooks/useCategories";
import { useResources } from "@/hooks/useResources";
import { useResourceTransform } from "@/hooks/useResourceTransform";
import { useResourceFilter } from "@/hooks/useResourceFilter";
import { cn } from "@/lib/utils";

const Index = () => {
  const [selectedCategory, setSelectedCategory] = useState<string>("All");
  const [searchQuery, setSearchQuery] = useState("");
  const [sidebarOpen, setSidebarOpen] = useState(true);

  const { data: categories = [], isLoading: categoriesLoading } = useCategories();
  const { data: resources = [], isLoading: resourcesLoading } = useResources();

  const categoryNames = ["All", ...categories.map(cat => cat.name)];
  const transformedResources = useResourceTransform(resources);
  const filteredResources = useResourceFilter(transformedResources, selectedCategory, searchQuery);
  
  // Calculate resource counts per category
  const resourceCounts = useMemo(() => {
    const counts: Record<string, number> = {};
    
    // Count all resources
    counts["All"] = transformedResources.length;
    
    // Count resources per category
    transformedResources.forEach(resource => {
      counts[resource.category] = (counts[resource.category] || 0) + 1;
    });
    
    return counts;
  }, [transformedResources]);
  
  const featuredResources = filteredResources.filter(resource => resource.featured);
  const nonFeaturedResources = filteredResources.filter(resource => !resource.featured);

  if (categoriesLoading || resourcesLoading) {
    return <LoadingState />;
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-purple-900 via-blue-900 to-indigo-900">
      <div className="flex">
        <Sidebar
          categories={categoryNames}
          selectedCategory={selectedCategory}
          onCategorySelect={setSelectedCategory}
          isOpen={sidebarOpen}
          onToggle={() => setSidebarOpen(!sidebarOpen)}
          resourceCounts={resourceCounts}
        />
        
        <main className={cn(
          "flex-1 transition-all duration-300",
          sidebarOpen ? "lg:ml-0" : "lg:ml-0"
        )}>
          <div className="p-6 lg:p-8">
            <AppHeader resourceCount={transformedResources.length} />
            
            <div className="mb-8">
              <SearchBar
                value={searchQuery}
                onChange={setSearchQuery}
                placeholder="Search resources, categories, or tags..."
              />
            </div>

            <FeaturedSection 
              resources={featuredResources} 
              selectedCategory={selectedCategory} 
            />

            <ResourceGrid 
              resources={nonFeaturedResources} 
              selectedCategory={selectedCategory} 
            />
          </div>
        </main>
      </div>
    </div>
  );
};

export default Index;
