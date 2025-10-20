# Ruby DF Website - Copilot Instructions

## Project Overview

This is the official website for the Ruby DF (Ruby District Federal) community in Brazil. It's a static site built with Bridgetown, a modern Ruby-based static site generator, designed to showcase community events, provide information, and serve as a hub for the local Ruby developer community.

**Project URL**: https://rubydf.com

## Key Technologies

- **Bridgetown v2.0**: Ruby-based static site generator (primary framework)
- **Ruby**: 3.4.6 (backend/build system)
- **Node.js**: 20 (frontend tooling)
- **Liquid**: Template engine
- **esbuild**: JavaScript bundler
- **PostCSS**: CSS processing
- **Puma**: Web server
- **Yarn**: Package manager for Node.js dependencies
- **Bundler**: Ruby dependency management

## Project Structure

```
/
├── .github/           # GitHub configuration (workflows, dependabot)
├── bin/               # Executable scripts (bridgetown CLI)
├── config/            # Configuration files
├── frontend/          # Frontend assets (JavaScript, CSS)
├── plugins/           # Bridgetown plugins
├── server/            # Server-side code
├── src/               # Source content and templates
│   ├── _components/   # Reusable components (Liquid & Ruby)
│   ├── _data/         # Data files
│   ├── _events/       # Event content collection
│   ├── _layouts/      # Page layouts
│   └── images/        # Image assets
├── bridgetown.config.yml  # Main Bridgetown configuration
├── Gemfile            # Ruby dependencies
└── package.json       # Node.js dependencies
```

## Development Setup

### Prerequisites
- GCC and Make
- Ruby 3.4.6
- Node.js 20
- Yarn package manager
- Bridgetown gem: `gem install bridgetown -N`

### Installation
```bash
bundle install && yarn install
```

### Development Server
```bash
bin/bridgetown start
```
Visit http://localhost:4000

### Useful Commands
- `bin/bridgetown start` - Start development server
- `bin/bridgetown deploy` - Build for production
- `bin/bridgetown console` - Open Ruby console with site loaded
- `yarn run esbuild` - Build frontend for production
- `yarn run esbuild-dev` - Watch frontend files during development

## Configuration Details

- **Locale**: Brazilian Portuguese (pt-BR)
- **Timezone**: America/Sao_Paulo
- **Permalink Style**: Pretty URLs (no .html extension)
- **Template Engine**: Liquid
- **Base URL**: https://rubydf.com

### Collections
- **events**: Event information with custom output, sorted descending by order, includes future events

## Build & Deployment

### Build Process
1. Frontend assets are built with esbuild and PostCSS
2. Bridgetown compiles content, templates, and components
3. Output is generated in the `output/` directory

### Deployment
- Automated via GitHub Actions on push to `main` branch
- Daily automated rebuilds at 3am UTC (to refresh calendar/event data)
- Deployed to GitHub Pages

### Build Commands
- `rake deploy` - Full production build
- `rake test` - Build in test environment
- `rake clean` - Clean build artifacts

## Coding Conventions

### File Naming
- Liquid templates: `.liquid` extension
- Ruby components: `.rb` extension
- Markdown content: `.md` extension
- Use snake_case for file names

### Components
- Located in `src/_components/`
- Can be either Liquid templates or Ruby classes
- Used for reusable UI elements (navbar, footer, calendar, etc.)

### Layouts
- Located in `src/_layouts/`
- Base layout: `default.liquid`
- Specialized layouts: `page.liquid`, `event.liquid`

### Content
- Events stored in `src/_events/` collection
- Use front matter (YAML) for metadata
- Content written in Markdown or HTML

## Important Notes

### Language
- Content is primarily in Brazilian Portuguese (pt-BR)
- Comments and documentation can be in English
- UI strings and user-facing text should be in Portuguese

### Dependencies
- Dependabot is configured for both Bundler and npm/Yarn
- Weekly automated dependency update checks

### Plugins & Gems
- `bridgetown-seo-tag`: SEO optimization
- `icalendar`: Calendar functionality
- `tzinfo`: Timezone support

## When Making Changes

1. **Development workflow**: Always use `bin/bridgetown start` to see changes live
2. **Frontend changes**: Modify files in `frontend/` directory; esbuild will rebuild automatically in dev mode
3. **Content changes**: Edit files in `src/`; Bridgetown will rebuild automatically
4. **Component changes**: Components in `src/_components/` can be Ruby or Liquid
5. **Configuration changes**: Require server restart (Ctrl+C, then `bin/bridgetown start` again)
6. **Testing builds**: Run `rake test` before submitting changes
7. **Production builds**: Use `rake deploy` or `bin/bridgetown deploy`

## Assets & Resources

- Favicons and app icons are in `src/` root
- Images are in `src/images/`
- Web manifest for PWA support: `manifest.webmanifest`
- iCalendar feed available at `/events.ics`

## Tips for Copilot

- When creating new events, follow the structure in `src/_events/`
- When modifying layouts, maintain consistency with existing Liquid syntax
- For Ruby components, follow Bridgetown component conventions
- Frontend JavaScript uses ES modules (type: "module" in package.json)
- Always consider mobile responsiveness for UI changes
- Respect the Brazilian Portuguese language for user-facing content
