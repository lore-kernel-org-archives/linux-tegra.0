From: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/3] ARM: tegra: Add SMMU enabler in AHB
Date: Mon, 23 Apr 2012 14:37:22 +0300
Message-ID: <1335181043-15348-2-git-send-email-hdoyu@nvidia.com>
References: <1335181043-15348-1-git-send-email-hdoyu@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1335181043-15348-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, H Hartley Sweeten <hsweeten-3FF4nKcrg1dE2c76skzGb0EOCMrvLtNR@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add extern func, "tegra_ahb_enable_smmu()" to inform AHB that SMMU is
ready.

Signed-off-by: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/include/mach/tegra-ahb.h |   19 +++++++++++++++++++
 arch/arm/mach-tegra/tegra-ahb.c              |   19 +++++++++++++++++++
 2 files changed, 38 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/include/mach/tegra-ahb.h b/arch/arm/mach-tegra/include/mach/tegra-ahb.h
new file mode 100644
index 0000000..51a5800
--- /dev/null
+++ b/arch/arm/mach-tegra/include/mach/tegra-ahb.h
@@ -0,0 +1,19 @@
+/*
+ * Copyright (c) 2012, NVIDIA CORPORATION.  All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ */
+
+#ifndef __MACH_TEGRA_AHB_H__
+#define __MACH_TEGRA_AHB_H__
+
+extern void tegra_ahb_enable_smmu(void);
+
+#endif	/* __MACH_TEGRA_AHB_H__ */
diff --git a/arch/arm/mach-tegra/tegra-ahb.c b/arch/arm/mach-tegra/tegra-ahb.c
index 411b51f..40877fa 100644
--- a/arch/arm/mach-tegra/tegra-ahb.c
+++ b/arch/arm/mach-tegra/tegra-ahb.c
@@ -20,6 +20,7 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/io.h>
 #include <linux/syscore_ops.h>
 
@@ -74,6 +75,9 @@
 
 #define AHB_ARBITRATION_AHB_MEM_WRQUE_MST_ID	0xf8
 
+#define AHB_ARBITRATION_XBAR_CTRL_SMMU_INIT_DONE_DONE	1
+#define AHB_ARBITRATION_XBAR_CTRL_SMMU_INIT_DONE_SHIFT	17
+
 static inline unsigned long gizmo_readl(unsigned long offset)
 {
 	return readl(IO_TO_VIRT(TEGRA_AHB_GIZMO_BASE + offset));
@@ -84,6 +88,21 @@ static inline void gizmo_writel(unsigned long value, unsigned long offset)
 	writel(value, IO_TO_VIRT(TEGRA_AHB_GIZMO_BASE + offset));
 }
 
+#ifdef CONFIG_ARCH_TEGRA_3x_SOC
+
+void tegra_ahb_enable_smmu(void)
+{
+	unsigned long val;
+
+	val = gizmo_readl(AHB_ARBITRATION_XBAR_CTRL);
+	val |= AHB_ARBITRATION_XBAR_CTRL_SMMU_INIT_DONE_DONE <<
+		AHB_ARBITRATION_XBAR_CTRL_SMMU_INIT_DONE_SHIFT;
+	gizmo_writel(val, AHB_ARBITRATION_XBAR_CTRL);
+}
+EXPORT_SYMBOL(tegra_ahb_enable_smmu);
+
+#endif
+
 #ifdef CONFIG_PM
 
 struct __ahb_gizmo {
-- 
1.7.5.4
