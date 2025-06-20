
-- Create categories table
CREATE TABLE public.categories (
  id UUID NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  description TEXT,
  slug TEXT NOT NULL UNIQUE,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

-- Create resources table
CREATE TABLE public.resources (
  id UUID NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  title TEXT NOT NULL,
  description TEXT NOT NULL,
  url TEXT NOT NULL,
  category_id UUID NOT NULL REFERENCES public.categories(id) ON DELETE CASCADE,
  featured BOOLEAN NOT NULL DEFAULT false,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

-- Insert all categories from file.txt
INSERT INTO public.categories (name, slug) VALUES
('AI Tools', 'ai-tools'),
('API Testing', 'api-testing'),
('Career & Jobs', 'career-jobs'),
('Code Editors', 'code-editors'),
('CSS Frameworks', 'css-frameworks'),
('Design Tools', 'design-tools'),
('Development Tools', 'development-tools'),
('Documentation', 'documentation'),
('Email Services', 'email-services'),
('Form Builders', 'form-builders'),
('Hosting & Deployment', 'hosting-deployment'),
('Icon Libraries', 'icon-libraries'),
('Image & Video', 'image-video'),
('Learning Resources', 'learning-resources'),
('Libraries & Frameworks', 'libraries-frameworks'),
('Package Managers', 'package-managers'),
('Productivity', 'productivity'),
('Static Site Generators', 'static-site-generators'),
('UI Components', 'ui-components'),
('Version Control', 'version-control'),
('Web Development', 'web-development');

-- Insert all resources from file.txt with their complete data
INSERT INTO public.resources (title, description, url, category_id, featured) VALUES
-- AI Tools
('ChatGPT', 'AI-powered conversational assistant for various tasks', 'https://chat.openai.com', (SELECT id FROM categories WHERE slug = 'ai-tools'), true),
('Claude', 'AI assistant by Anthropic for helpful, harmless, and honest conversations', 'https://claude.ai', (SELECT id FROM categories WHERE slug = 'ai-tools'), true),
('Midjourney', 'AI image generation tool for creating stunning artwork', 'https://midjourney.com', (SELECT id FROM categories WHERE slug = 'ai-tools'), true),
('DALL-E 2', 'OpenAI''s AI system that can create realistic images from text descriptions', 'https://openai.com/dall-e-2', (SELECT id FROM categories WHERE slug = 'ai-tools'), false),
('GitHub Copilot', 'AI pair programmer that helps you write code faster', 'https://github.com/features/copilot', (SELECT id FROM categories WHERE slug = 'ai-tools'), false),
('Jasper', 'AI writing assistant for marketing teams', 'https://jasper.ai', (SELECT id FROM categories WHERE slug = 'ai-tools'), false),
('Copy.ai', 'AI-powered copywriting tool', 'https://copy.ai', (SELECT id FROM categories WHERE slug = 'ai-tools'), false),
('Runway ML', 'Creative tools powered by machine learning', 'https://runwayml.com', (SELECT id FROM categories WHERE slug = 'ai-tools'), false),

-- API Testing
('Postman', 'Collaboration platform for API development and testing', 'https://postman.com', (SELECT id FROM categories WHERE slug = 'api-testing'), true),
('Insomnia', 'Open-source API client for REST and GraphQL', 'https://insomnia.rest', (SELECT id FROM categories WHERE slug = 'api-testing'), false),
('Thunder Client', 'Lightweight Rest API Client Extension for VS Code', 'https://thunderclient.com', (SELECT id FROM categories WHERE slug = 'api-testing'), false),
('Hoppscotch', 'Open source API development ecosystem', 'https://hoppscotch.io', (SELECT id FROM categories WHERE slug = 'api-testing'), false),
('REST Client', 'VS Code extension for testing REST APIs', 'https://marketplace.visualstudio.com/items?itemName=humao.rest-client', (SELECT id FROM categories WHERE slug = 'api-testing'), false),

-- Career & Jobs
('AngelList', 'Platform for startups, angel investors, and job seekers', 'https://angel.co', (SELECT id FROM categories WHERE slug = 'career-jobs'), true),
('LinkedIn', 'Professional networking platform', 'https://linkedin.com', (SELECT id FROM categories WHERE slug = 'career-jobs'), true),
('Indeed', 'Job search engine', 'https://indeed.com', (SELECT id FROM categories WHERE slug = 'career-jobs'), false),
('Glassdoor', 'Job listings and company reviews', 'https://glassdoor.com', (SELECT id FROM categories WHERE slug = 'career-jobs'), false),
('Stack Overflow Jobs', 'Job board for developers', 'https://stackoverflow.com/jobs', (SELECT id FROM categories WHERE slug = 'career-jobs'), false),
('Remote.co', 'Remote job listings', 'https://remote.co', (SELECT id FROM categories WHERE slug = 'career-jobs'), false),
('We Work Remotely', 'Remote work job board', 'https://weworkremotely.com', (SELECT id FROM categories WHERE slug = 'career-jobs'), false),

-- Code Editors
('Visual Studio Code', 'Free source-code editor by Microsoft', 'https://code.visualstudio.com', (SELECT id FROM categories WHERE slug = 'code-editors'), true),
('Sublime Text', 'Sophisticated text editor for code, markup and prose', 'https://sublimetext.com', (SELECT id FROM categories WHERE slug = 'code-editors'), false),
('Atom', 'Hackable text editor for the 21st century', 'https://atom.io', (SELECT id FROM categories WHERE slug = 'code-editors'), false),
('WebStorm', 'IDE for JavaScript and related technologies', 'https://jetbrains.com/webstorm', (SELECT id FROM categories WHERE slug = 'code-editors'), false),
('Vim', 'Highly configurable text editor', 'https://vim.org', (SELECT id FROM categories WHERE slug = 'code-editors'), false),
('Neovim', 'Hyperextensible Vim-based text editor', 'https://neovim.io', (SELECT id FROM categories WHERE slug = 'code-editors'), false),

-- CSS Frameworks
('Tailwind CSS', 'Utility-first CSS framework for rapid UI development', 'https://tailwindcss.com', (SELECT id FROM categories WHERE slug = 'css-frameworks'), true),
('Bootstrap', 'Popular CSS framework for responsive web development', 'https://getbootstrap.com', (SELECT id FROM categories WHERE slug = 'css-frameworks'), true),
('Bulma', 'Modern CSS framework based on Flexbox', 'https://bulma.io', (SELECT id FROM categories WHERE slug = 'css-frameworks'), false),
('Foundation', 'Responsive front-end framework', 'https://get.foundation', (SELECT id FROM categories WHERE slug = 'css-frameworks'), false),
('Semantic UI', 'User interface is the language of the web', 'https://semantic-ui.com', (SELECT id FROM categories WHERE slug = 'css-frameworks'), false),
('Materialize', 'CSS framework based on Material Design', 'https://materializecss.com', (SELECT id FROM categories WHERE slug = 'css-frameworks'), false),

-- Design Tools
('Figma', 'Collaborative interface design tool', 'https://figma.com', (SELECT id FROM categories WHERE slug = 'design-tools'), true),
('Adobe XD', 'Vector-based user experience design tool', 'https://adobe.com/products/xd.html', (SELECT id FROM categories WHERE slug = 'design-tools'), false),
('Sketch', 'Digital design toolkit', 'https://sketch.com', (SELECT id FROM categories WHERE slug = 'design-tools'), false),
('Canva', 'Graphic design platform for creating visual content', 'https://canva.com', (SELECT id FROM categories WHERE slug = 'design-tools'), true),
('Framer', 'Interactive design tool', 'https://framer.com', (SELECT id FROM categories WHERE slug = 'design-tools'), false),
('InVision', 'Digital product design platform', 'https://invisionapp.com', (SELECT id FROM categories WHERE slug = 'design-tools'), false),

-- Learning Resources
('freeCodeCamp', 'Learn to code with free online courses', 'https://freecodecamp.org', (SELECT id FROM categories WHERE slug = 'learning-resources'), true),
('MDN Web Docs', 'Resources for developers, by developers', 'https://developer.mozilla.org', (SELECT id FROM categories WHERE slug = 'learning-resources'), true),
('W3Schools', 'Web development tutorials and references', 'https://w3schools.com', (SELECT id FROM categories WHERE slug = 'learning-resources'), false),
('Codecademy', 'Interactive coding lessons', 'https://codecademy.com', (SELECT id FROM categories WHERE slug = 'learning-resources'), false),
('Khan Academy', 'Free online courses, lessons and practice', 'https://khanacademy.org', (SELECT id FROM categories WHERE slug = 'learning-resources'), false),
('Coursera', 'Online courses from top universities', 'https://coursera.org', (SELECT id FROM categories WHERE slug = 'learning-resources'), false),
('Udemy', 'Online learning platform', 'https://udemy.com', (SELECT id FROM categories WHERE slug = 'learning-resources'), false),

-- Web Development
('React', 'JavaScript library for building user interfaces', 'https://react.dev', (SELECT id FROM categories WHERE slug = 'web-development'), true),
('Next.js', 'React framework for production', 'https://nextjs.org', (SELECT id FROM categories WHERE slug = 'web-development'), true),
('Vue.js', 'Progressive JavaScript framework', 'https://vuejs.org', (SELECT id FROM categories WHERE slug = 'web-development'), false),
('Angular', 'Platform for building mobile and desktop web applications', 'https://angular.io', (SELECT id FROM categories WHERE slug = 'web-development'), false),
('Svelte', 'Cybernetically enhanced web apps', 'https://svelte.dev', (SELECT id FROM categories WHERE slug = 'web-development'), false),
('Node.js', 'JavaScript runtime built on Chrome''s V8 JavaScript engine', 'https://nodejs.org', (SELECT id FROM categories WHERE slug = 'web-development'), false),

-- Productivity
('Notion', 'All-in-one workspace for notes, docs, and collaboration', 'https://notion.so', (SELECT id FROM categories WHERE slug = 'productivity'), true),
('Trello', 'Visual project management with boards and cards', 'https://trello.com', (SELECT id FROM categories WHERE slug = 'productivity'), false),
('Slack', 'Team communication and collaboration', 'https://slack.com', (SELECT id FROM categories WHERE slug = 'productivity'), false),
('Asana', 'Team project management', 'https://asana.com', (SELECT id FROM categories WHERE slug = 'productivity'), false),
('Monday.com', 'Work operating system', 'https://monday.com', (SELECT id FROM categories WHERE slug = 'productivity'), false),
('Todoist', 'Task management application', 'https://todoist.com', (SELECT id FROM categories WHERE slug = 'productivity'), false);

-- Add function to update the updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Create trigger to automatically update updated_at
CREATE TRIGGER update_resources_updated_at BEFORE UPDATE ON public.resources
FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
