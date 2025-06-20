
-- Insert Downloadable Design Software resources into the existing category
WITH downloadable_design_software_category AS (
  SELECT id FROM categories WHERE slug = 'downloadable-design-software'
)
INSERT INTO public.resources (title, description, url, category_id, featured) 
SELECT 
  title,
  description,
  url,
  (SELECT id FROM downloadable_design_software_category),
  featured
FROM (VALUES
  ('Gimp', 'Free & open source image editor similar to Photoshop', 'https://www.gimp.org/', true),
  ('Gravit Designer', 'Free full-featured vector graphic design app that works on ALL platforms', 'https://www.designer.io/en/', false),
  ('Blender', 'Open source, free animation, 3D modeling, etc.', 'https://www.blender.org/download/', true),
  ('Raw Therapee', 'Cross-platform raw image processing program', 'https://rawtherapee.com/', false),
  ('Be Funky', 'Online design program', 'https://www.befunky.com/features/graphic-designer/', false),
  ('Krita', 'Sketching and painting program designed for digital artists', 'https://krita.org/en/download/krita-desktop/', true),
  ('Pencil Project', 'GUI prototyping software', 'https://pencil.evolus.vn/', false),
  ('Inkscape', 'Powerful free design tool', 'https://inkscape.org/', true),
  ('Adobe XD', 'Free design tool from Adobe', 'https://www.adobe.com/products/xd.html', true),
  ('Shapes.so', 'Icons that can be used as code in your projects', 'https://shape.so/pricing', false),
  ('Lunacy', 'Sketch for Windows', 'https://icons8.com/lunacy', false),
  ('InVision Studio', 'Free screen designing tool from InVision', 'https://www.invisionapp.com/studio', false),
  ('Darktable', 'Free & Open source photography workflow application and raw developer', 'https://www.darktable.org/', false),
  ('Inpixio photo Editor', 'Free Photo Editor: For windows only', 'https://www.inpixio.com/free-photo-editor', false),
  ('Colorpicker', 'Open Source colors software: Retrieve, manipulate and store your colors easily!', 'https://colorpicker.fr', false),
  ('Google Web Designer', 'Create engaging, interactive HTML5-based designs and motion graphics that can run on any device', 'https://webdesigner.withgoogle.com/', false),
  ('Origami Studio', 'Interactive interface design tool created by Facebook: For mac only', 'https://origami.design', false)
) AS t(title, description, url, featured)
WHERE NOT EXISTS (
  SELECT 1 FROM resources WHERE title = t.title
);
