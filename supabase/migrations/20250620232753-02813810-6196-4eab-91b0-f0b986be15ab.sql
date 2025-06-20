
-- Insert Angular UI Libraries resources into the existing category
WITH angular_ui_category AS (
  SELECT id FROM categories WHERE slug = 'angular-ui-libraries'
)
INSERT INTO public.resources (title, description, url, category_id, featured) 
SELECT 
  title,
  description,
  url,
  (SELECT id FROM angular_ui_category),
  featured
FROM (VALUES
  ('Material Angular', 'UI library for Angular based on Material design', 'https://material.angular.io/', true),
  ('NG Bootstrap', 'UI library for Angular based on the Bootstrap framework', 'https://ng-bootstrap.github.io/#/home', true),
  ('PrimeNG', 'Powerful UI component library for Angular', 'https://www.primefaces.org/primeng/#/', true),
  ('Onsen Angular', 'Hybrid mobile and PWA UI library for Angular and Onsen UI', 'https://onsen.io/angular2/', false),
  ('NG Lightning', 'Native Angular components & directives for Lightning Design System', 'https://ng-lightning.github.io/ng-lightning/#/', false),
  ('NG Semantic', 'UI library for Angular based on Semantic UI', 'https://github.com/vladotesanovic/ngSemantic', false),
  ('Nebular', 'Customizable UI Kit, Auth & Security for Angular', 'https://akveo.github.io/nebular/', true),
  ('Alyle UI', 'Minimal components set for Angular', 'https://alyle.io/', false),
  ('NGX Bootstrap', 'Another UI library for Angular based on the Bootstrap framework', 'https://valor-software.com/ngx-bootstrap/#/', true),
  ('NG Zorro', 'UI library for Angular based on Ant Design', 'https://ng.ant.design/', true),
  ('Pagination for datatables', 'npm library for pagination', 'https://www.npmjs.com/package/ngx-pagination', false),
  ('Multi select dropdown', 'For multi select drop-dowm in forms', 'https://www.npmjs.com/package/ng-multiselect-dropdown', false),
  ('NG Particles', 'A lightweight Angular component for creating particles', 'https://particles.matteobruni.it/', false),
  ('Covalent UI', 'Angular UI Platform focused on solving common enterprise needs', 'https://teradata.github.io/covalent/v3/#/', false),
  ('Clarity', 'CSS based Angular UI framework developed by VMware group', 'https://clarity.design/', true),
  ('Taiga UI', 'Taiga UI is fully-treeshakable Angular UI Kit consisting of multiple base libraries and several add-ons', 'https://taiga-ui.dev/', true),
  ('ngx-admin', 'Admin template based on Angular 10+ and Nebular', 'https://akveo.github.io/ngx-admin/', false),
  ('spartan', 'Cutting-edge tools powering Angular full-stack development', 'https://www.spartan.ng/', false)
) AS t(title, description, url, featured)
WHERE NOT EXISTS (
  SELECT 1 FROM resources WHERE title = t.title
);
