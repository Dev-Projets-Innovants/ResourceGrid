
import { useQuery } from "@tanstack/react-query";
import { supabase } from "@/integrations/supabase/client";

export interface Resource {
  id: string;
  title: string;
  description: string;
  url: string;
  category_id: string;
  featured: boolean;
  created_at: string;
  updated_at: string;
  categories?: {
    name: string;
    slug: string;
  };
}

export const useResources = (categorySlug?: string) => {
  return useQuery({
    queryKey: ['resources', categorySlug],
    queryFn: async () => {
      let query = supabase
        .from('resources')
        .select(`
          *,
          categories (
            name,
            slug
          )
        `)
        .order('title');

      if (categorySlug && categorySlug !== 'all') {
        query = query.eq('categories.slug', categorySlug);
      }

      const { data, error } = await query;
      
      if (error) {
        console.error('Error fetching resources:', error);
        throw error;
      }
      
      return data as Resource[];
    },
  });
};
