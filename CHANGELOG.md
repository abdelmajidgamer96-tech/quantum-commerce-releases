# CHANGELOG — Quantum Commerce Pro

All notable changes to this project will be documented in this file.
Format: [Version] — Date — Description

---

## [1.3.0] — 2026-08-18

### ✨ New

- **قراءة الفواتير تعمل أوفلاين بالكامل** — محرّك OCR وملفات اللغة (`ara` + `fra` + `eng`)
  أصبحت مرفقة داخل الحزمة. سابقاً كانت تُحمَّل من الإنترنت عند أول استخدام، أي أن
  الميزة كانت تفشل في محل بلا اتصال.

- **جدول مراجعة قابل للتعديل قبل الحفظ** — الكميات والأسعار التي استخرجها الذكاء
  يمكن تصحيحها، مع مجموع يتحدّث لحظياً. لم تعد تُحفظ أرقام دون مراجعة.

- **وجهة رابعة: فاتورة مورّد (مشتريات)** — تسجّل الشراء **وتزيد المخزون** في عملية
  واحدة، وتسأل إن كانت مدفوعة أم دَيناً على المحل.

### 🔴 Critical Fixes

- **كميات الاستيراد بالذكاء كانت خاطئة** — لم يكن يُستخرج حقل الكمية إطلاقاً، فكان
  المخزون يُسجَّل `10` دائماً والمجاميع تُحسب بوحدة واحدة لكل صنف.
  فاتورة بـ 287,000 دج كانت تُسجَّل 56,500 دج.

- **الديون كانت تُسجَّل باسم عميل وهمي واحد** — الآن يُطلب اسم المدين الحقيقي،
  ويُسجَّل كعميل جديد تلقائياً إن لم يكن موجوداً.

- **الضغط على الأيقونة والبرنامج يعمل لم يكن يفعل شيئاً** — السيرفر يحتجز `server.log`
  فيفشل أمر التشغيل بالكامل. سجل المُشغّل صار منفصلاً.

- **مفتاح التشغيل التلقائي في الريجستري كان يفشل دائماً** بسبب اقتباس مزدوج خاطئ.

- **الإقلاع على جهاز نظيف لأول مرة** — على حاسوب جديد، أول تشغيل للسيرفر يحتاج وقتاً
  أطول (تحميل مكتبات SQLite + فحص Windows Defender لكل ملف جديد)، وكان المُشغّل يفتح
  المتصفح على منفذ لم يجهز بعد فتظهر «تعذّر الوصول». الآن ينتظر المُشغّل حتى **75 ثانية**
  ويتأكد أن السيرفر حيّ **قبل** فتح المتصفح؛ وإن تأخّر أكثر يفتح صفحة حالة عربية واضحة
  تُعيد المحاولة تلقائياً بدل شاشة خطأ.

### ✅ Improvements

- يفتح في **نافذة تطبيق مستقلة** (Chrome/Edge) بلا شريط عناوين — لا كتبويب متصفح
- السيرفر يُعلن المنفذ الذي حجزه فعلياً، فلا تنكسر الواجهة إن كان 3000 مشغولاً
- النموذج الافتراضي أصبح `qwen2.5:3b` (عربية أفضل، يعمل بذاكرة أقل)
- تنظيف مخرجات نماذج التفكير (`<think>`) قبل قراءة النتائج
- تلميحات الاستخراج تشمل أسماء الأعمدة بالعربية والفرنسية والإنجليزية
- كل النصوص الجديدة مترجمة للغات السبع

### 📦 Upgrade Instructions
- ثبّت فوق النسخة القديمة مباشرة — بياناتك في `%APPDATA%\QuantumCommercePro\` محفوظة
- القادم من إصدار أقدم من 1.2.6-hotfix1: بياناتك تُنقل تلقائياً عند أول تشغيل

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
