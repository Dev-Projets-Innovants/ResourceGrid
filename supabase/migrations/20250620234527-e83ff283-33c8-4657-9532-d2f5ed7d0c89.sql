
-- Delete categories that have no associated resources
DELETE FROM public.categories 
WHERE id NOT IN (
  SELECT DISTINCT category_id 
  FROM public.resources 
  WHERE category_id IS NOT NULL
);
