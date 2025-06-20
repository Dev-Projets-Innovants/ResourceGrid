
import { useState, useEffect } from "react";
import { Search, ExternalLink, Star, Bookmark } from "lucide-react";
import { Sidebar } from "@/components/Sidebar";
import { ResourceCard } from "@/components/ResourceCard";
import { SearchBar } from "@/components/SearchBar";
import { CategoryHeader } from "@/components/CategoryHeader";
import { 
  Pagination, 
  PaginationContent, 
  PaginationItem, 
  PaginationLink, 
  PaginationNext, 
  PaginationPrevious,
  PaginationEllipsis 
} from "@/components/ui/pagination";
import { useCategories } from "@/hooks/useCategories";
import { useResources } from "@/hooks/useResources";
import { usePagination } from "@/hooks/usePagination";

const Index = () => {
  const [selectedCategory, setSelectedCategory] = useState<string>("All");
  const [searchQuery, setSearchQuery] = useState("");
  const [sidebarOpen, setSidebarOpen] = useState(true);

  const { data: categories = [], isLoading: categoriesLoading, error: categoriesError } = useCategories();
  const { data: resources = [], isLoading: resourcesLoading, error: resourcesError } = useResources();

  console.log('Categories:', categories);
  console.log('Resources:', resources);
  console.log('Categories loading:', categoriesLoading);
  console.log('Resources loading:', resourcesLoading);

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
    id: parseInt(resource.id.replace(/-/g, '').substring(0, 8), 16),
    title: resource.title,
    description: resource.description,
    url: resource.url,
    category: resource.categories?.name || 'Uncategorized',
    tags: [resource.categories?.name || 'Uncategorized'],
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

  // Pagination for main resources (excluding featured)
  const nonFeaturedResources = transformedResources.filter(resource => !resource.featured);
  const {
    currentPage,
    totalPages,
    paginatedData: paginatedResources,
    goToPage,
    goToNextPage,
    goToPreviousPage,
    resetPagination,
    hasNextPage,
    hasPreviousPage,
  } = usePagination({
    data: nonFeaturedResources,
    itemsPerPage: 12,
  });

  // Reset pagination when filters change
  useEffect(() => {
    resetPagination();
  }, [selectedCategory, searchQuery, resetPagination]);

  const renderPaginationItems = () => {
    const items = [];
    const maxVisiblePages = 5;
    
    if (totalPages <= maxVisiblePages) {
      // Show all pages if total is small
      for (let i = 1; i <= totalPages; i++) {
        items.push(
          <PaginationItem key={i}>
            <PaginationLink
              onClick={() => goToPage(i)}
              isActive={currentPage === i}
              className="cursor-pointer"
            >
              {i}
            </PaginationLink>
          </PaginationItem>
        );
      }
    } else {
      // Show ellipsis for large page counts
      items.push(
        <PaginationItem key={1}>
          <PaginationLink
            onClick={() => goToPage(1)}
            isActive={currentPage === 1}
            className="cursor-pointer"
          >
            1
          </PaginationLink>
        </PaginationItem>
      );

      if (currentPage > 3) {
        items.push(
          <PaginationItem key="ellipsis1">
            <PaginationEllipsis />
          </PaginationItem>
        );
      }

      const start = Math.max(2, currentPage - 1);
      const end = Math.min(totalPages - 1, currentPage + 1);

      for (let i = start; i <= end; i++) {
        items.push(
          <PaginationItem key={i}>
            <PaginationLink
              onClick={() => goToPage(i)}
              isActive={currentPage === i}
              className="cursor-pointer"
            >
              {i}
            </PaginationLink>
          </PaginationItem>
        );
      }

      if (currentPage < totalPages - 2) {
        items.push(
          <PaginationItem key="ellipsis2">
            <PaginationEllipsis />
          </PaginationItem>
        );
      }

      if (totalPages > 1) {
        items.push(
          <PaginationItem key={totalPages}>
            <PaginationLink
              onClick={() => goToPage(totalPages)}
              isActive={currentPage === totalPages}
              className="cursor-pointer"
            >
              {totalPages}
            </PaginationLink>
          </PaginationItem>
        );
      }
    }

    return items;
  };

  if (categoriesLoading || resourcesLoading) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-purple-900 via-blue-900 to-indigo-900 flex items-center justify-center">
        <div className="text-white text-xl">Loading resources...</div>
      </div>
    );
  }

  if (categoriesError || resourcesError) {
    return (
      <div className="min-h-screen bg-gradient-to-br from-purple-900 via-blue-900 to-indigo-900 flex items-center justify-center">
        <div className="text-red-300 text-xl">
          Error loading data: {categoriesError?.message || resourcesError?.message}
        </div>
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
                count={nonFeaturedResources.length}
                icon={<Bookmark className="w-5 h-5" />}
              />
              
              {paginatedResources.length > 0 ? (
                <>
                  <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6 mb-8">
                    {paginatedResources.map((resource) => (
                      <ResourceCard key={resource.id} resource={resource} />
                    ))}
                  </div>

                  {/* Pagination */}
                  {totalPages > 1 && (
                    <div className="flex justify-center">
                      <Pagination className="bg-white/5 backdrop-blur-md rounded-2xl p-4 border border-white/10">
                        <PaginationContent>
                          <PaginationItem>
                            <PaginationPrevious
                              onClick={goToPreviousPage}
                              className={`cursor-pointer text-white hover:bg-white/10 ${
                                !hasPreviousPage ? 'opacity-50 cursor-not-allowed' : ''
                              }`}
                            />
                          </PaginationItem>
                          
                          {renderPaginationItems()}
                          
                          <PaginationItem>
                            <PaginationNext
                              onClick={goToNextPage}
                              className={`cursor-pointer text-white hover:bg-white/10 ${
                                !hasNextPage ? 'opacity-50 cursor-not-allowed' : ''
                              }`}
                            />
                          </PaginationItem>
                        </PaginationContent>
                      </Pagination>
                    </div>
                  )}
                </>
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
