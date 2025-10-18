# GitHub Pages Setup Guide

This guide will help you set up GitHub Pages for your SMART-CONTRACT-INTERACTIVE repository.

## Steps to Enable GitHub Pages

1. Go to your repository on GitHub: https://github.com/attakdefand/SMART-CONTRACT-INTERACTIVE

2. Click on the "Settings" tab (usually located on the right side of the repository page)

3. In the left sidebar, scroll down and click on "Pages" (under "Code and automation")

4. In the "Source" section:
   - Select "Deploy from a branch" 
   - Under "Branch", select "main" from the dropdown
   - Leave the folder as "/ (root)"
   - Click "Save"

5. GitHub will now build and deploy your site. This may take a few minutes.

6. Once deployed, your site will be available at:
   https://attakdefand.github.io/SMART-CONTRACT-INTERACTIVE/

## Custom Domain

The CNAME file has already been created for you with the content:
```
attakdefand.github.io/SMART-CONTRACT-INTERACTIVE
```

If you want to use a custom domain instead:
1. Remove or modify the CNAME file
2. Update the settings in the GitHub Pages configuration
3. Configure your DNS settings accordingly

## Troubleshooting

If your site doesn't appear after a few minutes:
- Check that the files are in the root of your repository
- Ensure the index.html file exists
- Check the GitHub Actions tab for any build errors
- Verify the GitHub Pages settings are correctly configured

## Site Structure

Your GitHub Pages site includes:
- `index.html` - Main landing page
- `documentation.html` - Detailed documentation
- `styles.css` - Styling for both pages
- `404.html` - Custom 404 error page

The site is designed to be responsive and works on both desktop and mobile devices.