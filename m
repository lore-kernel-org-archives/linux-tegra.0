From: Hiroshi Doyu <hdoyu@nvidia.com>
Subject: [v3 1/1] driver-core: Shut up dev_dbg_reatelimited() without DEBUG
Date: Tue, 4 Sep 2012 06:40:40 +0200
Message-ID: <20120904.074040.1817050383890381031.hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Hiroshi Doyu <hdoyu@nvidia.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "htl10@users.sourceforge.net" <htl10@users.sourceforge.net>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "joe@perches.com" <joe@perches.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "crope@iki.fi" <crope@iki.fi>
List-Id: linux-tegra@vger.kernel.org

dev_dbg_reatelimited() without DEBUG printed "217078 callbacks
suppressed". This shouldn't print anything without DEBUG.

With CONFIG_DYNAMIC_DEBUG, the print should be configured as expected.

Signed-off-by: Hiroshi Doyu <hdoyu@nvidia.com>
Reported-by: Hin-Tak Leung <htl10@users.sourceforge.net>
Tested-by: Antti Palosaari <crope@iki.fi>
Tested-by: Hin-Tak Leung <htl10@users.sourceforge.net>
Acked-by: Hin-Tak Leung <htl10@users.sourceforge.net>
---
 include/linux/device.h |   62 +++++++++++++++++++++++++++++------------------
 1 files changed, 38 insertions(+), 24 deletions(-)

diff --git a/include/linux/device.h b/include/linux/device.h
index 9648331..bb6ffcb 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -932,6 +932,32 @@ int _dev_info(const struct device *dev, const char *fmt, ...)
 
 #endif
 
+/*
+ * Stupid hackaround for existing uses of non-printk uses dev_info
+ *
+ * Note that the definition of dev_info below is actually _dev_info
+ * and a macro is used to avoid redefining dev_info
+ */
+
+#define dev_info(dev, fmt, arg...) _dev_info(dev, fmt, ##arg)
+
+#if defined(CONFIG_DYNAMIC_DEBUG)
+#define dev_dbg(dev, format, ...)		     \
+do {						     \
+	dynamic_dev_dbg(dev, format, ##__VA_ARGS__); \
+} while (0)
+#elif defined(DEBUG)
+#define dev_dbg(dev, format, arg...)		\
+	dev_printk(KERN_DEBUG, dev, format, ##arg)
+#else
+#define dev_dbg(dev, format, arg...)				\
+({								\
+	if (0)							\
+		dev_printk(KERN_DEBUG, dev, format, ##arg);	\
+	0;							\
+})
+#endif
+
 #define dev_level_ratelimited(dev_level, dev, fmt, ...)			\
 do {									\
 	static DEFINE_RATELIMIT_STATE(_rs,				\
@@ -955,33 +981,21 @@ do {									\
 	dev_level_ratelimited(dev_notice, dev, fmt, ##__VA_ARGS__)
 #define dev_info_ratelimited(dev, fmt, ...)				\
 	dev_level_ratelimited(dev_info, dev, fmt, ##__VA_ARGS__)
+#if defined(CONFIG_DYNAMIC_DEBUG) || defined(DEBUG)
 #define dev_dbg_ratelimited(dev, fmt, ...)				\
-	dev_level_ratelimited(dev_dbg, dev, fmt, ##__VA_ARGS__)
-
-/*
- * Stupid hackaround for existing uses of non-printk uses dev_info
- *
- * Note that the definition of dev_info below is actually _dev_info
- * and a macro is used to avoid redefining dev_info
- */
-
-#define dev_info(dev, fmt, arg...) _dev_info(dev, fmt, ##arg)
-
-#if defined(CONFIG_DYNAMIC_DEBUG)
-#define dev_dbg(dev, format, ...)		     \
-do {						     \
-	dynamic_dev_dbg(dev, format, ##__VA_ARGS__); \
+do {									\
+	static DEFINE_RATELIMIT_STATE(_rs,				\
+				      DEFAULT_RATELIMIT_INTERVAL,	\
+				      DEFAULT_RATELIMIT_BURST);		\
+	DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, fmt);			\
+	if (unlikely(descriptor.flags & _DPRINTK_FLAGS_PRINT) &&	\
+	    __ratelimit(&_rs))						\
+		__dynamic_pr_debug(&descriptor, pr_fmt(fmt),		\
+				   ##__VA_ARGS__);			\
 } while (0)
-#elif defined(DEBUG)
-#define dev_dbg(dev, format, arg...)		\
-	dev_printk(KERN_DEBUG, dev, format, ##arg)
 #else
-#define dev_dbg(dev, format, arg...)				\
-({								\
-	if (0)							\
-		dev_printk(KERN_DEBUG, dev, format, ##arg);	\
-	0;							\
-})
+#define dev_dbg_ratelimited(dev, fmt, ...)			\
+	no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
 #endif
 
 #ifdef VERBOSE_DEBUG
-- 
1.7.5.4
