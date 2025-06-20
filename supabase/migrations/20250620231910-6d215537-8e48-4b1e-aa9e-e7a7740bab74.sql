
-- Insert JavaScript chart library resources into the existing JavaScript Chart Libraries category
WITH js_charts_category AS (
  SELECT id FROM categories WHERE slug = 'javascript-chart-libraries'
)
INSERT INTO public.resources (title, description, url, category_id, featured) 
SELECT 
  title,
  description,
  url,
  (SELECT id FROM js_charts_category),
  featured
FROM (VALUES
  ('ChartJS', 'Simple yet flexible JavaScript charting for designers & developers', 'https://www.chartjs.org/', true),
  ('FrappeJS', 'Includes Green squares grid like in GitHub, and other charts to use', 'https://frappe.io/charts', false),
  ('G2Plot', 'G2Plot is an interactive and responsive charting library based on the grammar of graphics', 'https://g2plot.antv.vision/en', false),
  ('Google Charts', 'Get the experience from Google to create similar charts that Google uses', 'https://developers.google.com/chart/', true),
  ('Data Driven Documents (D3)', 'Bind complicated and massive data to interactive graphs', 'https://d3js.org/', true),
  ('ApexCharts.Js', 'Modern & Interactive Open-source Charts', 'https://apexcharts.com/', true),
  ('Chartist', 'Simple responsive charts', 'http://gionkunz.github.io/chartist-js/index.html', false),
  ('Vizzu', 'Vizzu - a free, open-source Javascript library for building animated charts, data stories, and interactive explorers', 'https://lib.vizzuhq.com/0.3.0/', false),
  ('AntV', 'Ant Design Charts, free JS Charts library for dynamic data with excellent documentation', 'https://ant-design-charts.antgroup.com/en/', true),
  ('Nivo', 'Nivo provides supercharged React components to easily build dataviz apps, it''s built on top of d3. Also comes with server side rendering ability and fully declarative charts', 'https://nivo.rocks/', true),
  ('Echarts', 'An Open Source JavaScript Visualization Library with declarative syntax for Rapid Construction of Web-based Visualization', 'https://echarts.apache.org/en/index.html', true),
  ('VChart', 'VChart is not only a multi-terminal chart library that can be used out of the box, but also a vivid and flexible data storyteller', 'https://visactor.io/vchart', false),
  ('VTable', 'VTable is a high-performance multidimensional analysis component developed based on Canvas. When compared with traditional DOM table components, VTable primarily addresses rendering and interaction performance issues in the context of large amounts of data', 'https://visactor.io/vtable', false),
  ('VStory', 'VStory is a feature-rich narrative system that can use VisActor''s VChart and VTable, combined with built-in components, to create visual works', 'https://visactor.io/vstory', false)
) AS t(title, description, url, featured)
WHERE NOT EXISTS (
  SELECT 1 FROM resources WHERE title = t.title
);
