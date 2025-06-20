
-- Insert Design Systems & Style Guides resources into the existing category
WITH design_systems_category AS (
  SELECT id FROM categories WHERE slug = 'design-systems-style-guides'
)
INSERT INTO public.resources (title, description, url, category_id, featured) 
SELECT 
  title,
  description,
  url,
  (SELECT id FROM design_systems_category),
  featured
FROM (VALUES
  ('Material Design', 'Google''s Material Design', 'https://material.io/', true),
  ('Ant Design', 'Design system for enterprise-level products', 'https://ant.design/', true),
  ('Apple Design Resources', 'Guides and templates for using Apple design and UI', 'https://developer.apple.com/design/resources/', true),
  ('Primer', 'Design, build, and create with GitHub''s design system', 'https://primer.style/', true),
  ('Arco.design', 'An enterprise-level design system jointly launched by the Bytedance GIP UED team and the architecture front-end team', 'https://arco.design/en-US', false),
  ('Alta UI', 'Oracle''s design system and toolkit', 'https://www.oracle.com/webfolder/ux/middleware/alta/index.html', false),
  ('Pulse', 'Design system, guides and React component library', 'https://pulse.heartbeat.ua/', false),
  ('Bolt', 'Robust Twig and web component powered UI components', 'https://boltdesignsystem.com/', false),
  ('Clarity Design System', 'UX guidelines, HTML/CSS framework, and Angular components', 'https://clarity.design/', false),
  ('AtlasKit', 'Atlassian''s official UI library, built according to the Atlassian Design Guidelines', 'https://atlaskit.atlassian.com/', true),
  ('Audi Design Resources', 'Audi UI design system and toolkit', 'https://www.audi.com/ci/en/guides/user-interface/introduction.html', false),
  ('Carbon Design Systems', 'Carbon is IBM''s open-source design system for products and experiences', 'https://www.carbondesignsystem.com/', true),
  ('Yelp Style Guide', 'Yelp style guide, components and toolkit', 'https://www.yelp.com/styleguide', false),
  ('Comet', 'Scalable design system of visual language, components, and design assets', 'https://comet.discoveryeducation.com/', false),
  ('ETrade Design System', 'Guides and toolkits that blend finance with simplicity and ease of use', 'https://etrade.design/', false),
  ('Fundamental Library', 'Open source and community driven project for consistent user interfaces', 'https://sap.github.io/fundamental-styles/', false),
  ('Infor Design', 'Guidelines and resources to create meaningful experiences for Infor''s products', 'https://design.infor.com/', false),
  ('Lexicon', 'An experience language for crafting beautiful UI', 'https://liferay.design/lexicon/', false),
  ('Mailchimp UI/UX', 'Style guide and components from Mailchimp', 'https://ux.mailchimp.com/patterns/color', false),
  ('Marvel Style Guide', 'Set of design principles and components', 'https://marvelapp.com/styleguide/overview/introduction', false),
  ('Microsoft Fluent UI', 'Collection of UX frameworks from Microsoft', 'https://developer.microsoft.com/en-us/fluentui#/', true),
  ('Pluralsight Design System', 'Design guide with components for designing with Pluralsight', 'https://design-system.pluralsight.com/', false),
  ('Polaris', 'Design system that creates great experiences for all of Shopify''s merchants', 'https://polaris.shopify.com/', true),
  ('Mozilla Protocol', 'Protocol is a design system for Mozilla and Firefox websites', 'https://protocol.mozilla.org/', false),
  ('SendGrid Style Guide', 'UI library for developing consistent UI/UX at SendGrid', 'http://styleguide.sendgrid.com/', false),
  ('VTEX Styleguide', 'Reusable patterns, components and assets related to product design in VTEX', 'https://styleguide.vtex.com/', false),
  ('Rizzo', 'Style guide with UI components, JS components, widgets, etc', 'https://rizzo.lonelyplanet.com/styleguide/design-elements', false),
  ('Atomize', 'UI framework that helps developers collaborate with designers and build consistent user interfaces effortlessly', 'https://atomizecode.com/', false),
  ('StyleGuides.io', 'A directory of 500+ styleguides', 'http://styleguides.io/', false),
  ('Done Design System', 'Open source design system, guides & components', 'https://uilibrary.github.io/done-design-system/', false),
  ('Skoda Brand System', 'Design guideline for developing applications under the Skoda brand', 'https://skoda-brand.com/explore-our-brand', false),
  ('Spectrum', 'Adobe''s design system that provides components and tools to help product teams work more efficiently, and to make Adobe''s applications more cohesive', 'https://spectrum.adobe.com/', true),
  ('Asphalt', 'Gojek''s design language system. A collection of guidelines and components to create amazing user experiences', 'https://asphalt.gojek.io/', false),
  ('Laws of UX', 'A collection of the key maxims that designers must consider when building user interfaces', 'https://lawsofux.com/', true),
  ('Checklist Design', 'Checklist Design is a curated list of checklists ranging from website pages, to UI components, all the way to branding assets', 'https://www.checklist.design/', false),
  ('Humane By Design', 'A resource that provides guidance for designing ethically humane digital products through patterns focused on user well-being', 'https://humanebydesign.com/', false),
  ('Pr1mer Guidelines', 'An open source set of very general guidelines, inspired by Human Interface. Created and maintained by Pr1mer Tech', 'https://guidelines.pr1mer.tech', false),
  ('Patterfly', 'PatternFly is an open source design system from Red Hat, Inc.', 'https://www.patternfly.org/', false),
  ('Patterns', 'A resource to improve on design patterns and component patterns for building powerful web apps with vanilla JavaScript and React', 'https://www.patterns.dev', false),
  ('Design Principles For Developers', 'A resource to improve Design principles and guidelines for developers', 'https://medium.com/design-bootcamp/the-ultimate-design-principles-guide-for-developers-d4aa58937283', false)
) AS t(title, description, url, featured)
WHERE NOT EXISTS (
  SELECT 1 FROM resources WHERE title = t.title
);
