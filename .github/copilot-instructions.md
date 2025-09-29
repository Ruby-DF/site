# Ruby DF Site - Copilot Instructions

Ruby DF is a Brazilian Ruby community website built with Bridgetown, a modern Ruby-based static site generator. The site serves the Ruby community in Distrito Federal (Brasília) and is available in Portuguese.

**Always reference these instructions first and fallback to search or bash commands only when you encounter unexpected information that does not match the info here.**

## Working Effectively

### Bootstrap and Setup (Required - Run Once)
- Install Ruby dependencies: `sudo bundle install` 
  - **TIMING**: Takes ~45 seconds. NEVER CANCEL - set timeout to 120+ seconds
  - **CAVEAT**: Requires sudo due to system gem permissions  
  - **CAVEAT**: Site specifies Ruby 3.4.2 but works fine with system Ruby 3.2.3+
- Install Node.js dependencies: `yarn install`
  - **TIMING**: Takes ~20 seconds. NEVER CANCEL - set timeout to 60+ seconds
- Update browserslist (optional but recommended): `npx update-browserslist-db`
  - Fixes "caniuse-lite is outdated" warnings during builds

### Development Workflow
- Start development server: `bin/bridgetown start` 
  - **TIMING**: Starts in < 1 second
  - **URL**: http://localhost:4000
  - **Features**: Hot reloading, esbuild watch mode, Puma server
  - Use Ctrl-C to stop
- Alternative start command: `bin/dev` (same as above)

### Build Commands
- Production build: `bin/bridgetown deploy`
  - **TIMING**: Takes ~2 seconds. NEVER CANCEL - set timeout to 120+ seconds
  - **Alternative**: `bundle exec rake deploy`
  - Generates minified assets in `output/` directory
- Test build: `bundle exec rake test`
  - **TIMING**: Takes ~1 second. NEVER CANCEL - set timeout to 60+ seconds  
  - Builds site in test environment
- Clean build artifacts: `bundle exec rake clean`
  - Removes `output/` and `.bridgetown-cache/` directories
- Frontend-only builds:
  - Development: `yarn run esbuild-dev` (watch mode)
  - Production: `yarn run esbuild` (minified)
  - **TIMING**: Takes < 1 second each

## Validation and Testing

### Manual Validation Scenarios  
**ALWAYS** test these scenarios after making changes to ensure functionality:
- **Homepage**: Verify http://localhost:4000 loads with proper Ruby DF branding
- **Events page**: Test http://localhost:4000/events/ displays event history correctly  
- **Sponsoring page**: Verify http://localhost:4000/sponsoring/ loads properly
- **Calendar endpoint**: Test http://localhost:4000/events.ics generates valid iCalendar data
- **Assets**: Verify CSS and JavaScript files are generated in `output/_bridgetown/static/`

### Code Quality
- Ruby syntax check: `find . -name "*.rb" -path "./src/*" -exec ruby -c {} \;`
- **NO linting tools configured** - manual review required for code style
- **NO automated test suite** - validation relies on successful builds and manual testing

## Common Tasks and Key Locations

### Repository Structure  
```
.
├── README.md                   # Portuguese documentation
├── Gemfile                     # Ruby dependencies
├── package.json               # Node.js dependencies  
├── bridgetown.config.yml      # Main site configuration
├── esbuild.config.js          # Frontend build configuration
├── src/                       # Source content and templates
│   ├── _components/           # Liquid templates and Ruby components
│   ├── _data/                # Site metadata (site_metadata.yml)
│   ├── _events/              # Event content
│   ├── _layouts/             # Page layouts
│   └── index.md              # Homepage content
├── frontend/                  # Frontend assets (JS/CSS)
├── config/                    # Bridgetown configuration
├── output/                    # Generated site (after build)
└── server/                    # Roda server configuration
```

### Key Files to Know
- `src/_data/site_metadata.yml`: Site title, description, social links
- `src/_components/calendar.rb`: Ruby component for calendar generation
- `bridgetown.config.yml`: Site-wide configuration, timezone, collections
- `esbuild.config.js`: Frontend asset bundling configuration
- `config.ru`: Rack application configuration

### Rake Tasks Available
Run `bundle exec rake --tasks` to see all options:
- `rake deploy`: Production build
- `rake test`: Test environment build  
- `rake clean`: Clean build artifacts
- `rake frontend:build`: Build frontend assets only
- `rake frontend:dev`: Watch frontend assets

## Technology Stack Details

### Ruby/Bridgetown
- **Framework**: Bridgetown v1.3.4 ("Kelly Butte")
- **Template Engine**: Liquid with Ruby components support
- **Server**: Puma + Roda for development and SSR capability
- **Gems**: SEO tag plugin, iCalendar generation, timezone support

### Frontend
- **JavaScript**: esbuild bundling with hot reloading
- **CSS**: PostCSS with import support and autoprefixing  
- **Assets**: Generated with content hashes (e.g., `index.ABC123.js`)
- **Static Files**: Served from `/_bridgetown/static/`

### Deployment  
- **Platform**: GitHub Pages
- **Trigger**: Push to `main` branch or daily cron (3am UTC)
- **Build**: GitHub Actions using `bin/bridgetown deploy`
- **Output**: Static files in `output/` directory

## Troubleshooting Common Issues

### Permission Errors
- If `bundle install` fails with permission errors, use `sudo bundle install`
- This is required due to system Ruby gem location permissions

### Ruby Version Mismatch  
- Site specifies Ruby 3.4.2 but works with Ruby 3.2.3+
- No need to install specific Ruby version via rbenv/rvm

### Browserslist Warnings
- Run `npx update-browserslist-db` to fix "caniuse-lite is outdated" warnings
- Does not affect functionality, only generates warnings

### Build Failures
- Always run `bundle exec rake clean` before debugging build issues
- Check that both `bundle install` and `yarn install` completed successfully
- Verify development server starts with `bin/bridgetown start` before building

## Development Tips

### Making Content Changes
- Edit Markdown files in `src/` for pages
- Modify `src/_data/site_metadata.yml` for site-wide settings
- Add events in `src/_events/` directory
- Use `src/_components/` for reusable template components

### Asset Development
- CSS/JS changes trigger automatic rebuilds in development mode
- Frontend assets are fingerprinted in production builds
- Source maps are generated for debugging

### Performance Notes
- Development builds are unminified for debugging
- Production builds (`deploy`) minify all assets
- All builds are very fast (< 2 seconds) due to modern tooling

**Remember**: This is a Portuguese-language site for the Brazilian Ruby community. Content and configuration reflect Brazilian timezone (America/Sao_Paulo) and Portuguese language conventions.