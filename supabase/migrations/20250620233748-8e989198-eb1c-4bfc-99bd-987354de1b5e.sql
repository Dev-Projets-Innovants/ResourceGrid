
-- Insert Chrome Extensions resources into the existing category
WITH chrome_extensions_category AS (
  SELECT id FROM categories WHERE slug = 'chrome-extensions'
)
INSERT INTO public.resources (title, description, url, category_id, featured) 
SELECT 
  title,
  description,
  url,
  (SELECT id FROM chrome_extensions_category),
  featured
FROM (VALUES
  ('WhatFont', 'The easiest way to identify fonts on web pages', 'https://chrome.google.com/webstore/detail/whatfont/jabopobgcpjmedljpbcaablpmlmfcogm', true),
  ('WhatRuns', 'Discover what runs a website. Frameworks, Analytics Tools, Wordpress Plugins, Fonts - you name it', 'https://chrome.google.com/webstore/detail/whatruns/cmkdbmfndkfgebldhnkbfhlneefdaaip?hl=en', true),
  ('Web Developer', 'Adds a toolbar button with various web developer tools', 'https://chrome.google.com/webstore/detail/web-developer/bfbameneiokkgbdmiekhjnmfkcnldhhm', true),
  ('Awesome Screenshot & Screen Recorder', 'Full page screen capture and screen recorder - 2 in 1. Share screencast video instantly', 'https://chrome.google.com/webstore/detail/awesome-screenshot-screen/nlipoenfbbikpbjkfpfillcgkoblgpmj?hl=en', false),
  ('daily.dev - News for Busy Developers', 'Get programming news with zero effort. Simply open a new tab, and you''re all set. A must-have tool for busy developers!', 'https://chrome.google.com/webstore/detail/dailydev-news-for-busy-de/jlmpjdjjbgclbocgajdjefcidcncaied', true),
  ('JSONView', 'Validate and view JSON documents', 'https://chrome.google.com/webstore/detail/jsonview/chklaanhfefbnpoihckbnefhakgolnmc?hl=en', false),
  ('JSON Lite', 'Browser extension for viewing JSON files', 'https://github.com/lauriro/json-lite', false),
  ('Window Resizer', 'Resize the browser window to emulate various screen resolutions', 'https://chrome.google.com/webstore/detail/window-resizer/kkelicaakdanhinjdeammmilcgefonfh?hl=en', false),
  ('Responsive Viewer', 'Show multiple screens once, Responsive design tester', 'https://chrome.google.com/webstore/detail/responsive-viewer/inmopeiepgfljkpkidclfgbgbmfcennb?hl=en', true),
  ('BrowserStack', 'Instantly test your webpage on any desktop or mobile browser', 'https://chrome.google.com/webstore/detail/browserstack/nkihdmlheodkdfojglpcjjmioefjahjb?hl=en', false),
  ('VisBug', 'Open source web design debug tool built with JavaScript', 'https://chrome.google.com/webstore/detail/visbug/cdockenadnadldjbbgcallicgledbeoc?hl=en', true),
  ('Kontrast - WCAG Contrast Checker', 'Quickly check and adjust contrast in real-time in your browser to meet WCAG 2.1 requirements', 'https://chrome.google.com/webstore/detail/kontrast-wcag-contrast-ch/haphaaenepedkjngghandlmhfillnhjk?hl=en', false),
  ('PerfectPixel', 'Adds a semi-transparent image overlay over the top of the developed HTML to easily perform pixel perfect comparison between them, useful for replicating UI designs', 'https://chrome.google.com/webstore/detail/perfectpixel-by-welldonec/dkaagdgjmgdmbnecmcefdhjekcoceebi', true),
  ('Pesticide', 'Inserts the Pesticide CSS into the current page, outlining each HTML element to better see placement on the page, helpful for building layouts', 'https://chrome.google.com/webstore/detail/pesticide-for-chrome-with/neonnmencpneifkhlmhmfhfiklgjmloi', false),
  ('Site Palette', 'A must-have tool for designers and frontend developers to grab colors for any website', 'https://chrome.google.com/webstore/detail/site-palette/pekhihjiehdafocefoimckjpbkegknoh', false),
  ('ColorZilla', 'Advanced Eyedropper, Color Picker, Gradient Generator and other colorful goodies', 'https://chrome.google.com/webstore/detail/colorzilla/bhlhnicpbhignbdhedgjhgdocnmhomnp', true),
  ('Lorem Ipsum Generator (Default Text)', 'Provides an elegant and quick way to create default text or generate Lorem Ipsum. Optimized for quick usage, but it can be customized', 'https://chrome.google.com/webstore/detail/lorem-ipsum-generator-def/mcdcbjjoakogbcopinefncmkcamnfkdb?hl=en%20', false),
  ('JavaScript and CSS Code Beautifier', 'Beautify CSS, JavaScript and JSON code when you open a .css/.js/.json file', 'https://chrome.google.com/webstore/detail/javascript-and-css-code-b/iiglodndmmefofehaibmaignglbpdald?hl=en', false),
  ('Imageye - Image downloader', 'Find and download all images on a web page. With Imageye you can find, browse and download all the images present in a web page', 'https://chrome.google.com/webstore/detail/imageye-image-downloader/agionbommeaifngbhincahgmoflcikhm', false),
  ('GoFullPage - Full Page Screen Capture', 'Capture a screenshot of your current page in entirety and reliably—without requesting any extra permissions!', 'https://chrome.google.com/webstore/detail/gofullpage-full-page-scre/fdpohaocaechififmbbbbbknoalclacl', false),
  ('Stylebot', 'Change the appearance of the web instantly', 'https://chrome.google.com/webstore/detail/stylebot/oiaejidbmkiecgbjeifoejpgmdaleoha', false),
  ('ColorPick Eyedropper', 'A zoomed eyedropper & color chooser tool that allows you to select color values from webpages and more', 'https://chrome.google.com/webstore/detail/colorpick-eyedropper/ohcpnigalekghcmgcdcenkpelffpdolg', false),
  ('React Developer Tool', 'React debugging tools to the Chrome Developer Tools. It allows you to inspect the React component hierarchies in the Chrome Developer Tools', 'https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi', true),
  ('Wappalyzer', 'Wappalyzer is a technology profiler that shows you what websites are built with', 'https://chrome.google.com/webstore/detail/wappalyzer/gppongmhjkpfnbhagpmjfkannfbllamg', true),
  ('Fake Filler', 'Fake Filler a form filler that fills all inputs on a page with fake/dummy data', 'https://chrome.google.com/webstore/detail/fake-filler/bnjjngeaknajbdcgpfkgnonkmififhfo', false),
  ('Page Ruler Redux', 'A Web Developer/Designer ruler to get perfect pixel dimensions and positioning to measure elements on any web page', 'https://chrome.google.com/webstore/detail/page-ruler-redux/giejhjebcalaheckengmchjekofhhmal', false),
  ('Web Editor', 'The web editor is the tool that provides you with an enhanced way to inspect any website elements, alter their properties, insert contents, design, and visualize the way you want to see them', 'https://chrome.google.com/webstore/detail/web-editor/pdmlhckofhkhebmcplblcijijgjiakcm', false),
  ('CSSViewer', 'A simple CSS property viewer', 'https://chrome.google.com/webstore/detail/cssviewer/ggfgijbpiheegefliciemofobhmofgce', false),
  ('Fonts Ninja', 'Identify fonts from any website, bookmark, try, and buy them', 'https://chrome.google.com/webstore/detail/fonts-ninja/eljapbgkmlngdpckoiiibecpemleclhh', false),
  ('Lighthouse', 'An open-source, automated tool for improving the performance, quality, and correctness of your web apps', 'https://chrome.google.com/webstore/detail/lighthouse/blipmdconlkpinefehnmjammfjpmpbjk', true),
  ('Debug CSS', 'Adds outline to all elements on the page to show the culprit element which is changing desired layout. Helps in debugging CSS of the page', 'https://chrome.google.com/webstore/detail/debug-css/igiofjnckcagmjgdoaakafngegecjnkj', false),
  ('UX Check', 'Identify usability issues through a heuristic evaluation', 'https://chrome.google.com/webstore/detail/ux-check/giekhiebdpmljgchjojblnekkcgpdobp', false),
  ('Angular Developer Tool', 'Angular DevTools allows you to understand the structure of your application and preview the state of the directive and the component instances', 'https://chrome.google.com/webstore/detail/angular-devtools/ienfalfjdbdpebioblfackkekamfmbnh', false),
  ('Redux Developer Tool', 'Redux DevTools provides power-ups for your Redux development workflow. Apart from Redux, it can be used with any other architectures which handle the state', 'https://chrome.google.com/webstore/detail/redux-devtools/lmhkpmbekcpmknklioeibfkpmmfibljd?hl=en', false),
  ('Hackertab.dev', 'Hackertab helps developers stay up-to-date with the latest dev news and resources in one tab', 'https://chrome.google.com/webstore/detail/hackertabdev-developer-ne/ocoipcahhaedjhnpoanfflhbdcpmalmp', false),
  ('JSON Formatter', 'Formats and colors JSON content for better readability. It can also collapse and expand nested structures', 'https://chrome.google.com/webstore/detail/json-formatter/bcjindcccaagfpapjjmafapmmgkkhgoa?hl=en', false),
  ('SEO Minion', 'A SEO tool that includes features like on-page SEO analysis, broken link checking, and SERP preview and more', 'https://chrome.google.com/webstore/detail/seo-minion/giihipjfimkajhlcilipnjeohabimjhi?hl=en', false)
) AS t(title, description, url, featured)
WHERE NOT EXISTS (
  SELECT 1 FROM resources WHERE title = t.title
);
