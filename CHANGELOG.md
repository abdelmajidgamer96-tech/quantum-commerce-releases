# CHANGELOG — Quantum Commerce Pro

All notable changes to this project will be documented in this file.
Format: [Version] — Date — Description

---

## [1.2.6-hotfix1] — 2026-08-18

### 🔴 Critical Fixes (يجب التحديث فوراً)

- **SQLITE_READONLY crash on non-developer machines** — تم إصلاح المشكلة الجذرية:
  البيانات كانت تُحفظ داخل `C:\Program Files\` (محمي من الكتابة بدون Admin).
  الحل الدائم: كل البيانات تُحفظ الآن في `%APPDATA%\QuantumCommercePro\` (قابل للكتابة دائماً).

- **EPERM: operation not permitted on .env** — نفس السبب، نفس الإصلاح.

- **`_run_server.cmd` not found error** — الـ launcher كان يحاول كتابة ملف مؤقت داخل Program Files.
  تم حذف هذا الأسلوب نهائياً — السيرفر يُشتغل مباشرةً.

### ✅ Improvements
- Server startup timeout increased from 20 → 35 attempts for slow machines
- Server exit code now logged to `launch.log` for easier diagnostics
- Added `QCP_Diagnostic.ps1` pre-install compatibility checker

### 📦 Upgrade Instructions
- Uninstall old version → Reinstall from MediaFire link (same URL, new build)
- Data in `%APPDATA%\QuantumCommercePro\` is preserved on reinstall

---

## [1.2.6] — 2026-08-17

### Fixed
- VAT Toggle behavior corrected across all invoice views
- Event listeners leak resolved (duplicate handlers on re-render)
- Cache Busting applied to all static assets (style.css, app.js)

### Improved
- Setup installer now bundles portable node.exe (~90 MB) — no Node.js install required on customer PC
- Startup registry entry uses reliable fso.GetParentFolderName() path resolution
- Silent launch via VBS — no black CMD window on startup

---

## [1.1.0] — 2026-08-13

### Fixed
- core_launcher.js: registerStartup() uses fs.existsSync() check instead of truthy fallback
- INSTALL_ROOT detection works correctly in both dev workspace and installed package
- run.js updated to bridge directly to core_launcher.js

### Security
- Removed public client-side license key generator widget from landing page
- Orphan "Copy Key" floating button removed from all HTML pages
- Arabic text re-encoded to clean UTF-8 (fixed mojibake rendering)

### Added
- WhatsApp contact banner replaces the removed key generator
- Founder-only offline key generation via tools/keygen_private.js

---

## [1.0.0] — 2026-08-09

### Initial Release
- Full POS / Cashier interface
- AI Assistant (local, offline)
- OCR invoice scanning
- Multi-language support (7 languages)
- Telegram bot integration
- SQLite local database
- HMAC-secured license system
- Inno Setup installer packaging
