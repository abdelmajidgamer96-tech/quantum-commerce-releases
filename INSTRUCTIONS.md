# INSTRUCTIONS — Quantum Commerce Pro v1.2.6

---

# 🇩🇿 التعليمات بالعربية

## متطلبات النظام
- Windows 10 / 11 (64-bit)
- مساحة قرص حرة: 200 MB كحد أدنى
- لا يلزم تثبيت Node.js — مدمج في الحزمة

## خطوات التثبيت

1. **تحميل الملف:**
   - حمّل `QuantumCommercePro-Setup-v1.1.0.exe` من الرابط الرسمي:
     https://www.mediafire.com/file/70dgv1q51pnsbjs/QuantumCommercePro-Setup-v1.1.0.exe/file

2. **تشغيل الإعداد:**
   - انقر بزر الماوس الأيمن على الملف
   - اختر **"Run as Administrator"** (تشغيل كمسؤول)
   - اتبع الخطوات: Next > Next > Install

3. **مسار التثبيت الافتراضي:**
   ```
   C:\Program Files\Quantum Commerce Pro\
   ```

4. **التشغيل الأول:**
   - بعد انتهاء التثبيت، ستجد أيقونة **"Quantum Commerce Pro"** على سطح المكتب
   - انقر عليها مرتين لتشغيل البرنامج
   - سيفتح المتصفح تلقائياً على: `http://localhost:3000`

5. **إدخال مفتاح التفعيل:**
   - ادخل إلى **الإعدادات** > **تفعيل الترخيص**
   - الصق مفتاح التفعيل الذي حصلت عليه
   - اضغط **تفعيل**

## الحصول على مفتاح التفعيل

تواصل عبر واتساب: https://wa.me/213791140239

| نوع الترخيص | الوصف |
|-------------|-------|
| QCP-STORE | ترخيص متجر واحد مدى الحياة |
| QCP-ENTERPRISE | ترخيص مؤسسة متعددة الفروع مدى الحياة |
| QCP-MAINT | اشتراك صيانة وتحديثات سنوي |

## استكشاف الأخطاء

### البرنامج لا يفتح بعد النقر على الأيقونة
1. انتظر 15 ثانية ثم افتح المتصفح يدوياً على: `http://localhost:3000`
2. تأكد من أن مضاد الفيروسات لا يحجب `node.exe`
3. شغّل `Start_Quantum_Commerce.bat` من مجلد التثبيت

### صفحة "Connection Refused" في المتصفح
1. انتظر 30 ثانية إضافية (وقت تحميل قاعدة البيانات)
2. جرب: `http://127.0.0.1:3000`
3. تحقق من أن المنفذ 3000 غير محجوب من Windows Firewall

### مفتاح التفعيل يظهر كغير صالح
1. تأكد من نسخ المفتاح كاملاً بدون مسافات زائدة
2. المفتاح حساس للحالة (uppercase)
3. تواصل مع المطور: https://wa.me/213791140239

### البرنامج لا يبدأ تلقائياً مع Windows
1. شغّل البرنامج يدوياً مرة واحدة كـ Administrator
2. ادخل الإعدادات وفعّل خيار "بدء التشغيل التلقائي"

## إلغاء التثبيت
1. افتح "إضافة أو إزالة البرامج"
2. ابحث عن "Quantum Commerce Pro"
3. اضغط **إلغاء التثبيت**

---

# 🇺🇸 Instructions in English

## System Requirements
- Windows 10 / 11 (64-bit)
- Free disk space: minimum 200 MB
- No Node.js installation required — bundled inside the package

## Installation Steps

1. **Download the file:**
   - Download `QuantumCommercePro-Setup-v1.1.0.exe` from the official link:
     https://www.mediafire.com/file/70dgv1q51pnsbjs/QuantumCommercePro-Setup-v1.1.0.exe/file

2. **Run the setup:**
   - Right-click on the downloaded file
   - Select **"Run as Administrator"**
   - Follow the steps: Next > Next > Install

3. **Default installation path:**
   ```
   C:\Program Files\Quantum Commerce Pro\
   ```

4. **First launch:**
   - After installation, find the **"Quantum Commerce Pro"** icon on your Desktop
   - Double-click it to launch the application
   - Your browser will open automatically at: `http://localhost:3000`

5. **Entering your activation key:**
   - Go to **Settings** > **License Activation**
   - Paste the activation key you received
   - Click **Activate**

## Getting an Activation Key

Contact the developer via WhatsApp: https://wa.me/213791140239

| License Type | Description |
|--------------|-------------|
| QCP-STORE | Single store — lifetime ownership |
| QCP-ENTERPRISE | Multi-branch enterprise — lifetime |
| QCP-MAINT | Annual maintenance & updates subscription |

## Troubleshooting

### App doesn't open after clicking the icon
1. Wait 15 seconds then open your browser manually at: `http://localhost:3000`
2. Make sure your antivirus is not blocking `node.exe`
3. Run `Start_Quantum_Commerce.bat` from the installation folder as an alternative

### "Connection Refused" page in browser
1. Wait an additional 30 seconds (database loading time)
2. Try: `http://127.0.0.1:3000` instead of `localhost`
3. Check that port 3000 is not blocked by Windows Firewall

### Activation key shows as invalid
1. Make sure you copied the full key without extra spaces
2. The key is case-sensitive (must be uppercase)
3. Contact the developer to verify: https://wa.me/213791140239

### App doesn't start automatically with Windows
1. Run the app manually once as Administrator
2. Go to Settings and enable the "Auto-start with Windows" option

## Uninstallation
1. Open "Add or Remove Programs"
2. Search for "Quantum Commerce Pro"
3. Click **Uninstall**

> **Note:** Your data folder will be kept at:
> `C:\Program Files\Quantum Commerce Pro\data\`

---

## Support / الدعم الفني

- **WhatsApp:** https://wa.me/213791140239
- **Website / الموقع:** https://abdelmajidgamer96-tech.github.io/quantum-commerce-releases/
- **GitHub Issues:** https://github.com/abdelmajidgamer96-tech/quantum-commerce-releases/issues
