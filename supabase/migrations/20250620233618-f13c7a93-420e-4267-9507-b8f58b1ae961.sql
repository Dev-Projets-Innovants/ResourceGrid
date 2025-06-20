
-- Insert Image Compression resources into the existing category
WITH image_compression_category AS (
  SELECT id FROM categories WHERE slug = 'image-compression'
)
INSERT INTO public.resources (title, description, url, category_id, featured) 
SELECT 
  title,
  description,
  url,
  (SELECT id FROM image_compression_category),
  featured
FROM (VALUES
  ('TinyPNG', 'Smart PNG and JPEG compression', 'https://tinypng.com/', true),
  ('Optimizilla', 'Online JPEG and PNG optimizer / compressor with settings and archive download', 'https://imagecompressor.com/', false),
  ('Compressor.io', 'JPEG, PNG, GIF, SVG Compression', 'https://compressor.io/', true),
  ('Squoosh.app', 'Image compression from Google Chrome Labs', 'https://squoosh.app/', true),
  ('BulkResizePhotos', 'Bulk image resizing, compression & converting that perform all the tasks within the browser (It works offline)', 'https://bulkresizephotos.com/', false),
  ('iLoveIMG', 'The fastest free web app for easy image modification', 'https://www.iloveimg.com/', true),
  ('SvgOMG', 'Online SVG optimizer with a lot of settings and possibility to cut and paste svg code directly in it', 'https://jakearchibald.github.io/svgomg/', true),
  ('CompressJPEG', 'Compress JPEG images with size even greater than 5MB', 'https://compressjpeg.com/', false),
  ('CompressNow', 'JPEG, GIF, PNG Compression', 'https://compressnow.com/', false),
  ('Promo Image Resizer', 'Free Image and Photo Resizer', 'https://promo.com/tools/image-resizer/', false),
  ('Image Optimizer', 'Image Optimizer Free With Quality Options', 'http://www.imageoptimizer.net/', false),
  ('SVGminify', 'This tool removes superfluous information, thereby reducing the size of your SVG files', 'https://www.svgminify.com/', false),
  ('JPEG Optimizer', 'Free online tool for resizing and compressing digital photos and images for displaying on the web', 'http://jpeg-optimizer.com/', false),
  ('Resizing.app', 'Resize Your Images Online', 'https://resizing.app/', false),
  ('EZGif', 'Animated GIF maker and Image editor including Image optimization and supports WebP conversion', 'https://ezgif.com/', false),
  ('OnlinePngtools', 'Resize png for without losing transparent background', 'https://onlinepngtools.com/resize-png', false),
  ('Verexif', 'Remove meta tags in image in order to reduce image size and increase privacy security', 'https://www.verexif.com/en/', false),
  ('Vecta Nano', 'Uses lossless compression to compress inefficient SVG codes by removing unnecessary data. (Free & Paid)', 'https://vecta.io/nano', false),
  ('Watermarkly', 'Private, client-side compression of JPEG images. The app does not send images to a server for processing', 'https://watermarkly.com/compress-jpeg/', false),
  ('Jpeg.io', 'Convert any major image format into a highly optimized JPEG', 'https://www.jpeg.io', false),
  ('CompressImage.io', 'Compress JPG and PNG images. No Limits. Bulk Conversion. Convert to WebP. Works Offline', 'https://compressimage.io', false),
  ('JPEG Compressor', 'free image compressor tool and it support JPEG, PNG, SVG, JPG, WEBP and GIF', 'https://jpegcompressor.com/', false)
) AS t(title, description, url, featured)
WHERE NOT EXISTS (
  SELECT 1 FROM resources WHERE title = t.title
);
