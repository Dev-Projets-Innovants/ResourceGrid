
-- Insert JavaScript animation library resources into the existing JavaScript Animation Libraries category
WITH js_animations_category AS (
  SELECT id FROM categories WHERE slug = 'javascript-animation-libraries'
)
INSERT INTO public.resources (title, description, url, category_id, featured) 
SELECT 
  title,
  description,
  url,
  (SELECT id FROM js_animations_category),
  featured
FROM (VALUES
  ('Greensock', 'A JavaScript library for building high-performance animations that work in every major browser', 'https://greensock.com/', true),
  ('Velocity.js', 'Velocity is a lightweight animation engine with the same API as jQuery''s $.animate()', 'http://velocityjs.org/', true),
  ('lax.js', 'Simple & light weight vanilla javascript plugin to create smooth & beautiful animations when you scroll!', 'https://github.com/alexfoxy/laxxx', false),
  ('Rellax.js', 'A buttery smooth, super lightweight, vanilla javascript parallax library', 'https://github.com/dixonandmoe/rellax', false),
  ('three.js', 'An easy to use, lightweight, 3D library with a default WebGL renderer', 'https://github.com/mrdoob/three.js/', true),
  ('Atropos', 'Atropos is a lightweight, free and open-source JavaScript library to create stunning touch-friendly 3D parallax hover effects', 'https://atroposjs.com/', false),
  ('wow.js', 'Reveal Animations When You Scroll', 'https://wowjs.uk/', false),
  ('chocolat.js', 'Free lightbox plugin', 'http://chocolat.insipi.de/', false),
  ('Animate On Scroll', 'Animate on scroll library to reveal animations when You scroll', 'https://michalsnik.github.io/aos/', true),
  ('Tilt.js', 'A tiny requestAnimationFrame powered 60+fps lightweight parallax hover tilt effect for jQuery', 'http://gijsroge.github.io/tilt.js/', false),
  ('Roughnotation', 'Rough Notation is a small JavaScript library to create and animate annotations on a web page', 'https://roughnotation.com/', false),
  ('tsParticles', 'A lightweight library for creating particles, an improved version of the abandoned and obsolete particles.js', 'https://particles.js.org/', true),
  ('Particles.js', 'A lightweight JavaScript library for creating particles', 'https://vincentgarreau.com/particles.js/', false),
  ('mo.js', 'The motion graphics toolbelt for the web', 'https://mojs.github.io/', true),
  ('Lightbox2', 'A small JS library to overlay images on top of the current page', 'https://lokeshdhakar.com/projects/lightbox2/', false),
  ('Slick', 'Fully responsive carousel', 'https://kenwheeler.github.io/slick/', false),
  ('barba.js', 'Create fluid and smooth transitions between your website''s pages', 'https://barba.js.org/', false),
  ('Locomotive Scroll', 'A simple scroll library that provides detection of elements in viewport & smooth scrolling with parallax', 'https://locomotivemtl.github.io/locomotive-scroll/', true),
  ('Owl carousel', 'Free responsive jQuery carousel', 'https://owlcarousel2.github.io/OwlCarousel2/', false),
  ('Swiperjs', 'Free, Open Source, Modern Slider without jQuery. Available for Vanilla JS and all modern frameworks like React, Vue, Angular etc', 'https://swiperjs.com/', true),
  ('Splide', 'Free, pure JS library for carousels and sliders', 'https://splidejs.com', false),
  ('Simple Parallax', 'The easiest way to get a parallax effect with javascript', 'https://simpleparallax.com/', false),
  ('KUTE.js', 'KUTE.js is a JavaScript animation engine for modern browsers', 'https://thednp.github.io/kute.js/', false),
  ('Granim.js', 'Create fluid and interactive gradient animations with this small javascript library', 'https://sarcadass.github.io/granim.js/index.html', false),
  ('Popmotion', 'Simple animation libraries for delightful user interfaces', 'https://popmotion.io/', false),
  ('Vivus', 'Vivus is a lightweight JavaScript class (with no dependencies) that allows you to animate SVGs, giving them the appearence of being drawn', 'https://maxwellito.github.io/vivus/', false),
  ('Typed.js', 'A JavaScript Typing Animation Library', 'https://mattboldt.com/demos/typed-js/', true),
  ('Progress Bar.js', 'Responsive and slick progress bars with animated SVG paths', 'https://kimmobrunfeldt.github.io/progressbar.js/', false),
  ('Midnight.js', 'Midnight.js lets you switch fixed headers on the fly', 'https://aerolab.github.io/midnight.js/', false),
  ('Tingle.js', 'Tingle is a simple modal plugin written in pure JavaScript', 'https://tingle.robinparisi.com/', false),
  ('Theatre.js', 'Theatre.js is a JavaScript animation library with a GUI. It animates the DOM, WebGL, and any other JavaScript variable', 'https://www.theatrejs.com/', true),
  ('splidejs', 'Splide is a lightweight, flexible and accessible slider/carousel written in TypeScript. No dependencies, no Lighthouse errors', 'https://splidejs.com/', false),
  ('nice-waves', 'Beautiful animated waves', 'https://gvguy.github.io/nice-waves/', false),
  ('Vanta.js', 'Animated website backgrounds in a few lines of code', 'https://www.vantajs.com/', false),
  ('Splitting.js', 'Splitting creates elements and adds CSS variables to unlock amazing possibilities for animating text, grids, and more!', 'https://splitting.js.org/', false)
) AS t(title, description, url, featured)
WHERE NOT EXISTS (
  SELECT 1 FROM resources WHERE title = t.title
);
