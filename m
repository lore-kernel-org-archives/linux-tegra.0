From: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v6 1/4] usb: otg: Add ulpi viewport access ops
Date: Wed,  9 Mar 2011 16:28:54 -0800
Message-ID: <1299716937-17704-2-git-send-email-benoit@android.com>
References: <1299716937-17704-1-git-send-email-benoit@android.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1299716937-17704-1-git-send-email-benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Brownell <dbrownell-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add generic access ops for controllers with a ulpi viewport register
(e.g. Chipidea/ARC based controllers).

Signed-off-by: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
---
 drivers/usb/otg/Kconfig         |    7 +++
 drivers/usb/otg/Makefile        |    1 +
 drivers/usb/otg/ulpi_viewport.c |   80 +++++++++++++++++++++++++++++++++++++++
 include/linux/usb/ulpi.h        |    5 ++
 4 files changed, 93 insertions(+), 0 deletions(-)
 create mode 100644 drivers/usb/otg/ulpi_viewport.c

diff --git a/drivers/usb/otg/Kconfig b/drivers/usb/otg/Kconfig
index ceb24fe..daf3e5f 100644
--- a/drivers/usb/otg/Kconfig
+++ b/drivers/usb/otg/Kconfig
@@ -49,6 +49,13 @@ config USB_ULPI
 	  Enable this to support ULPI connected USB OTG transceivers which
 	  are likely found on embedded boards.
 
+config USB_ULPI_VIEWPORT
+	bool
+	depends on USB_ULPI
+	help
+	  Provides read/write operations to the ULPI phy register set for
+	  controllers with a viewport register (e.g. Chipidea/ARC controllers).
+
 config TWL4030_USB
 	tristate "TWL4030 USB Transceiver Driver"
 	depends on TWL4030_CORE && REGULATOR_TWL4030
diff --git a/drivers/usb/otg/Makefile b/drivers/usb/otg/Makefile
index e516894..e22d917 100644
--- a/drivers/usb/otg/Makefile
+++ b/drivers/usb/otg/Makefile
@@ -16,5 +16,6 @@ obj-$(CONFIG_TWL6030_USB)	+= twl6030-usb.o
 obj-$(CONFIG_USB_LANGWELL_OTG)	+= langwell_otg.o
 obj-$(CONFIG_NOP_USB_XCEIV)	+= nop-usb-xceiv.o
 obj-$(CONFIG_USB_ULPI)		+= ulpi.o
+obj-$(CONFIG_USB_ULPI_VIEWPORT)	+= ulpi_viewport.o
 obj-$(CONFIG_USB_MSM_OTG)	+= msm_otg.o
 obj-$(CONFIG_AB8500_USB)	+= ab8500-usb.o
diff --git a/drivers/usb/otg/ulpi_viewport.c b/drivers/usb/otg/ulpi_viewport.c
new file mode 100644
index 0000000..e9a37f9
--- /dev/null
+++ b/drivers/usb/otg/ulpi_viewport.c
@@ -0,0 +1,80 @@
+/*
+ * Copyright (C) 2011 Google, Inc.
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#include <linux/kernel.h>
+#include <linux/usb.h>
+#include <linux/io.h>
+#include <linux/usb/otg.h>
+#include <linux/usb/ulpi.h>
+
+#define ULPI_VIEW_WAKEUP	(1 << 31)
+#define ULPI_VIEW_RUN		(1 << 30)
+#define ULPI_VIEW_WRITE		(1 << 29)
+#define ULPI_VIEW_READ		(0 << 29)
+#define ULPI_VIEW_ADDR(x)	(((x) & 0xff) << 16)
+#define ULPI_VIEW_DATA_READ(x)	(((x) >> 8) & 0xff)
+#define ULPI_VIEW_DATA_WRITE(x)	((x) & 0xff)
+
+static int ulpi_viewport_wait(void __iomem *view, u32 mask)
+{
+	unsigned long usec = 2000;
+
+	while (usec--) {
+		if (!(readl(view) & mask))
+			return 0;
+
+		udelay(1);
+	};
+
+	return -ETIMEDOUT;
+}
+
+static int ulpi_viewport_read(struct otg_transceiver *otg, u32 reg)
+{
+	int ret;
+	void __iomem *view = otg->io_priv;
+
+	writel(ULPI_VIEW_WAKEUP | ULPI_VIEW_WRITE, view);
+	ret = ulpi_viewport_wait(view, ULPI_VIEW_WAKEUP);
+	if (ret)
+		return ret;
+
+	writel(ULPI_VIEW_RUN | ULPI_VIEW_READ | ULPI_VIEW_ADDR(reg), view);
+	ret = ulpi_viewport_wait(view, ULPI_VIEW_RUN);
+	if (ret)
+		return ret;
+
+	return ULPI_VIEW_DATA_READ(readl(view));
+}
+
+static int ulpi_viewport_write(struct otg_transceiver *otg, u32 val, u32 reg)
+{
+	int ret;
+	void __iomem *view = otg->io_priv;
+
+	writel(ULPI_VIEW_WAKEUP | ULPI_VIEW_WRITE, view);
+	ret = ulpi_viewport_wait(view, ULPI_VIEW_WAKEUP);
+	if (ret)
+		return ret;
+
+	writel(ULPI_VIEW_RUN | ULPI_VIEW_WRITE | ULPI_VIEW_DATA_WRITE(val) |
+						 ULPI_VIEW_ADDR(reg), view);
+
+	return ulpi_viewport_wait(view, ULPI_VIEW_RUN);
+}
+
+struct otg_io_access_ops ulpi_viewport_access_ops = {
+	.read	= ulpi_viewport_read,
+	.write	= ulpi_viewport_write,
+};
diff --git a/include/linux/usb/ulpi.h b/include/linux/usb/ulpi.h
index 82b1507..9595796 100644
--- a/include/linux/usb/ulpi.h
+++ b/include/linux/usb/ulpi.h
@@ -184,4 +184,9 @@
 struct otg_transceiver *otg_ulpi_create(struct otg_io_access_ops *ops,
 					unsigned int flags);
 
+#ifdef CONFIG_USB_ULPI_VIEWPORT
+/* access ops for controllers with a viewport register */
+extern struct otg_io_access_ops ulpi_viewport_access_ops;
+#endif
+
 #endif /* __LINUX_USB_ULPI_H */
-- 
1.7.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
