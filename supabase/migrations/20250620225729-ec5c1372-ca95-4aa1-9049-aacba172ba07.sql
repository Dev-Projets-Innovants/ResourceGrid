
-- Insert favicon resources into the existing Favicons category
WITH favicons_category AS (
  SELECT id FROM categories WHERE slug = 'favicons'
)
INSERT INTO public.resources (title, description, url, category_id, featured) 
SELECT 
  title,
  description,
  url,
  (SELECT id FROM favicons_category),
  featured
FROM (VALUES
  ('Favicon.io', 'Generate a favicon from text, from an image, or from an emoji. Download in .ico and .png formats', 'https://favicon.io/', true),
  ('Favicomatic', 'Generate favicons of all the sizes and formats as well as the HTML code needed to support every possible browser or device', 'https://favicomatic.com/', true),
  ('Favicon Generator', 'Generate favicon ico files for your website', 'http://tools.dynamicdrive.com/favicon/', false),
  ('RealFaviconGenerator', 'Generate icons for all platforms (Windows, iOS, Android)', 'https://realfavicongenerator.net/', true),
  ('FontIcon', 'Generate favicons and images from Font Awesome icons', 'https://gauger.io/fonticon/', false),
  ('Favicon.cc', 'Draw a favicon online and browse through a library of favicons made by other users', 'https://www.favicon.cc', false),
  ('Maskable.app Editor', 'Generate maskable PWA icons based on your existing icon', 'https://maskable.app/editor/', false),
  ('Favicon Generator', 'Generate website''s favicon assets. SVG, maskable, image minified supported. Pure frontend. No privacy risk. Fast.', 'https://favicon.inbrowser.app/', false)
) AS t(title, description, url, featured)
WHERE NOT EXISTS (
  SELECT 1 FROM resources WHERE title = t.title
);
