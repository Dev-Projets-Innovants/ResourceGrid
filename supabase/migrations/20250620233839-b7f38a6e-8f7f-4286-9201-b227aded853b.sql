
-- Insert Firefox Extensions resources into the existing category
WITH firefox_extensions_category AS (
  SELECT id FROM categories WHERE slug = 'firefox-extensions'
)
INSERT INTO public.resources (title, description, url, category_id, featured) 
SELECT 
  title,
  description,
  url,
  (SELECT id FROM firefox_extensions_category),
  featured
FROM (VALUES
  ('WhatFont', 'Identify fonts on web pages', 'https://addons.mozilla.org/en-US/firefox/addon/zjm-whatfont/', true),
  ('WhatRuns', 'Discover technologies used on websites', 'https://addons.mozilla.org/en-US/firefox/addon/whatruns/', true),
  ('Web Developer', 'Toolbar for web development tasks', 'https://addons.mozilla.org/en-US/firefox/addon/web-developer/', true),
  ('Awesome Screenshot & Screen Recorder', 'Capture and annotate screenshots', 'https://addons.mozilla.org/en-US/firefox/addon/screenshot-capture-annotate/', false),
  ('daily.dev - News for Busy Developers', 'Developer news and resources', 'https://addons.mozilla.org/en-US/firefox/addon/daily/', true),
  ('JSONView', 'Format and syntax highlight JSON', 'https://addons.mozilla.org/en-US/firefox/addon/jsonview/', false),
  ('Window Resizer', 'Resize browser window to predefined dimensions', 'https://addons.mozilla.org/en-US/firefox/addon/window-resizer-webextension/', false),
  ('Responsive Viewer', 'Test responsive design of websites', 'https://addons.mozilla.org/en-US/firefox/addon/responsify-viewer/', true),
  ('BrowserStack', 'Instantly preview websites on different devices', 'https://addons.mozilla.org/en-US/firefox/addon/browserstack-toolbar-toggle/', false),
  ('VisBug', 'Web design debugging tool', 'https://addons.mozilla.org/en-US/firefox/addon/visbug/', true),
  ('Kontrast - WCAG Contrast Checker', 'Check contrast levels for accessibility', 'https://addons.mozilla.org/en-US/firefox/addon/wcag-contrast-checker/', false),
  ('PerfectPixel', 'Overlay an image over a web page to compare', 'https://addons.mozilla.org/en-US/firefox/addon/pixel-perfect-pro/', true),
  ('Pesticide', 'Outline elements on web page for easy visualization', 'https://addons.mozilla.org/en-US/firefox/addon/pesticide-for-firefox/', false),
  ('Site Palette', 'Extract color palette from website', 'https://addons.mozilla.org/en-US/firefox/addon/website-color-palette/', false),
  ('ColorZilla', 'Advanced color picker and eyedropper', 'https://addons.mozilla.org/en-US/firefox/addon/colorzilla/', true),
  ('Lorem Ipsum Generator (Default Text)', 'Generate lorem ipsum text', 'https://addons.mozilla.org/en-US/firefox/addon/openlorem/', false),
  ('JavaScript and CSS Code Beautifier', 'Beautify and minify JavaScript and CSS code', 'https://addons.mozilla.org/en-US/firefox/addon/beautifer-minify/', false),
  ('Imageye - Image downloader', 'Download images from web pages', 'https://addons.mozilla.org/en-US/firefox/addon/imageye_image_downloader/', false),
  ('Fireshot - Full Page Screen Capture', 'Capture full web pages', 'https://addons.mozilla.org/en-US/firefox/addon/fireshot/', false),
  ('Stylebot', 'Customize the appearance of web pages', 'https://addons.mozilla.org/en-US/firefox/addon/stylebot-web/', false),
  ('ColorPick Eyedropper', 'Simple color picker and eyedropper', 'https://addons.mozilla.org/en-US/firefox/addon/colorpick-eyedropper/', false),
  ('React Developer Tool', 'Inspect React component hierarchy', 'https://addons.mozilla.org/en-US/firefox/addon/react-devtools/', true),
  ('Wappalyzer', 'Identify technologies used on websites', 'https://addons.mozilla.org/en-US/firefox/addon/wappalyzer/', true)
) AS t(title, description, url, featured)
WHERE NOT EXISTS (
  SELECT 1 FROM resources WHERE title = t.title
);
