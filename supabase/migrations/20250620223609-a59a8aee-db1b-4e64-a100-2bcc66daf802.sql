
-- First, get the category_id for UI Graphics
WITH ui_graphics_category AS (
  SELECT id FROM categories WHERE slug = 'ui-graphics'
)
-- Insert UI Graphics resources
INSERT INTO public.resources (title, description, url, category_id, featured) 
SELECT 
  title,
  description,
  url,
  (SELECT id FROM ui_graphics_category),
  featured
FROM (VALUES
  ('SVG sine waves', 'Export perfect sine waves as SVG for your front-end projects', 'https://www.sinwaver.com/', false),
  ('UI Design Daily', 'Awesome UI Components of all types', 'https://uidesigndaily.com/', true),
  ('100 Daily UI', 'Free Figma library of products, elements, and screens', 'https://100dailyui.webflow.io/', false),
  ('Sketch App Sources', 'Sketch UIs, wireframes, icons and much more', 'https://www.sketchappsources.com/', false),
  ('Humaaans', 'Cool illustrations of people with the ability to mix and match', 'https://www.humaaans.com/', true),
  ('Paaatterns', 'Free collection of beautiful patterns for all vector formats', 'https://products.ls.graphics/paaatterns/', false),
  ('404 illustration', 'Free illustrations for 404 pages', 'https://error404.fun/', false),
  ('Drawkit.io', 'Illustrations for designers and startups', 'https://www.drawkit.io/', false),
  ('Absurd.design', 'Free surrealist illustrations for designers and developers', 'https://absurd.design/', false),
  ('Undraw.co', 'Open-source illustrations for any idea you can imagine and create', 'https://undraw.co/', true),
  ('Manypixels.co', 'Monochromatic, Isometric high-quality illustrations', 'https://www.manypixels.co/gallery/', false),
  ('Open Peeps', 'Hand drawn illustration library', 'https://www.openpeeps.com/', false),
  ('InvisionApp', 'Library of free, high-quality UI kits, icon packs, and mockups', 'https://www.invisionapp.com/inside-design/design-resources/', false),
  ('Open Doodles', 'A Free Set of Sketchy Illustrations', 'https://www.opendoodles.com/', false),
  ('Avataaars', 'Free sketch library of avatars illustrations by Pablo Stanley', 'https://avataaars.com/', false),
  ('Blush', 'Free customizable illustrations with Figma Plugin', 'https://blush.design/', false),
  ('Hero Patterns', 'A collection of repeatable SVG background patterns', 'http://www.heropatterns.com/', true),
  ('BEAUBUS Patterns', 'A set of 150+ free SVG patterns (backgrounds)', 'https://patterns.beaubus.com/', false),
  ('IRA Design', 'An open-source gradient illustrations collection by creative tim', 'https://iradesign.io/', false),
  ('Transparent Textures', 'A collection of transparent textures background patterns', 'https://www.transparenttextures.com/', false),
  ('icons8.com/illustrations', 'Vector illustrations to class up your project', 'https://icons8.com/illustrations', false),
  ('Patternico', 'Seamless Pattern Maker', 'https://patternico.com', false),
  ('Pixeltrue Illustrations', 'Free Animated Illustrations', 'https://www.pixeltrue.com/illustrations', false),
  ('Abstract User Avatar API', 'API to create simple yet flexible user avatars from user names or emails', 'https://www.abstractapi.com/user-avatar-api', false),
  ('sketchvalley', 'Download free PNG, SVG or AI file', 'https://sketchvalley.com/', false),
  ('PatternPad', 'Free and unlimited unique pattern designs', 'https://patternpad.com/', false),
  ('Dimensions', 'Ongoing reference database of dimensioned drawings documenting standard measurements and sizes', 'https://www.dimensions.com/', false),
  ('Freebiesbug', 'Hand-picked resources for web designers and developers, constantly updated', 'https://freebiesbug.com/', false),
  ('Flexiple', 'One new high-quality, open-source illustration each day', 'https://2.flexiple.com/scale/all-illustrations', false),
  ('Cool Text', 'FREE graphics generator for web pages and impressive logos without design work', 'https://cooltext.com/', false),
  ('illustration kit', 'Premium open source illustrations added daily', 'https://illustrationkit.com/', false),
  ('Doodad Pattern Generator', 'Create unique, seamless, royalty-free patterns', 'https://doodad.dev/pattern-generator/', false),
  ('Pattern Monster', 'A simple online pattern generator to create repeatable SVG patterns', 'https://pattern.monster/', false),
  ('Exemplar', 'Free Avatar Library for Figma and Sketch', 'https://themeselection.com/products/exemplar-free-avatar-library-for-figma-and-sketch/', false),
  ('UIBundle', 'Thousands of Free Design Resources like UI Kits, Mockups, Illustrations, Icons, Fonts, 3D assets', 'https://uibundle.com', false),
  ('openby.design', 'Custom crafted free UI design resources, for personal and commercial projects', 'http://openby.design/', false),
  ('Design Stripe', 'Create beautiful illustrations, no design skills needed', 'https://designstripe.com/catalog', false),
  ('HOLA SVG!', 'An SVG playground to share SVG stuff', 'https://holasvg.com/', false),
  ('symu.co', 'Free templates, UI kits, icon, PSD', 'https://symu.co/freebies/templates-4/', false),
  ('Mesh Gradient', 'Generate & download beautiful mesh gradients', 'https://meshgradient.in/', false),
  ('CSS Shadow Gradients', 'Generate CSS Gradients For Shadows', 'https://alvarotrigo.com/shadow-gradients/', false),
  ('Creatica', 'Generate unique beautiful and unique Backgrounds and patterns', 'https://creatica.app/backgrounds', false),
  ('Boring Avatars', 'SVG random, cutely avatars collections', 'https://boringavatars.com/', false),
  ('Html to Design', 'Convert any website into fully editable Figma designs', 'https://www.figma.com/community/plugin/1159123024924461424/html.to.design', false),
  ('fffuel', 'Collection of color tools and free SVG generators for gradients, patterns, textures, shapes & backgrounds', 'https://www.fffuel.co', true),
  ('Mesher', 'A Free tool to create beautiful mesh gradients only with CSS code', 'https://csshero.org/mesher', false)
) AS t(title, description, url, featured);
