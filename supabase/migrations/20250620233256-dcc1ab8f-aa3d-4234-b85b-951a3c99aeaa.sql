
-- Insert Online Design Tools resources into the existing category
WITH online_design_tools_category AS (
  SELECT id FROM categories WHERE slug = 'online-design-tools'
)
INSERT INTO public.resources (title, description, url, category_id, featured) 
SELECT 
  title,
  description,
  url,
  (SELECT id FROM online_design_tools_category),
  featured
FROM (VALUES
  ('Figma', 'Online graphic design tool (Free & paid options)', 'https://www.figma.com/graphic-design-tool/', true),
  ('Penpot', 'First Open Source design and prototyping platform meant for cross-domain teams. Web based and works with open web standards (SVG)', 'https://penpot.app/', true),
  ('Vectr', 'Free vector graphics software', 'https://vectr.com/', false),
  ('Taler', 'Create social media banner designs in minutes from hundreds of customizable templates', 'https://www.taler.app/', false),
  ('Canva', 'Create beautiful designs (Free & Paid)', 'https://www.canva.com/', true),
  ('Get Waves', 'A free SVG wave generator to make unique SVG waves for web design', 'https://getwaves.io/', false),
  ('Clippy', 'Easy CSS clip-path maker', 'https://bennettfeely.com/clippy/', false),
  ('Fancy Border Radius', 'Eight values specifying border-radius in CSS ( border-radius generator )', 'https://9elements.github.io/fancy-border-radius/full-control.html', false),
  ('Wireframe.cc', 'Wireframing tool (free & paid)', 'https://wireframe.cc/', false),
  ('Fotor', 'Photo editor and design maker', 'https://www.fotor.com/', false),
  ('Pixlr', 'Online photo editor', 'https://www.pixlr.com/', false),
  ('Animoto Video Maker', 'Make videos online', 'https://animoto.com/apps/online-video-maker', false),
  ('RemoveBG', 'Remove image backgrounds', 'https://www.remove.bg/', true),
  ('Photo Creator', 'Create your own photos instead of searching for stock', 'https://photos.icons8.com/creator', false),
  ('Visme', 'Create presentations, infographics and more', 'https://www.visme.co/', false),
  ('Infogram', 'Create infograms', 'https://infogram.com/', false),
  ('ChartGo', 'Create charts and graphs online', 'https://www.chartgo.com/', false),
  ('Cartoon Photo', 'Turn photos into cartoons', 'https://cartoon.pho.to/', false),
  ('Whimsical', 'Wireframes, diagrams and more (4 free)', 'https://whimsical.com/', true),
  ('Whiteboard', 'Online drawing tool', 'https://witeboard.com/', false),
  ('Octopus', 'Sitemap builder', 'https://octopus.do/', false),
  ('Onlineboard', 'Real-time shareable whiteboard for brainstorming', 'https://onlineboard.eu', false),
  ('CTA Button Maker', 'Create call to action buttons', 'https://www.clickminded.com/button-generator/', false),
  ('Blobmaker', 'Free generative design tool to help you quickly create random, unique, and organic-looking SVG shapes', 'https://www.blobmaker.app/', false),
  ('Personas', 'A playful avatar generator for the modern age', 'https://personas.draftbit.com/', false),
  ('Photopea', 'An Online Photoshop editor', 'https://www.photopea.com', true),
  ('Excalidraw', 'Virtual whiteboard for sketching hand-drawn like diagrams', 'https://excalidraw.com/', true),
  ('Diagrams', 'Diagram software and Flowchart maker', 'https://www.diagrams.net/', false),
  ('Mermaid', 'Renders Markdown-inspired text definitions to create and modify diagrams dynamically. (FOSS)', 'https://github.com/mermaid-js/mermaid', false),
  ('MapInSeconds', 'Simple way to visualize your data with a map', 'http://mapinseconds.com/', false),
  ('Grid Malven', 'A css grid cheatsheet to reference when creating a css grid', 'http://grid.malven.co/', false),
  ('Flex Malven', 'A flexbox grid cheatsheet to reference when working with flexbox', 'http://flexbox.malven.co/', false),
  ('Smart Upscaler', 'Upscale images by 2-4x resolution (4 free)', 'https://icons8.com/upscaler', false),
  ('GetAvataaars', 'Fun and Colorful free avatars web generator tool by Fang-Pen Lin using Pablo Stanley sketch library', 'https://getavataaars.com/', false),
  ('Big Heads', 'Easily generate avatars for your projects with Big Heads by Robert Broersma', 'https://github.com/RobertBroersma/bigheads', false),
  ('Webflow', 'Break the code barrier, Build better business websites, faster. Without coding', 'https://webflow.com/', true),
  ('Trace', 'Instantly remove the background from your photos', 'https://stickermule.com/trace', false),
  ('Neumorphism.io', 'Generate Soft-UI CSS shadow code', 'https://neumorphism.io/#55b9f3', false),
  ('DB Designer', 'Design your database for free online', 'https://app.dbdesigner.net/', false),
  ('Ui Bakery', 'Create full-fledged web apps visually', 'https://uibakery.io/', false),
  ('Faux', 'Turn real code into faux code', 'http://knutsynstad.com/fauxcode/', false),
  ('Rive', 'Real-time interactive design tool that allows you to design, animate, and immediately integrate your assets into any platform', 'https://rive.app/', false),
  ('Unscreen', 'Remove Video Background 100% Automatically and Free', 'https://www.unscreen.com/', false),
  ('Kodeshot', 'Convert your source code into nice pictures for your articles, tweets, messages, posts...', 'https://www.kodeshot.net/', false),
  ('Wix', 'Create a Website You''re Proud Of', 'https://www.wix.com/', false),
  ('GTmetrix', 'Website Speed and Performance Optimization', 'https://gtmetrix.com/', false),
  ('Yellow Lab Tools', 'Online test to help speeding up heavy web pages', 'https://yellowlab.tools/', false),
  ('Framer', 'Is prototyping tool for teams', 'https://www.framer.com/', true),
  ('Draw.io', 'Free online diagram editor tool', 'https://www.draw.io/', false),
  ('UXWing SVG Editor', 'Creating and Edit SVG Online', 'https://uxwing.com/svg-icon-editor', false),
  ('CSS Arrow', 'Create and export CSS code for a custom box with an arrow extending out from the side. Great for tooltips, flyouts and the like', 'http://www.cssarrowplease.com/', false),
  ('Lucidchart', 'Diagramming and visualization tools that allows creating databases, flowcharts, boards, floor-maps, and much more. 3 multi-page documents on the free tier', 'https://www.lucidchart.com/pages/', false),
  ('Carbon', 'Create and share beautiful images of your source code by typing or drop a file', 'https://carbon.now.sh', true),
  ('PixCleaner', 'Accurate and hassle free background removal tool', 'https://www.pixcleaner.com/', false),
  ('Glass UI', 'A modern CSS UI library based on the glassmorphism design principles that will help you quickly design and build beautiful websites and applications', 'https://ui.glass/generator', false),
  ('Glassmorphism', 'An incredible online tool for generating quick glassmorphic UI in CSS code snippets', 'https://glassmorphism.com/', false),
  ('TableConvert', 'Table Convert Online is a web-based tool to converts Excel, URL, HTML, Markdown table and CSV to Markdown table, CSV/TSV, JSON, XML, YAML, insert SQL, HTML, Excel and LaTeX table', 'https://tableconvert.com/', false),
  ('Doodle Ipsum', 'The lorem ipsum of illustrations. Just customize your doodles, grab the code, and use them on your web prototypes, landing pages, or no-code tools', 'https://doodleipsum.com/', false),
  ('Figen', 'Post Cover & Background Generator Tool', 'https://figen.cc/', false),
  ('Windframe', 'A tool to rapidly prototype and build stunning websites using Tailwind CSS (Free & Premium)', 'https://www.devwares.com/windframe/', false),
  ('Slickr', 'A tool for designing cover image for your blog', 'https://slickr.vercel.app/', false),
  ('Shadow Palette Generator', 'Create a set of lush, realistic CSS shadows', 'https://www.joshwcomeau.com/shadow-palette/', false),
  ('Ray.so', 'Online tool to create beautiful images of your code', 'https://ray.so/', false),
  ('Codepng', 'Convert your source code into awesome shareable images', 'https://www.codepng.app/', false),
  ('CSS Grid Generator', 'A tool for creating CSS Grid Layouts', 'https://grid.layoutit.com/', false),
  ('JSONT', 'A simple and powerful online JSON formatting tool', 'https://www.jsont.run/', false),
  ('Jitter', 'Online tool to create motion graphics/design', 'https://jitter.video/', false),
  ('Visily', 'Tool that empowers *non-designers* to design web and mobile app mockups', 'https://www.visily.ai', false),
  ('okso.app', 'The drawing app with a nested "drawing-inside-the-drawing" structure', 'https://okso.app', false),
  ('Calc Generator', 'Tool for easily creating precise Calc() CSS functions', 'https://fpece.com/calc-generator', false),
  ('Scrollbar.app', 'Simple online editor for creating custom CSS scrollbars', 'https://scrollbar.app', false),
  ('GrapesJS', 'Open-source, multi-purpose, Web Builder Framework which combines different tools and features with the goal to help you build HTML templates without any knowledge of coding', 'https://grapesjs.com/', false)
) AS t(title, description, url, featured)
WHERE NOT EXISTS (
  SELECT 1 FROM resources WHERE title = t.title
);
