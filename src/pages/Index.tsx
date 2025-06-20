
import { useState } from "react";
import { Search, ExternalLink, Star, Bookmark } from "lucide-react";
import { Sidebar } from "@/components/Sidebar";
import { ResourceCard } from "@/components/ResourceCard";
import { SearchBar } from "@/components/SearchBar";
import { CategoryHeader } from "@/components/CategoryHeader";

const resourcesData = {
  "Web Development": [
    {
      id: 1,
      title: "React Documentation",
      description: "The official React documentation with guides and API reference",
      url: "https://react.dev",
      category: "Web Development",
      tags: ["React", "Frontend", "JavaScript"],
      featured: true
    },
    {
      id: 2,
      title: "MDN Web Docs",
      description: "Complete web development documentation and tutorials",
      url: "https://developer.mozilla.org",
      category: "Web Development",
      tags: ["HTML", "CSS", "JavaScript"],
      featured: false
    },
    {
      id: 3,
      title: "Tailwind CSS",
      description: "Utility-first CSS framework for rapid UI development",
      url: "https://tailwindcss.com",
      category: "Web Development",
      tags: ["CSS", "Framework", "Styling"],
      featured: true
    }
  ],
  "Design Tools": [
    {
      id: 4,
      title: "Figma",
      description: "Collaborative interface design tool for teams",
      url: "https://figma.com",
      category: "Design Tools",
      tags: ["Design", "UI/UX", "Collaboration"],
      featured: true
    },
    {
      id: 5,
      title: "Dribbble",
      description: "Creative community for design professionals",
      url: "https://dribbble.com",
      category: "Design Tools",
      tags: ["Inspiration", "Community", "Portfolio"],
      featured: false
    }
  ],
  "Learning Resources": [
    {
      id: 6,
      title: "freeCodeCamp",
      description: "Learn to code with free online courses and certifications",
      url: "https://freecodecamp.org",
      category: "Learning Resources",
      tags: ["Programming", "Courses", "Certification"],
      featured: true
    },
    {
      id: 7,
      title: "Khan Academy",
      description: "Free online courses, lessons and practice",
      url: "https://khanacademy.org",
      category: "Learning Resources",
      tags: ["Education", "Math", "Science"],
      featured: false
    }
  ],
  "Productivity": [
    {
      id: 8,
      title: "Notion",
      description: "All-in-one workspace for notes, docs, and collaboration",
      url: "https://notion.so",
      category: "Productivity",
      tags: ["Notes", "Organization", "Collaboration"],
      featured: true
    },
    {
      id: 9,
      title: "Trello",
      description: "Visual project management with boards and cards",
      url: "https://trello.com",
      category: "Productivity",
      tags: ["Project Management", "Organization"],
      featured: false
    }
  ]
};

const Index = () => {
  const [selectedCategory, setSelectedCategory] = useState<string>("All");
  const [searchQuery, setSearchQuery] = useState("");
  const [sidebarOpen, setSidebarOpen] = useState(true);

  const categories = ["All", ...Object.keys(resourcesData)];

  const getFilteredResources = () => {
    let allResources = Object.values(resourcesData).flat();
    
    if (selectedCategory !== "All") {
      allResources = allResources.filter(resource => resource.category === selectedCategory);
    }
    
    if (searchQuery) {
      allResources = allResources.filter(resource =>
        resource.title.toLowerCase().includes(searchQuery.toLowerCase()) ||
        resource.description.toLowerCase().includes(searchQuery.toLowerCase()) ||
        resource.tags.some(tag => tag.toLowerCase().includes(searchQuery.toLowerCase()))
      );
    }
    
    return allResources;
  };

  const filteredResources = getFilteredResources();
  const featuredResources = filteredResources.filter(resource => resource.featured);

  return (
    <div className="min-h-screen bg-gradient-to-br from-purple-900 via-blue-900 to-indigo-900">
      <div className="flex">
        <Sidebar
          categories={categories}
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
                    {filteredResources.length} resources
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
            {selectedCategory === "All" && featuredResources.length > 0 && (
              <div className="mb-8">
                <CategoryHeader
                  title="Featured Resources"
                  count={featuredResources.length}
                  icon={<Star className="w-5 h-5" />}
                />
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
                  {featuredResources.map((resource) => (
                    <ResourceCard key={resource.id} resource={resource} featured />
                  ))}
                </div>
              </div>
            )}

            {/* Main Resources Grid */}
            <div>
              <CategoryHeader
                title={selectedCategory === "All" ? "All Resources" : selectedCategory}
                count={filteredResources.length}
                icon={<Bookmark className="w-5 h-5" />}
              />
              
              {filteredResources.length > 0 ? (
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
                  {filteredResources.map((resource) => (
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
