
-- Insert Vue UI Libraries resources into the existing category
WITH vue_ui_category AS (
  SELECT id FROM categories WHERE slug = 'vue-ui-libraries'
)
INSERT INTO public.resources (title, description, url, category_id, featured) 
SELECT 
  title,
  description,
  url,
  (SELECT id FROM vue_ui_category),
  featured
FROM (VALUES
  ('Vuetify', 'Material design component framework', 'https://vuetifyjs.com/en/', true),
  ('Bootstrap Vue', 'Use Bootstrap components with Vue', 'https://bootstrap-vue.org/', true),
  ('Buefy', 'Lightweight UI components based on Bulma', 'https://buefy.org/', false),
  ('Semantic UI Vue', 'Semantic UI Vue is the Vue integration for Semantic UI', 'https://semantic-ui-vue.github.io', false),
  ('Arco Design Vue', 'A comprehensive Vue UI components library based on the Arco Design system', 'https://arco.design/vue/en-US/docs/start', false),
  ('VEUI', 'VEUI is an enterprise UI component library, based on Vue.js', 'https://veui.dev/en-US', false),
  ('Grace', 'Design System For Vue Applications', 'https://github.com/Trendyol/grace', false),
  ('Quasar', 'High-performance Material Design component suite with builders for SPA, SSR, PWA, Mobile (Cordova & Capacitor), Desktop (Electron) and Browser extensions', 'https://quasar.dev/', true),
  ('Element', 'Desktop UI library for Vue', 'https://element.eleme.io/#/en-US', true),
  ('Fish UI', 'Vue UI toolkit for the web', 'https://myliang.github.io/fish-ui/#/components/index', false),
  ('Keen UI', 'VueUI library with a simple API, inspired by Google''s Material Design', 'https://josephuspaye.github.io/Keen-UI', false),
  ('Materio Vuetify Vuejs Admin Template', 'Open-source & Easy to use Vuetify Vuejs Admin Template with Elegant Design & Unique Layout', 'https://github.com/themeselection/materio-vuetify-vuejs-admin-template-free', false),
  ('Onsen Vue', 'Distributes Components for hybrid mobile apps with Vue and Onsen UI', 'https://onsen.io/vue/', false),
  ('Vuejsexamples', 'A nice collection of useful vuejs UI components', 'https://vuejsexamples.com', false),
  ('Inkline', 'Inkline is a modern UI/UX Framework for Vue.js designed for creating flawless responsive web applications', 'https://inkline.io', false),
  ('Vuesax', 'Unique and reusable UI components', 'https://vuesax.com/', false),
  ('Antdv', 'UI library for Vue based on Ant Design', 'https://antdv.com/', true),
  ('Shards Vue', 'A high-quality & free Vue UI kit featuring a modern design system with dozens of custom components', 'https://designrevision.com/downloads/shards-vue/', false),
  ('Prime Vue', 'Powerful yet simple to use, versatile, performant Vue UI Component Library to help you build stunning user interfaces', 'https://primevue.org/', true),
  ('Chakra UI Vue', 'Chakra UI is a simple modular and accessible component library that gives you the building blocks to build Vue applications with speed', 'https://vue.chakra-ui.com/', false),
  ('View UI', 'Dozens of useful and beautiful Vue components made for people with all skill levels with extensive documentation', 'https://www.iviewui.com/', false),
  ('@tsparticles/vue2', 'A lightweight Vue 2.x component for creating particles', 'https://github.com/tsparticles/vue2', false),
  ('@tsparticles/vue3', 'A lightweight Vue 3.x component for creating particles', 'https://github.com/tsparticles/vue3', false),
  ('TC Components', 'A library of high-quality ready to use components that will help you speed up your development workflow', 'https://components.timos.design', false),
  ('Vant', 'Lightweight Mobile UI Components built on Vue', 'https://youzan.github.io/vant', true),
  ('Equal UI', 'Open-source Vue 3 components system for your next project based on TypeScript', 'https://quatrochan.github.io/Equal/', false),
  ('Mint UI', 'Mobile UI elements for Vue.js', 'https://mint-ui.github.io/#!/en', false),
  ('Cube UI', 'A fantastic mobile ui lib implement by Vue.js', 'https://didi.github.io/cube-ui/#/en-US', false),
  ('Muse UI', 'Based on the Vue 2.0 elegant Material Design UI component library', 'https://muse-ui.org/#/en-US', false),
  ('AT-UI', 'AT-UI is a modular front-end UI framework for developing fast and powerful web interfaces based on Vue.js', 'https://at-ui.github.io/at-ui/#/en', false),
  ('Vuikit', 'A consistent and responsive Vue UI library, based on the front-end framework UIkit', 'https://vuikit.js.org/', false),
  ('Wave UI', 'A Vue.js UI framework with only the bright side', 'https://antoniandre.github.io/wave-ui/', false),
  ('VueTailwind', 'Set of Lightview and fully customizable Vue Components optimized for TailwindCSS', 'https://www.vue-tailwind.com/', false),
  ('Oruga', 'Oruga is a lightweight library of UI components for Vue.js without CSS framework dependency', 'https://oruga.io/', false),
  ('BalmUI', 'BalmUI is a modular and customizable Material Design UI library for Vue.js', 'https://material.balmjs.com/#/', false),
  ('Weex UI', 'A rich interaction, lightweight, high performance UI library based on Weex', 'https://github.com/apache/incubator-weex-ui', false),
  ('Varlet', 'Varlet is a Material design mobile component library developed based on Vue3, developed and maintained by partners in the community', 'https://github.com/haoziqaq/varlet', false),
  ('Naive UI', 'A Vue 3 Component Library. Fairly Complete. Customizable Themes. Uses TypeScript. Not too Slow', 'https://www.naiveui.com/en-US/os-theme', true),
  ('Vuestic', 'Free and Open Source UI Library for Vue 3', 'https://vuestic.dev/', false),
  ('Vue Final Modal', 'Vue Final Modal is a tiny, renderless, mobile-friendly, feature-rich modal component for Vue.js', 'https://vue-final-modal.org/', false),
  ('Vuetensils', 'Vuetensils is a lightweight component library for Vue 2.x that brings some of most common UI features, but only the bare minimum styles to avoid adding any extra bloat', 'https://vuetensils.stegosource.com/', false),
  ('NuxtLabs UI', 'Fully styled and customizable components for Nuxt', 'https://ui.nuxtlabs.com/getting-started', true),
  ('shadcn-vue', 'Vue port of shadcn-ui', 'https://www.shadcn-vue.com/', true)
) AS t(title, description, url, featured)
WHERE NOT EXISTS (
  SELECT 1 FROM resources WHERE title = t.title
);
