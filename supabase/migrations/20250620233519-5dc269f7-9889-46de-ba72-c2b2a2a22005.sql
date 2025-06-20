
-- Insert Design Inspiration resources into the existing category
WITH design_inspiration_category AS (
  SELECT id FROM categories WHERE slug = 'design-inspiration'
)
INSERT INTO public.resources (title, description, url, category_id, featured) 
SELECT 
  title,
  description,
  url,
  (SELECT id FROM design_inspiration_category),
  featured
FROM (VALUES
  ('Websitevice', 'A curated gallery of professional website designs to inspire developers and designers seeking creative ideas and best practices', 'https://websitevice.com/', false),
  ('CSS Zen Garden', 'Demonstrating the power of CSS, over 200 CSS-only interpretations of the same HTML file', 'http://csszengarden.com/', true),
  ('Behance', 'Design projects featured by different creators', 'https://www.behance.net/', true),
  ('Dribbble', 'Design projects featured by different creators', 'https://dribbble.com/', true),
  ('Landingfolio', 'Landingfolio features the best landing page inspiration, templates, resources and examples on the web', 'https://landingfolio.com/', true),
  ('Foxyapps', 'Design inspiration from the best mobile app designs', 'https://foxyapps.co/', false),
  ('Httpster', 'Showcases websites made by people from all over the world', 'https://httpster.net/2020/apr/', false),
  ('Land Book', 'Displays a large collection of websites to help find inspiration', 'https://land-book.com/', false),
  ('Frontend Mentor', 'Real-world UI Challenges using HTML, CSS and Javascript', 'https://www.frontendmentor.io/', true),
  ('Awwwards', 'A website that rate and collects the best websites in the world in UI', 'https://www.awwwards.com/', true),
  ('Codrops', 'A website that collects the best UI ideas and patterns and make tutorials of it', 'https://tympanus.net/codrops/', true),
  ('SaaS Landing Page', 'Discover the best landing page examples created by top-class SaaS companies', 'https://saaslandingpage.com/', false),
  ('Saaspages.xyz', 'A collection of the best landing pages with a focus on copywriting and design', 'https://saaspages.xyz', false),
  ('Screenlane', 'Screenlane is a website and newsletter that features the latest web and mobile design inspiration', 'https://screenlane.com', false),
  ('lapa ninja', 'Best landing page inspiration', 'https://www.lapa.ninja/', false),
  ('Freefrontend', 'Free frontend design from css html and javascript. latest work some design part', 'https://freefrontend.com/', false),
  ('Webframe', 'Discover and be inspired by beautiful webapp designs', 'https://webframe.xyz', false),
  ('Collect UI', 'Daily inspiration collected from daily ui archive and beyond. Handpicked, and updating daily', 'http://collectui.com/', false),
  ('Graphic Burger', 'A site offering a free and pain icons, mock-ups, Ui-Kits, text effect and backgrounds. This site''s resource are a mix of free and paid resources', 'https://graphicburger.com/', false),
  ('Really Good Emails', 'A site offering users a ton of company e-mails from customer service to marketing', 'https://reallygoodemails.com/', false),
  ('Free Design Resource', 'A site offering fonts, mockups, templates graphics and ui kits', 'https://freedesignresources.net/', false),
  ('Site Inspire', 'siteInspire is a showcase of the finest web and interactive design', 'https://www.siteinspire.com/', false),
  ('Web Design Inspiration', 'A site for web design inspiration, updated daily', 'https://www.webdesign-inspiration.com/', false),
  ('NavNav', 'Responsive navigation examples', 'https://navnav.co/', false),
  ('Calltoidea', 'Collection of different web Components for inspiration', 'https://www.calltoidea.com/', false),
  ('Mulzli Search', 'Search engine for design inspiration', 'https://search.muz.li', false),
  ('DeviantArt', 'Access to 370 million pieces of art for inspiration', 'https://www.deviantart.com/', false),
  ('Design your way', 'Collection of different Web and Mobile Designs', 'https://www.designyourway.net/blog/web-and-mobile-design/', false),
  ('SiteSee', 'A curated gallery of beautiful and modern websites', 'https://sitesee.co/', false),
  ('UI Garage', 'Daily handpicked UI inspiration & patterns', 'https://uigarage.net/', false),
  ('ecomm.design', 'eCommerce Website Design Gallery & Tech Inspiration', 'https://ecomm.design/', false),
  ('Design Nominees', 'A showcase of awarding and showcasing the best websites, apps and Games', 'https://www.designnominees.com/', false),
  ('Design Vault', 'A library of screenshots and patterns from real world digital products', 'https://designvault.io/', false),
  ('CSS buttons', '84 Beautiful CSS buttons examples', 'https://getcssscan.com/css-buttons-examples', false),
  ('CSS box-shadow', '91 Beautiful CSS box-shadow examples', 'https://getcssscan.com/css-box-shadow-examples', false),
  ('Super Designer', 'Design tools that give you super powers', 'https://superdesigner.co', false),
  ('Landings', 'Find the best landing pages for your design inspiration based on your preference', 'https://landings.dev', false),
  ('Page Collective', 'Page Collective is part of a network of design inspiration websites', 'https://pagecollective.com/', false),
  ('Curated', 'Unleash your creativity with out-of-this-world web design inspiration from across the web', 'https://www.curated.design/', false),
  ('Maxibestofone', 'Daily feed of websites & fonts inspiration', 'https://maxibestof.one/', false),
  ('Bento Grids', 'Bento Grids is a curated collection of tiles-based layouts that were popularized by Apple with their summary slides', 'https://bentogrids.com/', false),
  ('Landing Gallery', 'Home of the best landing page design inspiration', 'https://www.landing.gallery/', false),
  ('a-fresh.website', 'Hand—picked website and component inspiration library', 'https://a-fresh.website', false),
  ('bestwebdesigntools', 'Discover latest design tools, agencies and landing pages templates across web', 'https://www.bestwebdesigntools.com/', false),
  ('App Motion', 'Explore the best, hand-picked app motion design', 'https://appmotion.design/', false),
  ('Uiland Design', 'Home of the best mobile ui inspirations from top companies in the world', 'https://uiland.design/', false)
) AS t(title, description, url, featured)
WHERE NOT EXISTS (
  SELECT 1 FROM resources WHERE title = t.title
);
