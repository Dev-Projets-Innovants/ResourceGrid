
-- Insert icon resources into the existing Icons category
WITH icons_category AS (
  SELECT id FROM categories WHERE slug = 'icons'
)
INSERT INTO public.resources (title, description, url, category_id, featured) 
SELECT 
  title,
  description,
  url,
  (SELECT id FROM icons_category),
  featured
FROM (VALUES
  ('Circum Icons', 'Consistant open source icons as SVG for React, Vue and Svelte', 'https://circumicons.com/', false),
  ('UXWing', 'Well Optimized, Free icons for commercial use', 'https://uxwing.com/', false),
  ('Shapedfonts Iconclub', '8000+ free icons', 'https://shapedfonts.com/iconclub/', false),
  ('Feather Icons', 'Beautiful, customizable open source icons', 'https://feathericons.com/', true),
  ('Tabler Icons', '3500+ highly customizable open source SVG icons with React, Preact, Vue, Svelte and SolidJS support', 'https://tabler-icons.io/', true),
  ('Xicons', 'SVG Vue/React components integrated from fluentui-system-icons, ionicons, etc. (Vue3, Vue2, React, SVG)', 'https://www.xicons.org/#/', false),
  ('Iconoir', 'Free library of 900+ open source icons', 'https://iconoir.com/', false),
  ('Simple Icons', '1307 Free SVG icons for popular brands', 'https://simpleicons.org/', true),
  ('Linear Icons', '1000+ Ultra crisp vector icons', 'https://linearicons.com/free', false),
  ('Icons8', 'Free icons, photos, vectors and tools', 'https://icons8.com/', true),
  ('Flat Icon', 'The largest database of free icons in PNG, SVG, EPS, PSD and BASE 64 formats', 'https://www.flaticon.com/', true),
  ('The Noun Project', 'Over 2 Million curated icons, created by a global community', 'https://thenounproject.com/', true),
  ('Iconscout', 'Free Download Icons illustrations stock photos at one place', 'https://iconscout.com/', false),
  ('IconSear.ch', 'Search engine with over 50,000 SVG icons indexed', 'https://iconsear.ch/search.html', false),
  ('Nucleo App', 'Nucleo is a beautiful library of 27500 icons, and a powerful application to collect, customize and export all your icons. (Free & Paid)', 'https://nucleoapp.com/', false),
  ('Icon-icons.com', 'Free Icons PNG, ICO, ICNS and Vector file SVG', 'https://icon-icons.com/', false),
  ('Bootstrap Icons', 'Free Icons built for Bootstrap but they''ll work in any project', 'https://icons.getbootstrap.com/', true),
  ('Remix Icon', 'Simply Delightful Icon System', 'https://remixicon.com/', false),
  ('Iconmonstr', 'Discover 4496+ free icons in 313 collections', 'https://iconmonstr.com/', false),
  ('Vivid.js', 'Ready to use Free and Open Source SVG Icons Pack JavaScript Library', 'https://webkul.github.io/vivid/', false),
  ('Iconfinder', 'Free and premium vector icons in SVG, PNG, CSH and AI format', 'https://www.iconfinder.com/', false),
  ('Lordicon', '50 free animated interactive icons', 'https://lordicon.com/icons#free', false),
  ('UseAnimations', 'Free Animated Icons in SVG and Json Format(for lottie)', 'https://useanimations.com/', false),
  ('css.gg', '700+ Open-source CSS, SVG and Figma UI Icons Available in SVG Sprite, styled-components, NPM & API', 'https://css.gg/', false),
  ('IconBros', '7843+ free icons grouped in 182 collections', 'https://www.iconbros.com', false),
  ('Material Design Icons', 'An icon collection allowing designers and developers targeting various platforms to download icons in the format, color and size they need for any project', 'https://materialdesignicons.com/', true),
  ('Heroicons', 'Free, open source icons from the creators of Tailwind CSS', 'https://heroicons.dev/', true),
  ('Zondicons', 'A set of free premium SVG icons for you to use on your digital products', 'https://www.zondicons.com/icons.html', false),
  ('Endless Icons', 'A website offering a number of free icons. Icons are tagged and also compressed into kits', 'http://endlessicons.com/', false),
  ('Icomoon', 'Browse 5500+ Free Icons. Add any set you wish to easily browse and search its icons', 'https://icomoon.io/app/', false),
  ('Eva Icons', 'Eva Icons is a pack of more than 480 beautifully crafted Open Source icons for common actions and items', 'https://akveo.github.io/eva-icons/#/', false),
  ('Cryptoicons', 'A set of 430 crypto and fiat currency icons. Completely free', 'http://cryptoicons.co/', false),
  ('Ikonate', 'Fully customizable & accessible vector icons', 'https://ikonate.com/', false),
  ('appicon', 'Quickly generate app icons in different sizes for your IOS, macOS and Android projects', 'https://appicon.co/', false),
  ('LineIcons', '2000+ Essential Line Icons for Designers and Developers', 'https://lineicons.com', false),
  ('Evericons', 'Evericons is a big pack of over 460 free icons designed by Aleksey Popov', 'https://www.figma.com/resources/assets/evericons-for-figma/', false),
  ('SVG Repo', 'Download free SVG Vectors for commercial use', 'https://www.svgrepo.com/', false),
  ('Convertio', 'Convert PNG files to SVG online & free. (One of the services provided by it.)', 'https://convertio.co/png-svg/', false),
  ('CSS ICON', 'Icon set made with pure css code, no dependencies, "grab and go" icons', 'https://cssicon.space/', false),
  ('Unified icons', 'Thousands of icons, one unified framework. One library, over 40,000 vector icons', 'https://iconify.design/', false),
  ('System UIcons', '220+ icons in a growing collection', 'https://systemuicons.com/', false),
  ('IconPark', 'Transform an SVG icon into multiple themes, and generate React icons，Vue icons，svg icons', 'https://github.com/bytedance/IconPark', false),
  ('Radix Icons', 'A crisp set of 15×15 icons designed by the Modulz team. All icons available as individual react component,SVG and more', 'https://icons.modulz.app/', false),
  ('EOS Icons', 'A pixel-perfect, open source iconic font available as ligature and SVG', 'https://icons.eosdesignsystem.com/', false),
  ('Ionicons', 'Beautifully crafted open source icons for use in web, iOS, Android, and desktop apps', 'https://ionicons.com', false),
  ('Phosphor Icons', 'Phosphor is a flexible icon family for interfaces, diagrams, presentations', 'https://phosphoricons.com', false),
  ('Teeny Icons', 'TeenyIcons is a set icons in SVG format easy to use in html', 'https://teenyicons.com/', false),
  ('Lucide', 'Lucide is an open-source icon library, a fork of Feather Icons', 'https://lucide.netlify.app/', false),
  ('Icones', 'Icon Explorer with Instant searching, powered by Iconify', 'https://icones.js.org/', false),
  ('Shitty Icons', 'Collection of Free icons', 'https://shittyicons.com/', false),
  ('Iconspedia', 'Iconspedia is a website that contains a large collection of high quality free icons', 'https://www.iconspedia.com/', false),
  ('iconhub', 'Just practical stunning icons for everyone', 'https://iconhub.io/', false),
  ('3DICONS', 'Beautifully crafted open source 3D icons', 'https://3dicons.co', false),
  ('IconsDb', 'Free Custom Icons', 'https://www.iconsdb.com/', false),
  ('Emoji Guide', 'The collection of 3300 emojis with their HTML codes for easy use', 'https://emojiguide.org/', false),
  ('Unicorn Icons', '100+ customizable playful animated icons. Available in JSON and SVG format', 'https://unicornicons.com', false),
  ('Sargam Icons', 'A collection of 275+ open-source icons available for Figma, SVGs, and React', 'https://sargamicons.com/', false),
  ('Icon buddy', 'A collection of 100K+ open-source SVG icons, fully customizable for designers and developers', 'https://iconbuddy.app/', false),
  ('Round Icons', 'The world''s biggest premium and free icon packs library of flat icons, line icons, filled outline, isometric and solid styles', 'https://roundicons.com/', false),
  ('Vectopus', 'Top curated collective resources for elite designers', 'https://vectopus.com', false)
) AS t(title, description, url, featured)
WHERE NOT EXISTS (
  SELECT 1 FROM resources WHERE title = t.title
);
