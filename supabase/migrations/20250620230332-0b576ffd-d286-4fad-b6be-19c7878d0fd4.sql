
-- Insert vectors and clip art resources into the existing Vectors & Clip Art category
WITH vectors_category AS (
  SELECT id FROM categories WHERE slug = 'vectors-clip-art'
)
INSERT INTO public.resources (title, description, url, category_id, featured) 
SELECT 
  title,
  description,
  url,
  (SELECT id FROM vectors_category),
  featured
FROM (VALUES
  ('PNGFree.ai', 'PNGFree.ai offers millions of high-quality Free PNG images', 'https://pngfree.ai/', true),
  ('Vecteezy', 'Find and download free vector art', 'https://www.vecteezy.com/', true),
  ('Freepik', 'Free vectors, stock photos, PSD and icons', 'https://www.freepik.com', true),
  ('Free Vectors', 'Community of vector lovers who share free vector graphics', 'https://www.freevectors.net/', false),
  ('PNGTree', 'png, backgrounds, templates, text effects', 'https://pngtree.com/free-vectors', false),
  ('Vector4Free', 'Free vector graphics', 'https://www.vector4free.com/', false),
  ('Freeble', 'Vectors, patterns, mockups and more', 'http://freebbble.com/', false),
  ('Lukaszadam', 'Free Vector artworks', 'https://lukaszadam.com/', false),
  ('Illlustrations', 'Beautiful 100 Illustrations - png, svg', 'https://illlustrations.co/', true),
  ('Clipart', 'Choose great clipart, png, coloring pages, drawings and more for your projects from the free collection!', 'https://www.clipart.email/', false),
  ('Growwwkit illustrations', 'A set of 8 simple, black & white, stylish illustrations', 'https://growwwkit.com/illustrations/phonies', false),
  ('trianglify.io', 'Generate low-poly backgrounds, textures, and vectors', 'https://trianglify.io/', false),
  ('blob', 'Generate Blob shapes for Web and Flutter apps', 'https://blobs.app/', false),
  ('HiClipart', 'A community for designers to share & download transparent background PNG cliparts', 'https://www.hiclipart.com/', false),
  ('Stories by Freepik', 'A collection of free and customizable illustrations for projects', 'https://stories.freepik.com/', true),
  ('Black Illustrations', 'Beautiful illustrations of black people (free and premium)', 'https://www.blackillustrations.com/', false),
  ('Delesign', 'A collection of free illustrations and more', 'https://delesign.com/free-designs/graphics', false),
  ('Custom Shape Dividers', 'Free tool to make it easier for designers and developers to export a beautiful SVG shape divider', 'https://www.shapedivider.app/', false),
  ('Servier Medical Art', '3000 free medical images to illustrate your publications and PowerPoint presentations', 'https://smart.servier.com', false),
  ('Clker', 'Free clip art you can use for anything you like', 'http://www.clker.com', false),
  ('SVG wave', 'A free, & customizable gradient 🌈 SVG wave generator for UI designs', 'https://svgwave.in/', false),
  ('BGjar', 'Free svg background generator for your websites, blogs and app', 'https://bgjar.com', false),
  ('Heritage Library', 'Vintage Illustrations (vector and png)', 'https://www.heritagetype.com/collections/free-vintage-illustrations', false),
  ('ROBOHASH', 'Generate unique images from any text', 'https://robohash.org/', false),
  ('Tabbied', 'Create and customize minimally generated patterns/artwork to use for background images, print and other projects', 'https://tabbied.com/', false),
  ('Haikei', 'An awesome multishape web app', 'https://app.haikei.app/', true),
  ('Vector', 'Awesome website for all kinds of Moroccan vectors', 'https://vector.ma/', false),
  ('Heazy', 'Unique vector assets within seconds', 'https://app.heazy.studio/', false),
  ('Mossaik', 'Free SVG generator with different tools, waves, tiles, blobs, and more', 'https://mossaik.app/', false)
) AS t(title, description, url, featured)
WHERE NOT EXISTS (
  SELECT 1 FROM resources WHERE title = t.title
);
