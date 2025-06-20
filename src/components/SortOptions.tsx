
import { useState } from "react";
import { ChevronDown, SortAsc, SortDesc } from "lucide-react";

interface SortOptionsProps {
  onSortChange: (sortBy: string, sortOrder: 'asc' | 'desc') => void;
  currentSort: string;
  currentOrder: 'asc' | 'desc';
}

export const SortOptions = ({ onSortChange, currentSort, currentOrder }: SortOptionsProps) => {
  const [isOpen, setIsOpen] = useState(false);

  const sortOptions = [
    { value: 'title', label: 'Title' },
    { value: 'category', label: 'Category' },
    { value: 'featured', label: 'Featured First' },
  ];

  const handleSortChange = (sortBy: string) => {
    onSortChange(sortBy, currentOrder);
    setIsOpen(false);
  };

  const toggleOrder = () => {
    onSortChange(currentSort, currentOrder === 'asc' ? 'desc' : 'asc');
  };

  return (
    <div className="flex items-center gap-2">
      <div className="relative">
        <button
          onClick={() => setIsOpen(!isOpen)}
          className="flex items-center gap-2 px-4 py-2 bg-white/10 backdrop-blur-md border border-white/20 rounded-lg text-white hover:bg-white/15 transition-colors"
        >
          <span className="text-sm">Sort by: {sortOptions.find(opt => opt.value === currentSort)?.label}</span>
          <ChevronDown className={`w-4 h-4 transition-transform ${isOpen ? 'rotate-180' : ''}`} />
        </button>
        
        {isOpen && (
          <div className="absolute top-full left-0 mt-2 w-48 bg-white/20 backdrop-blur-md border border-white/20 rounded-lg shadow-lg z-50">
            {sortOptions.map((option) => (
              <button
                key={option.value}
                onClick={() => handleSortChange(option.value)}
                className={`w-full text-left px-4 py-2 text-white hover:bg-white/10 transition-colors first:rounded-t-lg last:rounded-b-lg ${
                  currentSort === option.value ? 'bg-white/15' : ''
                }`}
              >
                {option.label}
              </button>
            ))}
          </div>
        )}
      </div>
      
      <button
        onClick={toggleOrder}
        className="p-2 bg-white/10 backdrop-blur-md border border-white/20 rounded-lg text-white hover:bg-white/15 transition-colors"
        title={`Sort ${currentOrder === 'asc' ? 'descending' : 'ascending'}`}
      >
        {currentOrder === 'asc' ? <SortAsc className="w-4 h-4" /> : <SortDesc className="w-4 h-4" />}
      </button>
    </div>
  );
};
