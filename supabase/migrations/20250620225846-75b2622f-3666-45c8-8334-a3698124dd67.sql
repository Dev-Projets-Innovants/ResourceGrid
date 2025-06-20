
-- Insert icon font resources into the existing Icon Fonts category
WITH icon_fonts_category AS (
  SELECT id FROM categories WHERE slug = 'icon-fonts'
)
INSERT INTO public.resources (title, description, url, category_id, featured) 
SELECT 
  title,
  description,
  url,
  (SELECT id FROM icon_fonts_category),
  featured
FROM (VALUES
  ('Font Awesome', 'The web''s most popular icon set and toolkit', 'https://fontawesome.com/', true),
  ('Line Awesome', 'Swap in replacement of Font Awesome with modern line icons', 'https://icons8.com/line-awesome', false),
  ('Material Icons', 'Material design icon library', 'https://material.io/resources/icons/', true),
  ('IonIcons', 'Beautifully crafted open source icons from Ionic team', 'http://ionicons.com/', true),
  ('Zurb Foundation Icons', 'Customizable Foundation icons', 'https://zurb.com/playground/foundation-icon-fonts-3', false),
  ('Fontisto Icons', 'Fontisto the iconic font and css toolkit · 616+ free icons', 'https://fontisto.com/', false),
  ('Boxicons', 'Boxicons is a free collection of carefully crafted open source icons', 'https://boxicons.com/', true),
  ('Icofont', '2100+ free icons to spice up your creative designs', 'https://icofont.com/', false),
  ('Material Palette', 'Free to pick palettes, icons and colors for Material Design', 'https://www.materialpalette.com/icons', false),
  ('Material Design Iconic Font', 'Material design icon font', 'http://zavoloklom.github.io/material-design-iconic-font/index.html', false),
  ('Vscode Codicons', 'The icon font from Visual Studio Code', 'https://microsoft.github.io/vscode-codicons/dist/codicon.html', false),
  ('Devicon', 'Devicon is a set of icons representing programming languages, designing & development tools', 'https://devicon.dev', false),
  ('PaymentFont', 'A sleek web font for payment operators and methods. Featuring 116 icons', 'https://github.com/AlexanderPoellmann/PaymentFont', false),
  ('Weather Icons', 'Weather Icons is the only icon font with 222 weather themed icons', 'https://erikflowers.github.io/weather-icons/', false),
  ('Stroke 7', '202 thin stroke icons inspired by iOS 7', 'https://themes-pixeden.com/font-demos/7-stroke/index.html', false),
  ('Jam Icons', '890+ handcrafted icons to make your web app awesome', 'https://jam-icons.com/', false),
  ('Fontello', '200+ web icons where you can customize the names or codes of icons', 'http://fontello.com/', false),
  ('Linea', 'Linea: Featuring 750+ Free Icons', 'https://linea.io/', false),
  ('Unicons', 'A set of 1100+ Free line style icons available as web font, SVG icons, and as components for JS frameworks like React, Vue and React Native', 'https://iconscout.com/unicons', true),
  ('Mobirise Icons', 'A free, open source set of 150 elegant, pixel-perfect linear icons, available as web icon font and SVG icons', 'https://mobiriseicons.com/', false),
  ('Hero Icons', 'Free Open Source Svg Icon Library', 'https://heroicons.dev/', false),
  ('React Icons', 'An Open Source and free Svg Icon Library, it is a collection of your favorite icon libraries like Font Awesome and Material Icons to provide you with a wide range of SVG icons to choose from', 'https://react-icons.github.io/react-icons/', true)
) AS t(title, description, url, featured)
WHERE NOT EXISTS (
  SELECT 1 FROM resources WHERE title = t.title
);
