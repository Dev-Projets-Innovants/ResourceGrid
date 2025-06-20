
-- Insert Svelte UI Libraries resources into the existing category
WITH svelte_ui_category AS (
  SELECT id FROM categories WHERE slug = 'svelte-ui-libraries'
)
INSERT INTO public.resources (title, description, url, category_id, featured) 
SELECT 
  title,
  description,
  url,
  (SELECT id FROM svelte_ui_category),
  featured
FROM (VALUES
  ('Svelte Material UI', 'UI library for Svelte based on Material Design', 'https://sveltematerialui.com/', true),
  ('SvelteStrap', 'UI library for Svelte based on the Bootstrap framework', 'https://bestguy.github.io/sveltestrap/', true),
  ('Svelte Flat UI', 'UI library for Svelte based on Flat Design', 'https://svelteui.js.org/', false),
  ('Attractions', 'A pretty cool UI kit for Svelte', 'https://illright.github.io/attractions/', false),
  ('Svelteit', 'A minimalistic UI/UX component library for Svelte and Sapper projects', 'https://docs.svelteit.dev', false),
  ('Carbon Components Svelte', 'A component library that implements the Carbon Design System, an open source design system by IBM', 'https://carbon-components-svelte.onrender.com/', true),
  ('Radix Svelte', 'This is a port of Radix UI for Svelte', 'https://www.radix-svelte.com/', true),
  ('shadcn-svelte', 'shadcn-svelte is an unofficial community-led Svelte port of shadcn/ui', 'https://www.shadcn-svelte.com/', true),
  ('Skeleton', 'Skeleton is an open source UI toolkit built with Svelte + Tailwind that allows you to create reactive web interfaces using Svelte + Tailwind CSS', 'https://www.skeleton.dev/', true),
  ('Aceternity UI Svelte', 'Free Incredible Animated Components', 'https://aceternity.sveltekit.io/', false),
  ('Svelte UX', 'Collection of Svelte components, actions, stores, and utilities to build highly interactive applications', 'https://svelte-ux.techniq.dev/', true),
  ('Flowbite-Svelte', 'Flowbite-svelte is an open-source UI component library built with Svelte components, Tailwind CSS utility classes and based on the Flowbite design system', 'https://flowbite-svelte.com/', true),
  ('bits-ui', 'The headless components for Svelte', 'https://www.bits-ui.com/', false),
  ('melt-ui', 'A set of headless, accessible component builders for Svelte', 'https://melt-ui.com', false)
) AS t(title, description, url, featured)
WHERE NOT EXISTS (
  SELECT 1 FROM resources WHERE title = t.title
);
