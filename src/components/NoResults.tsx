
import { Search } from "lucide-react";

export const NoResults = () => {
  return (
    <div className="text-center py-12">
      <div className="bg-white/5 backdrop-blur-md rounded-2xl p-8 border border-white/10">
        <Search className="w-12 h-12 text-purple-300 mx-auto mb-4" />
        <h3 className="text-xl font-semibold text-white mb-2">No resources found</h3>
        <p className="text-purple-200">
          Try adjusting your search or browse different categories
        </p>
      </div>
    </div>
  );
};
