# CashMyFlow @ Pursuft — iPhone Home Screen Web App

## Free deployment plan (Windows PC)
1. Create/sign in to a GitHub account.
2. Create a **public** repository named `cashmyflow-pursuft` (GitHub Free Pages hosting needs a public repository for this setup).
3. Upload all files in this folder to the repository root. Keep `index.html`, `manifest.webmanifest`, `sw.js`, `icon.svg`, `icon-192.png`, `icon-512.png`, and `apple-touch-icon.png` together.
4. In the repository, open **Settings → Pages**.
5. Under **Build and deployment**, choose **Deploy from a branch**, select `main` and `/(root)`, then Save.
6. Wait for GitHub Pages to publish and copy the URL it shows (usually `https://YOUR-USERNAME.github.io/cashmyflow-pursuft/`).
7. On the iPhone, open that URL in **Safari**. Tap **Share → Add to Home Screen**, enable **Open as Web App** if offered, then tap **Add**.

## Important
- GitHub Pages URLs and repository contents are public. Never upload real financial records, passwords, API keys, or private information to the repository.
- This is a prototype. Exchange rates are sample values; there is no bank connection or real payment processing.
- The prototype stores finance data in browser localStorage. A static public deployment is suitable for testing with fake/sample data, not as secure multi-device financial storage.
- Service-worker offline caching works only when served from HTTPS (GitHub Pages is HTTPS) or localhost.
