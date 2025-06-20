
import { useState } from "react";
import { Search, ExternalLink, Star, Bookmark } from "lucide-react";
import { Sidebar } from "@/components/Sidebar";
import { ResourceCard } from "@/components/ResourceCard";
import { SearchBar } from "@/components/SearchBar";
import { CategoryHeader } from "@/components/CategoryHeader";
import { useCategories } from "@/hooks/useCategories";
import { useResources } from "@/hooks/useResources";

const Index = () => {
  const [selectedCategory, setSelectedCategory] = useState<string>("All");
  const [searchQuery, setSearchQuery] = useState("");
  const [sidebarOpen, setSidebarOpen] = useState(true);

  const { data: categories = [], isLoading: categoriesLoading } = useCategories();
  const { data: resources = [], isLoading: resourcesLoading } = useResources();

  const categoryNames = ["All", ...categories.map(cat => cat.name)];

  const getFilteredResources = () => {
    let filteredResources = resources;
    
    // Filter by category
    if (selectedCategory !== "All") {
      filteredResources = filteredResources.filter(resource => 
        resource.categories?.name === selectedCategory
      );
    }
    
    // Filter by search query
    if (searchQuery) {
      filteredResources = filteredResources.filter(resource =>
        resource.title.toLowerCase().includes(searchQuery.toLowerCase()) ||
        resource.description.toLowerCase().includes(searchQuery.toLowerCase()) ||
        resource.categories?.name.toLowerCase().includes(searchQuery.toLowerCase())
      );
    }
    
    return filteredResources;
  };

  const filteredResources = getFilteredResources();
  const featuredResources = filteredResources.filter(resource => resource.featured);

  // Transform resources to match the existing ResourceCard interface
  const transformedResources = filteredResources.map(resource => ({
    id: parseInt(resource.id.replace(/-/g, '').substring(0, 8), 16), // Convert UUID to number for compatibility
    title: resource.title,
    description: resource.description,
    url: resource.url,
    category: resource.categories?.name || 'Uncategorized',
    tags: [resource.categories?.name || 'Uncategorized'], // Using category as tag for now
    featured: resource.featured
  }));

  const transformedFeaturedResources = featuredResources.map(resource => ({
    id: parseInt(resource.id.replace(/-/g, '').substring(0, 8), 16),
    title: resource.title,
    description: resource.description,
    url: resource.url,
    category: resource.categories?.name || 'Uncategorized',
    tags: [resource.categories?.name || 'Uncategorized'],
    featured: resource.featured
  }));

  if (categoriesLoading || resourcesLoading) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-purple-900 via-blue-900 to-indigo-900 flex items-center justify-center">
        <div className="text-white text-xl">Loading resources...</div>
      </div>
    );
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
        />
        
        <main className={`flex-1 transition-all duration-300 ${sidebarOpen ? 'ml-0' : 'ml-0'}`}>
          <div className="p-6 lg:p-8">
            {/* Header */}
            <div className="mb-8">
              <div className="flex items-center justify-between mb-6">
                <div>
                  <h1 className="text-4xl lg:text-5xl font-bold text-white mb-2 bg-gradient-to-r from-white to-purple-200 bg-clip-text text-transparent">
                    ResourceGrid
                  </h1>
                  <p className="text-lg text-purple-200">
                    Your curated collection of essential resources
                  </p>
                </div>
                <div className="hidden lg:flex items-center space-x-4">
                  <div className="bg-white/10 backdrop-blur-md rounded-full px-4 py-2 text-white border border-white/20">
                    {transformedResources.length} resources
                  </div>
                </div>
              </div>
              
              <SearchBar
                value={searchQuery}
                onChange={setSearchQuery}
                placeholder="Search resources..."
              />
            </div>

            {/* Featured Section */}
            {selectedCategory === "All" && transformedFeaturedResources.length > 0 && (
              <div className="mb-8">
                <CategoryHeader
                  title="Featured Resources"
                  count={transformedFeaturedResources.length}
                  icon={<Star className="w-5 h-5" />}
                />
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
                  {transformedFeaturedResources.map((resource) => (
                    <ResourceCard key={resource.id} resource={resource} featured />
                  ))}
                </div>
              </div>
            )}

            {/* Main Resources Grid */}
            <div>
              <CategoryHeader
                title={selectedCategory === "All" ? "All Resources" : selectedCategory}
                count={transformedResources.length}
                icon={<Bookmark className="w-5 h-5" />}
              />
              
              {transformedResources.length > 0 ? (
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
                  {transformedResources.map((resource) => (
                    <ResourceCard key={resource.id} resource={resource} />
                  ))}
                </div>
              ) : (
                <div className="text-center py-12">
                  <div className="bg-white/5 backdrop-blur-md rounded-2xl p-8 border border-white/10">
                    <Search className="w-12 h-12 text-purple-300 mx-auto mb-4" />
                    <h3 className="text-xl font-semibold text-white mb-2">No resources found</h3>
                    <p className="text-purple-200">
                      Try adjusting your search or browse different categories
                    </p>
                  </div>
                </div>
              )}
            </div>
          </div>
        </main>
      </div>
    </div>
  );
};

export default Index;
