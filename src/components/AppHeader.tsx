
import { Github, Star } from "lucide-react";
import { Button } from "@/components/ui/button";

interface AppHeaderProps {
  resourceCount: number;
}

export const AppHeader = ({ resourceCount }: AppHeaderProps) => {
  const handleOwnerRepoClick = () => {
    window.open("https://github.com/Wambaforestin", "_blank");
  };

  const handleStarRepoClick = () => {
    window.open("https://github.com/Dev-Projets-Innovants/ResourceGrid", "_blank");
  };

  return (
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
        <div className="flex items-center space-x-4">
          <div className="hidden lg:flex items-center space-x-4">
            <div className="bg-white/10 backdrop-blur-md rounded-full px-4 py-2 text-white border border-white/20">
              {resourceCount} resources
            </div>
          </div>
          
          {/* GitHub Links */}
          <div className="flex items-center space-x-2">
            <Button
              variant="ghost"
              size="sm"
              onClick={handleOwnerRepoClick}
              className="bg-white/10 backdrop-blur-md border border-white/20 text-white hover:bg-white/20 transition-colors"
            >
              <Github className="w-4 h-4 mr-2" />
              <span className="hidden sm:inline">Owner</span>
            </Button>
            
            <Button
              variant="ghost"
              size="sm"
              onClick={handleStarRepoClick}
              className="bg-white/10 backdrop-blur-md border border-white/20 text-white hover:bg-white/20 transition-colors"
            >
              <Star className="w-4 h-4 mr-2" />
              <span className="hidden sm:inline">Star</span>
            </Button>
          </div>
        </div>
      </div>
    </div>
  );
};
