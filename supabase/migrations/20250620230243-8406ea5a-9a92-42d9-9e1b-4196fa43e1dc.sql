
-- Insert stock music and sound effects resources into the existing Stock Music & Sound Effects category
WITH stock_music_category AS (
  SELECT id FROM categories WHERE slug = 'stock-music-sound-effects'
)
INSERT INTO public.resources (title, description, url, category_id, featured) 
SELECT 
  title,
  description,
  url,
  (SELECT id FROM stock_music_category),
  featured
FROM (VALUES
  ('YouTube Studio Audio Library', 'Royalty-free audio library for downloadable music and sound effects. Cleared for YouTube monetization.', 'https://www.youtube.com/audiolibrary', true),
  ('Free Stock Music', 'Royalty free stock music for YouTube videos, podcasts, etc', 'https://www.free-stock-music.com/', false),
  ('Bensound', 'Download Royalty Free Music for free and use it in your project', 'https://www.bensound.com/', true),
  ('Mixkit', 'Free music for your projects', 'https://mixkit.co/free-stock-music/', true),
  ('Freesound', 'Free stock music and sounds', 'https://freesound.org/', true),
  ('Free Music Archive', 'Collaborative database of creative-commons licensed sound for musicians and sound lovers', 'https://freemusicarchive.org/', false),
  ('Musopen', 'An online copyright free classical music library', 'https://musopen.org/music/', false),
  ('Pixabay', 'Free music downloads for your project like Youtube videos, Music, Vlog, Film, Podcast etc.', 'https://pixabay.com/music/', true),
  ('Unminus', 'Free Premium Music for Your Projects 🎁 Royalty Free. Cleared for YouTube.', 'https://www.unminus.com/', false)
) AS t(title, description, url, featured)
WHERE NOT EXISTS (
  SELECT 1 FROM resources WHERE title = t.title
);
