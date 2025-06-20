
-- Insert CSS methodology resources into the existing CSS Methodologies category
WITH methodologies_category AS (
  SELECT id FROM categories WHERE slug = 'css-methodologies'
)
INSERT INTO public.resources (title, description, url, category_id, featured) 
SELECT 
  title,
  description,
  url,
  (SELECT id FROM methodologies_category),
  featured
FROM (VALUES
  ('OOCSS', 'OOCSS concepts help us write components that are flexible, modular and interchangeable', 'http://oocss.org/', true),
  ('Atomic CSS', 'Atomic CSS is the approach to CSS architecture that favors small, single-purpose classes with names based on visual function', 'https://acss.io/', true),
  ('BEM', 'Block Element Modifier is a methodology that helps you to create reusable components and code sharing in front-end development', 'http://getbem.com/', true),
  ('SMACSS', 'SMACSS is a way to examine your design process and as a way to fit those rigid frameworks into a flexible thought process', 'http://smacss.com/', true),
  ('CUBE', 'CUBE CSS is a CSS methodology that''s orientated towards simplicity, pragmatism and consistency', 'https://cube.fyi/', false)
) AS t(title, description, url, featured)
WHERE NOT EXISTS (
  SELECT 1 FROM resources WHERE title = t.title
);
