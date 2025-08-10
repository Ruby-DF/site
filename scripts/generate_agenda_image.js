#!/usr/bin/env node

const puppeteer = require('puppeteer');
const path = require('path');
const fs = require('fs');

async function generateAgendaImage(eventDate) {
  if (!eventDate) {
    console.error('Usage: node scripts/generate_agenda_image.js <event-date>');
    console.error('Example: node scripts/generate_agenda_image.js 2025-01-25');
    process.exit(1);
  }

  const outputPath = path.join(__dirname, '..', 'output', `agenda-${eventDate}.png`);
  const outputDir = path.dirname(outputPath);
  
  // Ensure output directory exists
  if (!fs.existsSync(outputDir)) {
    fs.mkdirSync(outputDir, { recursive: true });
  }

  const browser = await puppeteer.launch();
  
  try {
    const page = await browser.newPage();
    
    // Set viewport to match the agenda export dimensions
    await page.setViewport({ 
      width: 1080, 
      height: 1080,
      deviceScaleFactor: 2 // For high quality
    });

    // Navigate to the agenda export page
    const url = `file://${path.join(__dirname, '..', 'output', 'agenda-export', `${eventDate}`, 'index.html')}`;
    
    console.log(`Loading agenda from: ${url}`);
    await page.goto(url, { waitUntil: 'networkidle0' });

    // Take screenshot
    await page.screenshot({
      path: outputPath,
      fullPage: true,
      type: 'png'
    });

    console.log(`✅ Agenda image generated: ${outputPath}`);
    
  } catch (error) {
    console.error('❌ Error generating agenda image:', error.message);
    process.exit(1);
  } finally {
    await browser.close();
  }
}

const eventDate = process.argv[2];
generateAgendaImage(eventDate);