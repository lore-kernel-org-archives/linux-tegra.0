From: Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] [ARM] tegra: syncpt: Move syncpt handling to syncpt.c
Date: Thu,  7 Apr 2011 14:10:01 -0700
Message-ID: <1302210601-18193-1-git-send-email-rmorell@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org, Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>

Signed-off-by: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---

Colin, this patch is missing from the linux-tegra-2.6.36, linux-tegra-2.6.37
branches (as well as their android- variants).  I cherry-picked it from the
android-tegra-2.6.36-honeycomb tree (the only changes were to remove the
ChangeId and add my S-o-b).  It was applied to the chromeos-2.6.36 and
chromeos-2.6.37 trees a while back as well.

I've tripped over this when bringing up both Seaboard and Trimslice devices on
branches based on linux-tegra-2.6.36; the symptom of not having this patch is
that we never get syncpoint threshold interrupt notification and end up hanging
the first time we wait for one.

Can this be pulled into the linux-tegra branches so that nobody else trips on
this?

Thanks.

 arch/arm/mach-tegra/Makefile |    1 +
 arch/arm/mach-tegra/syncpt.c |  100 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 101 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-tegra/syncpt.c

diff --git a/arch/arm/mach-tegra/Makefile b/arch/arm/mach-tegra/Makefile
index 6d50f34..356ee56 100644
--- a/arch/arm/mach-tegra/Makefile
+++ b/arch/arm/mach-tegra/Makefile
@@ -1,6 +1,7 @@
 obj-y                                   += common.o
 obj-y                                   += io.o
 obj-y                                   += irq.o legacy_irq.o
+obj-y					+= syncpt.o
 obj-y                                   += clock.o
 obj-y                                   += dvfs.o
 obj-y                                   += timer.o
diff --git a/arch/arm/mach-tegra/syncpt.c b/arch/arm/mach-tegra/syncpt.c
new file mode 100644
index 0000000..bb649a9
--- /dev/null
+++ b/arch/arm/mach-tegra/syncpt.c
@@ -0,0 +1,100 @@
+/*
+ * Copyright (C) 2010 Google, Inc.
+ *
+ * Author:
+ *	Erik Gilling <konkers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
+ *
+ * Copyright (C) 2010, NVIDIA Corporation
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
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/io.h>
+
+#include <mach/iomap.h>
+#include <mach/irqs.h>
+
+#define HOST1X_SYNC_OFFSET 0x3000
+#define HOST1X_SYNC_SIZE 0x800
+enum {
+	HOST1X_SYNC_SYNCPT_THRESH_CPU0_INT_STATUS = 0x40,
+	HOST1X_SYNC_SYNCPT_THRESH_INT_DISABLE = 0x60
+};
+
+static void syncpt_thresh_mask(unsigned int irq)
+{
+	(void)irq;
+}
+
+static void syncpt_thresh_unmask(unsigned int irq)
+{
+	(void)irq;
+}
+
+static void syncpt_thresh_cascade(unsigned int irq, struct irq_desc *desc)
+{
+	void __iomem *sync_regs = get_irq_desc_data(desc);
+	u32 reg;
+	int id;
+
+	desc->chip->ack(irq);
+
+	reg = readl(sync_regs + HOST1X_SYNC_SYNCPT_THRESH_CPU0_INT_STATUS);
+
+	while ((id = __fls(reg)) >= 0) {
+		reg ^= BIT(id);
+		generic_handle_irq(id + INT_SYNCPT_THRESH_BASE);
+	}
+
+	desc->chip->unmask(irq);
+}
+
+static struct irq_chip syncpt_thresh_irq = {
+	.name		= "syncpt",
+	.mask		= syncpt_thresh_mask,
+	.unmask		= syncpt_thresh_unmask
+};
+
+static int __init syncpt_init_irq(void)
+{
+	void __iomem *sync_regs;
+	unsigned int i;
+	int irq;
+
+	sync_regs = ioremap(TEGRA_HOST1X_BASE + HOST1X_SYNC_OFFSET,
+			HOST1X_SYNC_SIZE);
+	BUG_ON(!sync_regs);
+
+	writel(0xffffffffUL,
+		sync_regs + HOST1X_SYNC_SYNCPT_THRESH_INT_DISABLE);
+	writel(0xffffffffUL,
+		sync_regs + HOST1X_SYNC_SYNCPT_THRESH_CPU0_INT_STATUS);
+
+	for (i = 0; i < INT_SYNCPT_THRESH_NR; i++) {
+		irq = INT_SYNCPT_THRESH_BASE + i;
+		set_irq_chip(irq, &syncpt_thresh_irq);
+		set_irq_chip_data(irq, sync_regs);
+		set_irq_handler(irq, handle_simple_irq);
+		set_irq_flags(irq, IRQF_VALID);
+	}
+	if (set_irq_data(INT_HOST1X_MPCORE_SYNCPT, sync_regs))
+		BUG();
+	set_irq_chained_handler(INT_HOST1X_MPCORE_SYNCPT,
+				syncpt_thresh_cascade);
+
+	return 0;
+}
+
+core_initcall(syncpt_init_irq);
-- 
1.7.3.4
