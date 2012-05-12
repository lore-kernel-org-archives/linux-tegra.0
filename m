From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC 1/1] driver core: Add dev_*_ratelimited() family
Date: Sat, 12 May 2012 12:52:27 +0200
Message-ID: <20120512.135227.1196366807162247040.hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

An unclosed "if" statement in the MACRO seems a bit risky, but I don't
have any better/simple solution for this, ATM. Is there any alternative?


From: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add dev_*_ratelimited() family, dev_* version of pr_*_ratelimited().

Signed-off-by: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 include/linux/device.h |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/include/linux/device.h b/include/linux/device.h
index 8b9d03a..9d976df 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -23,6 +23,7 @@
 #include <linux/mutex.h>
 #include <linux/pm.h>
 #include <linux/atomic.h>
+#include <linux/ratelimit.h>
 #include <asm/device.h>
 
 struct device;
@@ -937,6 +938,27 @@ int _dev_info(const struct device *dev, const char *fmt, ...)
 
 #endif
 
+#define IF_DEV_RATELIMITED						\
+	static DEFINE_RATELIMIT_STATE(_rs,				\
+				      DEFAULT_RATELIMIT_INTERVAL,	\
+				      DEFAULT_RATELIMIT_BURST);		\
+	if (__ratelimit(&_rs))
+
+#define dev_emerg_ratelimited(dev, fmt, ...)				\
+	do { IF_DEV_RATELIMITED dev_printk(KERN_EMERG, dev, fmt, ##__VA_ARGS__); } while (0)
+#define dev_alert_ratelimited(dev, fmt, ...)				\
+	do { IF_DEV_RATELIMITED dev_printk(KERN_ALERT, dev, fmt, ##__VA_ARGS__); } while (0)
+#define dev_crit_ratelimited(dev, fmt, ...)				\
+	do { IF_DEV_RATELIMITED dev_printk(KERN_CRIT, dev, fmt, ##__VA_ARGS__); } while (0)
+#define dev_err_ratelimited(dev, fmt, ...)				\
+	do { IF_DEV_RATELIMITED dev_printk(KERN_ERR, dev, fmt, ##__VA_ARGS__); } while (0)
+#define dev_warn_ratelimited(dev, fmt, ...)				\
+	do { IF_DEV_RATELIMITED dev_printk(KERN_WARNING, dev, fmt, ##__VA_ARGS__); } while (0)
+#define dev_notice_ratelimited(dev, fmt, ...)				\
+	do { IF_DEV_RATELIMITED dev_printk(KERN_NOTICE, dev, fmt, ##__VA_ARGS__); } while (0)
+#define dev_info_ratelimited(dev, fmt, ...)				\
+	do { IF_DEV_RATELIMITED dev_printk(KERN_INFO, dev, fmt, ##__VA_ARGS__); } while (0)
+
 /*
  * Stupid hackaround for existing uses of non-printk uses dev_info
  *
-- 
1.7.5.4
