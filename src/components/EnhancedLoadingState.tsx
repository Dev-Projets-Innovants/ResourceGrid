
import { SkeletonCard } from "@/components/SkeletonCard";

export const EnhancedLoadingState = () => {
  return (
    <div className="min-h-screen bg-gradient-to-br from-purple-900 via-blue-900 to-indigo-900">
      <div className="flex">
        {/* Sidebar skeleton */}
        <div className="w-64 h-screen bg-white/10 backdrop-blur-md border-r border-white/20 p-4">
          <div className="space-y-4">
            <div className="h-8 bg-white/20 rounded animate-pulse" />
            <div className="space-y-2">
              {Array.from({ length: 6 }).map((_, i) => (
                <div key={i} className="h-10 bg-white/15 rounded-lg animate-pulse" />
              ))}
            </div>
          </div>
        </div>
        
        {/* Main content skeleton */}
        <main className="flex-1 p-6 lg:p-8">
          <div className="space-y-8">
            {/* Header skeleton */}
            <div className="space-y-4">
              <div className="h-12 bg-white/20 rounded animate-pulse w-1/3" />
              <div className="h-4 bg-white/15 rounded animate-pulse w-1/4" />
            </div>
            
            {/* Search bar skeleton */}
            <div className="max-w-2xl mx-auto">
              <div className="h-14 bg-white/20 rounded-2xl animate-pulse" />
            </div>
            
            {/* Cards grid skeleton */}
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
              {Array.from({ length: 8 }).map((_, i) => (
                <SkeletonCard key={i} />
              ))}
            </div>
          </div>
        </main>
      </div>
    </div>
  );
};
