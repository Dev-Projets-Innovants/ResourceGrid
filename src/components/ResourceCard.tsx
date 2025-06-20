
import { ExternalLink, Star, Bookmark } from "lucide-react";
import { cn } from "@/lib/utils";

interface Resource {
  id: number;
  title: string;
  description: string;
  url: string;
  category: string;
  tags: string[];
  featured: boolean;
}

interface ResourceCardProps {
  resource: Resource;
  featured?: boolean;
}

export const ResourceCard = ({ resource, featured = false }: ResourceCardProps) => {
  const handleClick = () => {
    window.open(resource.url, '_blank', 'noopener,noreferrer');
  };

  return (
    <div
      onClick={handleClick}
      className={cn(
        "group relative cursor-pointer transition-all duration-300 hover:scale-105",
        "bg-white/10 backdrop-blur-md rounded-2xl p-6 border border-white/20",
        "hover:bg-white/15 hover:border-white/30 hover:shadow-2xl hover:shadow-purple-500/25",
        featured && "ring-2 ring-purple-400/50 bg-gradient-to-br from-purple-500/20 to-blue-500/20"
      )}
    >
      {/* Featured Badge */}
      {resource.featured && (
        <div className="absolute -top-2 -right-2 bg-gradient-to-r from-yellow-400 to-orange-500 rounded-full p-2 shadow-lg">
          <Star className="w-4 h-4 text-white fill-current" />
        </div>
      )}

      {/* Content */}
      <div className="space-y-4">
        {/* Header */}
        <div className="flex items-start justify-between">
          <div className="space-y-2 flex-1">
            <h3 className="text-lg font-semibold text-white group-hover:text-purple-200 transition-colors line-clamp-2">
              {resource.title}
            </h3>
            <p className="text-sm text-purple-200 leading-relaxed line-clamp-3">
              {resource.description}
            </p>
          </div>
          <ExternalLink className="w-5 h-5 text-purple-300 group-hover:text-white transition-colors flex-shrink-0 ml-2" />
        </div>

        {/* Tags */}
        <div className="flex flex-wrap gap-2">
          {resource.tags.slice(0, 3).map((tag, index) => (
            <span
              key={index}
              className="px-2 py-1 text-xs bg-white/10 text-purple-200 rounded-lg border border-white/10"
            >
              {tag}
            </span>
          ))}
          {resource.tags.length > 3 && (
            <span className="px-2 py-1 text-xs bg-white/10 text-purple-200 rounded-lg border border-white/10">
              +{resource.tags.length - 3}
            </span>
          )}
        </div>

        {/* Category */}
        <div className="flex items-center gap-2 pt-2 border-t border-white/10">
          <Bookmark className="w-4 h-4 text-purple-300" />
          <span className="text-sm text-purple-300">{resource.category}</span>
        </div>
      </div>

      {/* Hover Effect */}
      <div className="absolute inset-0 rounded-2xl bg-gradient-to-r from-purple-500/10 to-blue-500/10 opacity-0 group-hover:opacity-100 transition-opacity duration-300 pointer-events-none" />
    </div>
  );
};
