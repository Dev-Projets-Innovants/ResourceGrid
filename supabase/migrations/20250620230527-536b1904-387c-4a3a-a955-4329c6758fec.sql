
-- Insert HTML & CSS template resources into the existing HTML & CSS Templates category
WITH templates_category AS (
  SELECT id FROM categories WHERE slug = 'html-css-templates'
)
INSERT INTO public.resources (title, description, url, category_id, featured) 
SELECT 
  title,
  description,
  url,
  (SELECT id FROM templates_category),
  featured
FROM (VALUES
  ('HTML5Up', 'Very modern, unique responsive HTML5/CSS3 themes', 'https://html5up.net/', true),
  ('Templatemo', 'Minimal, resume, gallery themes and more', 'https://templatemo.com/', true),
  ('FreeHTML5', 'Free & premium HTML5 and Bootstrap themes', 'https://freehtml5.co/', false),
  ('StyleShout', 'Brilliantly crafted free website templates', 'https://www.styleshout.com/free-templates/', true),
  ('Start Bootstrap', 'Bootstrap starter themes', 'https://startbootstrap.com/', true),
  ('ThemeWagon', 'Collection of HTML5 Bootstrap templates from different categories', 'https://themewagon.com/theme-price/free/', false),
  ('Colorlib', 'Almost any category of theme you can think of', 'https://colorlib.com/wp/templates/', true),
  ('Free CSS', 'Huge collection of free templates', 'https://www.free-css.com/free-css-templates', true),
  ('Hubspot', 'Templates, infographics, banners and much more', 'https://www.hubspot.com/resources', false),
  ('Mobirise', 'Great looking HTML5/CSS3 templates', 'https://mobirise.com/html-templates/', false),
  ('Bootswatch', 'Free themes for Bootstrap', 'https://bootswatch.com/', true),
  ('Onepagelove', 'One-page websites, templates and resources', 'https://onepagelove.com/', false),
  ('Themes For App', 'Free Bootstrap themes and landing pages', 'https://themesfor.app/', false),
  ('BootstrapTaste', 'Premium & Free Bootstrap Templates', 'https://bootstraptaste.com/', false),
  ('BootstrapMade', 'Elegant, clean and beautiful free templates using Bootstrap', 'https://bootstrapmade.com/', true),
  ('W3Layouts', 'W3Layouts: 3784+ Free Website Templates for 2020', 'https://w3layouts.com/', false),
  ('Tooplate', 'Tooplate: Free HTML Templates for everyone!', 'https://www.tooplate.com/', false),
  ('Cruip', 'Fully coded HTML templates to help you easily build your startup landing page without hassles', 'https://cruip.com/free-templates/', false),
  ('UIdeck', 'Free Landing Page Templates and Bootstrap Themes', 'https://uideck.com/', false),
  ('Splawr', 'Free web templates to kickstart your idea!', 'https://splawr.com/', false),
  ('W3css_templates', 'Some responsive W3.CSS website templates for you to use', 'https://www.w3schools.com/w3css/w3css_templates.asp', false),
  ('All-Free-Download', 'Download free-website-templates', 'https://all-free-download.com/free-website-templates/free-html-css-templates.html', false),
  ('mashup-template', 'HTML5/CSS3 Free Templates', 'http://www.mashup-template.com/templates.html', false),
  ('Sneat Bootstrap 5 HTML Admin Template', 'Open-source & Easy to us Bootstrap 5 HTML Admin Template with Elegant Design & Unique Layout', 'https://github.com/themeselection/sneat-html-admin-template-free', false),
  ('HTMLrev', 'Free beautiful HTML5 templates and landing pages', 'https://htmlrev.com', false),
  ('Horizon UI', 'Trendiest open source Admin Template for React', 'https://horizon-ui.com/', false),
  ('KeenThemes', 'Free and Pro Html/Css3, Bootstrap5, Vue, React, Laravel templates', 'https://keenthemes.com/', false),
  ('ScrewFast', 'Open-source Astro website template with sleek, customizable TailwindCSS components', 'https://github.com/mearashadowfax/ScrewFast', false)
) AS t(title, description, url, featured)
WHERE NOT EXISTS (
  SELECT 1 FROM resources WHERE title = t.title
);
