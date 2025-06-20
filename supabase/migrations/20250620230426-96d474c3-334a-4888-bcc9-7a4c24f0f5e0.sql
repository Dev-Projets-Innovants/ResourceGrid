
-- Insert product and image mockup resources into the existing Product & Image Mockups category
WITH mockups_category AS (
  SELECT id FROM categories WHERE slug = 'product-image-mockups'
)
INSERT INTO public.resources (title, description, url, category_id, featured) 
SELECT 
  title,
  description,
  url,
  (SELECT id FROM mockups_category),
  featured
FROM (VALUES
  ('MockCity', 'Bulk generate mockups from PSD templates by automatically placing images in SmartObjects. The visual editor allows you to change SmartObject parameters and see an updated mockup preview in realtime.', 'https://mockcity.com/', true),
  ('Smart Mockups', 'Create stunning product mockups (free & premium)', 'https://smartmockups.com/', true),
  ('Media Modifier', 'beautiful design mockups service for your products (free & premium)', 'https://mediamodifier.com/', true),
  ('Shot Snap', 'Create beautiful device mockup images for your app or website design', 'https://shotsnapp.com/', false),
  ('Screely', 'Instantly turn your screenshot into a mockup', 'https://www.screely.com/', true),
  ('Screenshot.rocks', 'Create beautiful browser & mobile mockups in seconds', 'https://screenshot.rocks/', false),
  ('Screen Peak', 'Create a mockup from a URL', 'https://screenpeek.io/', false),
  ('Mockup World', 'The biggest source of free photo-realistic Mockups online', 'https://www.mockupworld.co/', true),
  ('Collab Shot', 'Real-time screen grabs and image sharing', 'https://www.collabshot.com/', false),
  ('Facebook Devices', 'Images and Sketch files of popular devices', 'https://facebook.design/devices', false),
  ('Threed.io', 'Generate 3D mockups right in your browser', 'https://threed.io', true),
  ('Mockuphone', '100% free mockups for all devices including IOS, Android, Windows Phone, Laptop & Desktop and TV', 'https://mockuphone.com/', false),
  ('Device Shots', 'Create high-resolution device mockups for social media, for free', 'https://deviceshots.com/', false),
  ('Clean Mock', 'Create stunning mockups using latest device frames like iPhone X & custom backgrounds that make your mobile or website design standout, right from your browser quickly & for free', 'https://cleanmock.com/', false),
  ('Mock.Video', 'Instantly create mockups by adding a device frame to your videos', 'https://www.mock.video/', false),
  ('MockupBro', 'Create product mockups with online mockup generator! Just choose a mockup, upload your design and download your image without a watermark', 'https://mockupbro.com/', false),
  ('Animockup', 'Create animated mockups in the browser', 'https://github.com/alyssaxuu/animockup', false),
  ('Pika', 'Instantly create browser mockups and beautiful images for marketing, blog post and more', 'https://pika.style', true),
  ('Lunacy', 'Create mockups from scratch for free', 'https://icons8.com/lunacy', false)
) AS t(title, description, url, featured)
WHERE NOT EXISTS (
  SELECT 1 FROM resources WHERE title = t.title
);
