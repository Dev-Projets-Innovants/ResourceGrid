
-- Insert stock photo resources into the existing Stock Photos category
WITH stock_photos_category AS (
  SELECT id FROM categories WHERE slug = 'stock-photos'
)
INSERT INTO public.resources (title, description, url, category_id, featured) 
SELECT 
  title,
  description,
  url,
  (SELECT id FROM stock_photos_category),
  featured
FROM (VALUES
  ('Pexels', 'Free stock photos shared by talented creators', 'https://www.pexels.com/', true),
  ('Unsplash', 'The internet''s source of freely usable images', 'https://unsplash.com/', true),
  ('Pixabay', 'Over 1.7 million+ high-quality stock images and videos', 'https://pixabay.com/', true),
  ('Magdeleine', 'Gallery & free high-resolution photo everyday', 'https://magdeleine.co/', false),
  ('Picspree', 'Royalty free images, stock photos, illustrations, and vectors', 'https://picspree.com', false),
  ('Burst', 'Free stock photos collections', 'https://burst.shopify.com/', false),
  ('Gratisography', 'Free collection of free high-resolution pictures', 'https://gratisography.com/', false),
  ('Life of Pix', 'Free high-resolution photography', 'https://www.lifeofpix.com/', false),
  ('Stock Snap', 'Hundreds of high quality photos added weekly', 'https://stocksnap.io/', true),
  ('Morguefile', 'Over 350,000 free stock photos for commercial use', 'https://morguefile.com/', false),
  ('Kaboom Pics', 'Stock photography and color palettes. Good for product images', 'https://kaboompics.com/', false),
  ('New Old Stock', 'Stock vintage photos', 'https://nos.twnsnd.co/', false),
  ('Pic Jumbo', 'Good collections of different types of photos', 'https://picjumbo.com/', false),
  ('Public Domain Pictures', 'Public domain images of all types', 'https://www.publicdomainpictures.net/en/', false),
  ('Find A Photo', 'Searches multiple stock photo websites', 'https://www.chamberofcommerce.org/findaphoto/', false),
  ('Stockvault', 'Categorized stock photos', 'http://www.stockvault.net/', false),
  ('Placeholder', 'A free image placeholder service for the web. You can specify image size and format', 'https://placeholder.com/', false),
  ('Realistic Shots', 'Free high-resolution stock photos', 'https://realisticshots.com/', false),
  ('Negative Space', 'High-Resolution Free Stock Photos', 'https://negativespace.co/', false),
  ('SkitterPhoto', 'Free high-resolution photography', 'https://skitterphoto.com/', false),
  ('PicoGraphy', 'Gorgeous, High-Resolution, Free Photos', 'https://picography.co/', false),
  ('Wunder Stock', 'Stunningly amazing free photos', 'https://wunderstock.com/', false),
  ('PxHere', 'Free Images & Free stock photos - PxHere', 'https://pxhere.com/', false),
  ('Piqsels', 'Royalty Free Stock Photos', 'https://piqsels.com/', false),
  ('FoodiesFeed', 'Food photo stock', 'https://www.foodiesfeed.com/', false),
  ('Nappy', 'A website offering Beautiful, high-res photos of black and brown people', 'https://www.nappy.co/', false),
  ('Generated Photos', 'Unique AI Generated model photos', 'https://generated.photos/', false),
  ('Reshot', 'Uniquely free photos. Handpicked, non-stocky images', 'https://www.reshot.com/', false),
  ('Free Images', 'Find and download free stock photos - all free for personal and commercial use', 'https://www.freeimages.com/', false),
  ('Lorem Picsum', 'An easy to use API to get beautiful placeholder images. Size and other parameters can be specified', 'https://picsum.photos/', true),
  ('scienceimage', 'An image library specializing in science and nature images', 'https://www.scienceimage.csiro.au', false),
  ('Integration & Application Network Image Library', 'Free images to provide scientists, resource managers, government agencies, community groups and graphics professionals with a resource for enhancing science communication', 'https://ian.umces.edu/imagelibrary', false),
  ('Saxifraga', 'Free nature images', 'http://www.freenatureimages.eu', false),
  ('Creative Commons', 'Search for free images to reuse', 'https://search.creativecommons.org', false),
  ('AllTheFreeStock', 'a curated list of free stock images, audio and videos', 'https://allthefreestock.com/', true),
  ('Lorem.space - Placeholder image generator', 'API for placeholder images but useful!', 'https://lorem.space', false),
  ('Openverse', 'Openverse is a search engine for openly-licensed media', 'https://wordpress.org/openverse/', false),
  ('ISO Republic', 'Get Thousands of Free High-Resolution Stock CC0 Photos', 'https://isorepublic.com/', false)
) AS t(title, description, url, featured)
WHERE NOT EXISTS (
  SELECT 1 FROM resources WHERE title = t.title
);
