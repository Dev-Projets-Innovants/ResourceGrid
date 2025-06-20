
import { ReactNode } from "react";

interface CategoryHeaderProps {
  title: string;
  count: number;
  icon?: ReactNode;
}

export const CategoryHeader = ({ title, count, icon }: CategoryHeaderProps) => {
  return (
    <div className="flex items-center gap-3 mb-6">
      {icon && (
        <div className="p-2 bg-white/10 backdrop-blur-md rounded-lg border border-white/20">
          <div className="text-purple-300">{icon}</div>
        </div>
      )}
      <div>
        <h2 className="text-2xl font-bold text-white">{title}</h2>
        <p className="text-purple-200">
          {count} {count === 1 ? 'resource' : 'resources'} available
        </p>
      </div>
    </div>
  );
};
