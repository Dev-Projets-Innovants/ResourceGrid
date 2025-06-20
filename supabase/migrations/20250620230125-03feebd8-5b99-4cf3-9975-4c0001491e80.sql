
-- Insert stock video resources into the existing Stock Videos category
WITH stock_videos_category AS (
  SELECT id FROM categories WHERE slug = 'stock-videos'
)
INSERT INTO public.resources (title, description, url, category_id, featured) 
SELECT 
  title,
  description,
  url,
  (SELECT id FROM stock_videos_category),
  featured
FROM (VALUES
  ('Pexels', 'Largest library of free to use videos, donated by the community', 'https://www.pexels.com/videos', true),
  ('Pixabay', 'Large library of free to use videos, donated by the community similar to Pexels', 'https://www.pixabay.com/videos', true),
  ('Coverr.co', 'Beautiful free stock video footage', 'https://coverr.co/', true),
  ('Videezy', 'Free HD stock footage & 4K videos', 'https://www.videezy.com/', false),
  ('Mix Kit', 'Stock video clips & music', 'https://mixkit.co/', true),
  ('Life Of Vids', 'Free video clips and loops', 'https://www.lifeofvids.com/', false),
  ('Videvo', 'Free and premium stock videos', 'https://www.videvo.net/stock-video-footage/', false),
  ('Loopvidz', 'Free To Use Cinema graphs Created With VIMAGE App', 'http://stock.loopvidz.com/', false),
  ('SplitShire', 'Beautiful & exclusive free stock videos & photos', 'https://www.splitshire.com/', false),
  ('Free-Stock-Video', 'Free Footage Stock Videos', 'https://free-stock.video', false)
) AS t(title, description, url, featured)
WHERE NOT EXISTS (
  SELECT 1 FROM resources WHERE title = t.title
);
