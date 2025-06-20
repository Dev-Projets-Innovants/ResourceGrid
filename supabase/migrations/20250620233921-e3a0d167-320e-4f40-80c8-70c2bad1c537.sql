
-- Insert AI Graphic Design Tools resources into the existing category
WITH ai_graphic_design_category AS (
  SELECT id FROM categories WHERE slug = 'ai-graphic-design-tools'
)
INSERT INTO public.resources (title, description, url, category_id, featured) 
SELECT 
  title,
  description,
  url,
  (SELECT id FROM ai_graphic_design_category),
  featured
FROM (VALUES
  ('Leonardo.Ai', 'Leonardo AI is an AI-powered design tool that can help you create designs based on reference images', 'https://leonardo.ai/', true),
  ('Galileo AI', 'Galileo AI is a UI generation platform for easy and fast design ideation. It allows users to generate interface designs from text', 'https://www.usegalileo.ai/', true),
  ('ImgGen.Ai', 'ImgGen AI is a free AI-powered image generator and enhancement tool', 'https://imggen.ai/', true),
  ('Unblurimage.Ai', 'Unblurimage AI is 100% Free, No Sign-Up online tool for unblur image', 'https://unblurimage.ai/', false),
  ('VMind', 'VMind is an intelligent visualization suit that provides intelligent interfaces through rule algorithms, machine learning, and LLM', 'https://visactor.io/vmind', false),
  ('Free AI Diagram Generator', 'A free AI-powered platform that helps you create various types of diagrams with ease', 'https://diagram-generator.com/', true)
) AS t(title, description, url, featured)
WHERE NOT EXISTS (
  SELECT 1 FROM resources WHERE title = t.title
);
