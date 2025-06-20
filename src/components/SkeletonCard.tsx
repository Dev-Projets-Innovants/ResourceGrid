
import { Skeleton } from "@/components/ui/skeleton";

export const SkeletonCard = () => {
  return (
    <div className="bg-white/10 backdrop-blur-md border border-white/20 rounded-2xl p-6 space-y-4">
      <div className="flex items-start justify-between">
        <Skeleton className="h-6 w-3/4 bg-white/20" />
        <Skeleton className="h-4 w-4 bg-white/20" />
      </div>
      
      <Skeleton className="h-4 w-full bg-white/20" />
      <Skeleton className="h-4 w-2/3 bg-white/20" />
      
      <div className="flex flex-wrap gap-2 mt-4">
        <Skeleton className="h-6 w-16 bg-white/20 rounded-full" />
        <Skeleton className="h-6 w-20 bg-white/20 rounded-full" />
        <Skeleton className="h-6 w-14 bg-white/20 rounded-full" />
      </div>
      
      <div className="flex items-center justify-between pt-4">
        <Skeleton className="h-4 w-24 bg-white/20" />
        <Skeleton className="h-8 w-20 bg-white/20 rounded-lg" />
      </div>
    </div>
  );
};
