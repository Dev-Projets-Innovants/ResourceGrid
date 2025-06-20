
-- Insert CSS animation resources into the existing CSS Animations category
WITH animations_category AS (
  SELECT id FROM categories WHERE slug = 'css-animations'
)
INSERT INTO public.resources (title, description, url, category_id, featured) 
SELECT 
  title,
  description,
  url,
  (SELECT id FROM animations_category),
  featured
FROM (VALUES
  ('Gradienty Animations', 'Over 600+ Curated Animations ready to copy & paste', 'https://gradienty.codes/animations', true),
  ('Animate.css', 'Just-add-water CSS animations', 'https://animate.style/', true),
  ('Bounce.js', 'Bounce.js is a tool and JS library that lets you create beautiful CSS3 powered animations', 'http://bouncejs.com/', true),
  ('Anime.js', 'Anime.js is a lightweight JavaScript animation library with a simple, yet powerful API. It works with CSS properties, SVG, DOM attributes and JavaScript Objects', 'https://animejs.com/', true),
  ('Magic Animations', 'Animations has been one of the most impressive animation libraries available', 'https://www.minimamente.com/project/magic/', true),
  ('Zdog', 'Round, flat, designer-friendly pseudo-3D engine for canvas & SVG', 'https://zzz.dog/', false),
  ('CSShake', 'CSShake delivers exactly what it says on the box — a CSS library designed specifically for shaking elements within your web page', 'http://elrumordelaluz.github.io/csshake/', false),
  ('Hover.css', 'Hover.css is a CSS animation library designed for use with buttons and other UI elements in your website', 'http://ianlunn.github.io/Hover/', true),
  ('AniJS', 'AniJS is an animation library that allows you to add animations to elements in a simple ''sentence-like'' structure', 'http://anijs.github.io/', false),
  ('Animista', 'CSS Animations On Demand', 'http://animista.net/', true),
  ('Tachyons-animate', 'Tachyons itself is an atomic CSS library with a ton of utility classes for essentially designing anything by adding classes to what you need', 'https://github.com/anater/tachyons-animate', false),
  ('Sequence.js', 'Sequence.js is a JavaScript library that provides a responsive CSS framework for creating unique sliders, presentations, banners, and other step-based applications', 'https://www.sequencejs.com/', false),
  ('Infinite', 'These animations, like rotations and pulses, that are specifically designed to run and repeat forever', 'https://tilomitra.github.io/infinite/', false),
  ('OBNOXIOUS.CSS', 'Animations for the strong of heart, and weak of mind', 'http://tholman.com/obnoxious/', false),
  ('MOTION UI', 'A Sass library for creating flexible CSS transitions and animations', 'https://zurb.com/playground/motion-ui', false),
  ('Keyframes.app', 'A graphical user interface for generating custom CSS keyframe animations', 'https://keyframes.app/', true),
  ('thoughtbot', 'CSS Transitions and Transformations for Beginners', 'https://thoughtbot.com/blog/transitions-and-transforms', false),
  ('SVG Artista', 'A useful tool to animate stroke and fill properties in SVG images with plain CSS code', 'https://svgartista.net/', false),
  ('AnimXYZ', 'AnimXYZ helps you create, customize, and compose animations for your website. Built for Vue, React, SCSS, and CSS', 'https://animxyz.com/', false),
  ('Whirl', 'CSS loading animations with minimal effort!', 'https://github.com/jh3y/whirl', false),
  ('Hamburgers', 'Hamburgers is a collection of tasty CSS-animated hamburger icons. Also included is the source as a Sass library. It''s modular and customizable, so cook up your own hamburger', 'https://jonsuh.com/hamburgers/', false),
  ('CSS Loaders & Spinners', 'This is a library having a collection of different types of CSS loaders, spinners', 'https://cssloaders.github.io/', false),
  ('Motion One', 'A new animation library, built on the Web Animations API for the smallest filesize and the fastest performance', 'https://motion.dev/', true),
  ('pocoloco', 'Generate dynamic backgrounds for your website', 'https://pocoloco.io/', false),
  ('AniX', 'Super easy and lightweight css animation library', 'https://adajuly.github.io/AniX/', false),
  ('AOS', 'Animate On Scroll Library', 'https://michalsnik.github.io/aos/', true),
  ('Animatopy', 'Just-add-water CSS animations snippets', 'https://sarthology.github.io/Animatopy/', false)
) AS t(title, description, url, featured)
WHERE NOT EXISTS (
  SELECT 1 FROM resources WHERE title = t.title
);
