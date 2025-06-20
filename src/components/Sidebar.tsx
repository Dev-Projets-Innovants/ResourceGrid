
import { useState } from "react";
import { ChevronLeft, ChevronRight, Home, Search, Bookmark } from "lucide-react";
import { cn } from "@/lib/utils";

interface SidebarProps {
  categories: string[];
  selectedCategory: string;
  onCategorySelect: (category: string) => void;
  isOpen: boolean;
  onToggle: () => void;
}

export const Sidebar = ({
  categories,
  selectedCategory,
  onCategorySelect,
  isOpen,
  onToggle,
}: SidebarProps) => {
  const getCategoryIcon = (category: string) => {
    switch (category) {
      case "All":
        return <Home className="w-5 h-5" />;
      default:
        return <Bookmark className="w-5 h-5" />;
    }
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
          "fixed left-0 top-0 h-full bg-white/10 backdrop-blur-md border-r border-white/20 z-50 transition-transform duration-300 lg:relative lg:translate-x-0",
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
          <nav className="flex-1 p-4 space-y-2">
            {categories.map((category) => (
              <button
                key={category}
                onClick={() => onCategorySelect(category)}
                className={cn(
                  "w-full flex items-center gap-3 px-3 py-3 rounded-xl transition-all duration-200",
                  selectedCategory === category
                    ? "bg-gradient-to-r from-purple-500/30 to-blue-500/30 text-white border border-white/20 shadow-lg"
                    : "text-purple-200 hover:bg-white/10 hover:text-white"
                )}
              >
                {getCategoryIcon(category)}
                {isOpen && (
                  <span className="font-medium truncate">{category}</span>
                )}
              </button>
            ))}
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
