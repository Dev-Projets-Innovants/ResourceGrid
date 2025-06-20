
import { useState } from "react";
import { ChevronLeft, ChevronRight, Home, Search, Bookmark, Code, Monitor, Briefcase, Book, Tool, Grid2x2, Star } from "lucide-react";
import { cn } from "@/lib/utils";

interface SidebarProps {
  categories: string[];
  selectedCategory: string;
  onCategorySelect: (category: string) => void;
  isOpen: boolean;
  onToggle: () => void;
  resourceCounts?: Record<string, number>;
}

export const Sidebar = ({
  categories,
  selectedCategory,
  onCategorySelect,
  isOpen,
  onToggle,
  resourceCounts = {},
}: SidebarProps) => {
  const getCategoryIcon = (category: string) => {
    const iconMap: Record<string, any> = {
      "All": Home,
      "Development": Code,
      "Design": Monitor,
      "Business": Briefcase,
      "Education": Book,
      "Tools": Tool,
      "Resources": Grid2x2,
      "Featured": Star,
    };
    
    // Find matching icon by checking if category name contains any key
    for (const [key, icon] of Object.entries(iconMap)) {
      if (category.toLowerCase().includes(key.toLowerCase()) || key === category) {
        return icon;
      }
    }
    
    return Bookmark; // Default fallback
  };

  const getResourceCount = (category: string) => {
    return resourceCounts[category] || 0;
  };

  return (
    <>
      {/* Mobile Overlay */}
      {isOpen && (
        <div
          className="fixed inset-0 bg-black/50 backdrop-blur-sm z-40 lg:hidden"
          onClick={onToggle}
        />
      )}

      {/* Sidebar */}
      <div
        className={cn(
          "fixed left-0 top-0 h-full bg-white/10 backdrop-blur-md border-r border-white/20 z-50 transition-all duration-300 lg:relative lg:translate-x-0",
          isOpen ? "translate-x-0" : "-translate-x-full",
          isOpen ? "w-64" : "w-16"
        )}
      >
        <div className="flex flex-col h-full">
          {/* Header */}
          <div className="p-6 border-b border-white/20">
            <div className="flex items-center justify-between">
              {isOpen && (
                <div>
                  <h2 className="text-xl font-bold text-white">Categories</h2>
                  <p className="text-sm text-purple-200">Browse by type</p>
                </div>
              )}
              <button
                onClick={onToggle}
                className="p-2 rounded-lg bg-white/10 hover:bg-white/20 transition-colors text-white"
              >
                {isOpen ? (
                  <ChevronLeft className="w-4 h-4" />
                ) : (
                  <ChevronRight className="w-4 h-4" />
                )}
              </button>
            </div>
          </div>

          {/* Navigation */}
          <nav className="flex-1 p-4 space-y-2 overflow-y-auto">
            {categories.map((category) => {
              const IconComponent = getCategoryIcon(category);
              const count = getResourceCount(category);
              
              return (
                <button
                  key={category}
                  onClick={() => onCategorySelect(category)}
                  className={cn(
                    "w-full flex items-center gap-3 px-3 py-3 rounded-xl transition-all duration-200 group relative",
                    selectedCategory === category
                      ? "bg-gradient-to-r from-purple-500/30 to-blue-500/30 text-white border border-white/20 shadow-lg"
                      : "text-purple-200 hover:bg-white/10 hover:text-white"
                  )}
                >
                  <IconComponent className="w-5 h-5 flex-shrink-0" />
                  {isOpen && (
                    <>
                      <span className="font-medium truncate flex-1 text-left">{category}</span>
                      {count > 0 && (
                        <span className={cn(
                          "text-xs px-2 py-1 rounded-full font-medium",
                          selectedCategory === category
                            ? "bg-white/20 text-white"
                            : "bg-purple-500/20 text-purple-200"
                        )}>
                          {count}
                        </span>
                      )}
                    </>
                  )}
                  
                  {/* Tooltip for collapsed state */}
                  {!isOpen && (
                    <div className="absolute left-full ml-2 px-2 py-1 bg-gray-900 text-white text-sm rounded opacity-0 group-hover:opacity-100 transition-opacity pointer-events-none whitespace-nowrap z-50">
                      {category} {count > 0 && `(${count})`}
                    </div>
                  )}
                </button>
              );
            })}
          </nav>

          {/* Footer */}
          {isOpen && (
            <div className="p-4 border-t border-white/20">
              <div className="bg-gradient-to-r from-purple-500/20 to-blue-500/20 rounded-xl p-4 border border-white/10">
                <p className="text-sm text-white font-medium mb-1">
                  ResourceGrid
                </p>
                <p className="text-xs text-purple-200">
                  Organize your digital resources
                </p>
              </div>
            </div>
          )}
        </div>
      </div>

      {/* Mobile Toggle Button */}
      {!isOpen && (
        <button
          onClick={onToggle}
          className="fixed top-4 left-4 z-50 lg:hidden p-3 rounded-full bg-white/10 backdrop-blur-md border border-white/20 text-white hover:bg-white/20 transition-colors"
        >
          <ChevronRight className="w-5 h-5" />
        </button>
      )}
    </>
  );
};
