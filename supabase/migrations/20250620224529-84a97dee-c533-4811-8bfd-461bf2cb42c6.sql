
-- Insert only the font resources into the existing Fonts category
WITH fonts_category AS (
  SELECT id FROM categories WHERE slug = 'fonts'
)
INSERT INTO public.resources (title, description, url, category_id, featured) 
SELECT 
  title,
  description,
  url,
  (SELECT id FROM fonts_category),
  featured
FROM (VALUES
  ('Google Fonts', 'Library of around 1000 free licensed font families', 'https://fonts.google.com/', true),
  ('DaFont', 'Archive of freely downloadable fonts', 'https://www.dafont.com/', false),
  ('Use & Modify', 'Personal selection of beautiful, classy, punk, professional, incomplete, weird typefaces', 'https://usemodify.com/', false),
  ('1001 Free Fonts', 'I think the name speaks for itself', 'https://www.1001freefonts.com/', false),
  ('Font Squirrel', 'Font Squirrel scours the internet for high quality, legitimately free fonts', 'https://www.fontsquirrel.com/', true),
  ('Font Fabric', 'A digital type foundry crafting retail fonts and custom typography for various brands', 'https://www.fontfabric.com/free-fonts/', false),
  ('Just Free Fonts', 'A hand-curated collection of freeware, open-source, and public domain fonts intended for commercial use', 'https://justfreefonts.com/', false),
  ('Tiff', 'A type diff tool that visually contrasts the differences between two fonts', 'https://winniethemu.github.io/tiff/', false),
  ('TypeKit Practice', 'Learn about typography practices', 'https://practice.typekit.com/', false),
  ('Fontjoy', 'Generate font pairing in one click', 'https://fontjoy.com/', true),
  ('Golden Ratio', 'Golden Ratio Typography Calculator', 'https://grtcalculator.com/', false),
  ('FontGet', 'Has a variety of fonts available to download and sorted neatly with tags', 'https://www.fontget.com/', false),
  ('FontPair', 'Helps you pair Google Fonts together', 'https://fontpair.co/', true),
  ('Font Space', 'A designer-centered free font website that has quick customizable previews', 'https://www.fontspace.com/', false),
  ('Abstract Fonts', 'Fonts free for personal and commercial use', 'http://www.abstractfonts.com/', false),
  ('Free Typography', 'A list of high quality fonts', 'https://freetypography.com/', false),
  ('Leon Sans', 'A geometric sans-serif typeface made with code', 'https://github.com/cmiscm/leonsans/', false),
  ('Lexend', 'A variable font empirically shown to significantly improve reading-proficiency', 'https://www.lexend.com/', false),
  ('Fonts for Apple Platforms', 'Get the details, frameworks, and tools you need to use system fonts for Apple platforms in your apps', 'https://developer.apple.com/fonts/', false),
  ('SFWin', 'San Francisco Fonts for Windows 10 and non-Apple Platform', 'https://github.com/blaisck/sfwin/', false),
  ('Font Flipper', 'Preview 800+ Google Fonts on top of your own designs, without having to download the fonts', 'https://fontflipper.com/', false),
  ('Fonts Arena', 'Free curated fonts', 'https://fontsarena.com/', false),
  ('Befonts', 'High quality fonts for free', 'https://befonts.com/', false),
  ('Arabic fonts', 'Arabic fonts for free', 'https://arabicfonts.net/', false),
  ('FontDrop', 'Simple and easy way to view the contents of font files', 'https://fontdrop.info/', false),
  ('Open Foundry', 'FREE platform for curated open-source typefaces', 'https://open-foundry.com/', false),
  ('Glyphter', 'Upload your own SVGS and turn them into font files. Useful if you want a smaller library loaded', 'https://glyphter.com/', false),
  ('Google Webfonts Helper', 'A Hassle-Free Way to Self-Host Google Fonts', 'https://google-webfonts-helper.herokuapp.com/fonts/', false),
  ('Rough Font Awesome', 'When RoughJS meets Font Awesome', 'https://djamshed.github.io/rough-awesome-font/dist/', false),
  ('FFonts', 'Stylish fonts for free', 'https://ffonts.net/', false),
  ('Malayalam Fonts', 'Malayalam fonts for free which are maintained by Swathanthra Malayalam Computing(SMC)', 'https://smc.org.in/fonts/', false),
  ('Dev Fonts', 'Find and use the coding fonts for free', 'https://devfonts.gafi.dev/', false),
  ('Font M', 'Free font you can download for material coding and design', 'https://fontm.com/', false),
  ('W Fonts', 'Download Free fonts', 'https://www.wfonts.com/', false),
  ('Modern fluid typography editor', 'Fluid typography is a modern way of approaching responsive typography', 'https://modern-fluid-typography.vercel.app/', false),
  ('UrbanFonts', 'A collection of over 8000 free fonts and dingbats', 'https://www.urbanfonts.com/', false),
  ('Typespiration', 'Inspirational font combinations and color palettes', 'https://typespiration.com/', false),
  ('Fontsource', 'Self-host Open Source fonts in neatly bundled NPM packages', 'https://fontsource.org/', true),
  ('FontBolt', 'Discover and generate your favorite fonts from pop culture', 'https://www.fontbolt.com/', false),
  ('Fontshare', 'Fontshare is a free fonts service from the Indian Type Foundry (ITF), making quality fonts accessible to all', 'https://www.fontshare.com/', true)
) AS t(title, description, url, featured)
WHERE NOT EXISTS (
  SELECT 1 FROM resources WHERE title = t.title
);
