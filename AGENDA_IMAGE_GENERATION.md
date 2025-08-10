# Generating Agenda Images

This project includes a script to generate agenda images for social media sharing.

## Setup

1. Install Node.js dependencies:
   ```bash
   yarn install
   ```

2. Build the site:
   ```bash
   rake deploy
   ```

## Usage

Generate an agenda image for a specific event:

```bash
rake generate_agenda_image[2025-01-25]
```

This will:
1. Build the site (if not already built)
2. Install Puppeteer (if not already installed)
3. Generate a high-quality PNG image from the agenda export HTML
4. Save it to `output/agenda-{date}.png`

## Output

The generated image will be:
- **Size**: 1080x1080 pixels (perfect for social media)
- **Quality**: High-resolution PNG with 2x scale factor
- **Location**: `output/agenda-{event-date}.png`

## Manual Script Usage

You can also run the script directly:

```bash
node scripts/generate_agenda_image.js 2025-01-25
```

This requires the site to be built first and the export page to exist in the output directory.