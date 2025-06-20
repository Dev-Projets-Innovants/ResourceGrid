
-- Insert logo resources into the existing Logos category
WITH logos_category AS (
  SELECT id FROM categories WHERE slug = 'logos'
)
INSERT INTO public.resources (title, description, url, category_id, featured) 
SELECT 
  title,
  description,
  url,
  (SELECT id FROM logos_category),
  featured
FROM (VALUES
  ('LogoSear.ch', 'Search engine with over 200,000 SVG logos indexed', 'https://logosear.ch/search.html', true),
  ('SVGPorn', '1000+ high-quality SVG logos', 'https://svgporn.com', true),
  ('Payment System Logos', 'Logos for payment systems available in png and svg', 'https://github.com/mpay24/payment-logos/', false),
  ('Browser Logos', 'High resolution web browser logos', 'https://github.com/alrra/browser-logos/', false),
  ('VectorLogoZone', 'Consistently formatted SVG logos', 'https://www.vectorlogo.zone/', true),
  ('World Vector Logo', 'Download vector logos of brands you love', 'https://worldvectorlogo.com/', true),
  ('Logo Maker', 'Create custom logos', 'https://logomakr.com/', false),
  ('Free Logo Maker', 'Fast, All-in-One Logo Generator', 'https://www.namecheap.com/logo-maker/', false),
  ('LOGOwine', 'Brand Logos Free Download in SVG Vector & PNG File Format', 'https://www.logo.wine/', false)
) AS t(title, description, url, featured)
WHERE NOT EXISTS (
  SELECT 1 FROM resources WHERE title = t.title
);
