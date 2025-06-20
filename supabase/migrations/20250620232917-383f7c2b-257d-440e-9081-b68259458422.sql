
-- Insert React Native UI Libraries resources into the existing category
WITH react_native_ui_category AS (
  SELECT id FROM categories WHERE slug = 'react-native-ui-libraries'
)
INSERT INTO public.resources (title, description, url, category_id, featured) 
SELECT 
  title,
  description,
  url,
  (SELECT id FROM react_native_ui_category),
  featured
FROM (VALUES
  ('Magnus UI', 'Magnus UI is the ultimate UI framework that helps you in building consistent user interfaces effortlessly in react native', 'https://magnus-ui.com/', false),
  ('React Native UI Lib', 'React Native UI (RNUI) is a UI Toolset & Components Library for React Native from Wix', 'https://wix.github.io/react-native-ui-lib/', true),
  ('React Native Paper', 'React Native Paper is a high-quality, standard-compliant Material Design library that has you covered in all major use-cases', 'https://reactnativepaper.com/', true),
  ('UI Kitten', 'UI Kitten is React Native framework for creating stunning cross-platform mobile applications. Design system based, brings your product from MVP to enterprise', 'https://akveo.github.io/react-native-ui-kitten/', true),
  ('React Native Elements', 'Cross Platform React Native UI Toolkit that provides an all-in-one UI kit for creating apps in react native', 'https://reactnativeelements.com/', true),
  ('NativeBase', 'Essential cross-platform UI components for React Native & Vue Native', 'https://nativebase.io/', true),
  ('Shoutem UI', 'Shoutem UI toolkit enables you to build professionally looking React Native apps with ease', 'https://shoutem.github.io/docs/ui-toolkit/introduction', false),
  ('tailwind-rn', 'Use Tailwind CSS in React Native projects', 'https://github.com/vadimdemedes/tailwind-rn', false),
  ('Ant Design Mobile RN', 'An Ant design based configurable Mobile UI component library based on React Native', 'https://rn.mobile.ant.design/', true),
  ('SnackUI', 'SnackUI is a UI Kit for React Native + react-native-web that''s much faster rocket with an optimizing compiler', 'https://github.com/snackui/snackui', false),
  ('Moti', 'Moti is the universal animation package for React Native', 'https://moti.fyi/', false),
  ('Tamagui', 'Universal React design systems that optimize for native & web', 'https://tamagui.dev/', true)
) AS t(title, description, url, featured)
WHERE NOT EXISTS (
  SELECT 1 FROM resources WHERE title = t.title
);
