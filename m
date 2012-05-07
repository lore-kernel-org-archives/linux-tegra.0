From: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv5 2/3] ARM: tegra: Add SMMU enabler in AHB
Date: Mon,  7 May 2012 09:43:46 +0300
Message-ID: <1336373032-16881-2-git-send-email-hdoyu@nvidia.com>
References: <1336373032-16881-1-git-send-email-hdoyu@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1336373032-16881-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, H Hartley Sweeten <hsweeten-3FF4nKcrg1dE2c76skzGb0EOCMrvLtNR@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add extern func, "tegra_ahb_enable_smmu()" to inform AHB that SMMU is
ready.

Signed-off-by: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
---
 arch/arm/mach-tegra/include/mach/tegra-ahb.h |   19 +++++++++++++++
 drivers/amba/tegra-ahb.c                     |   32 ++++++++++++++++++++++++++
 2 files changed, 51 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/include/mach/tegra-ahb.h b/arch/arm/mach-tegra/include/mach/tegra-ahb.h
new file mode 100644
index 0000000..e0f8c84
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
+extern int tegra_ahb_enable_smmu(struct device_node *ahb);
+
+#endif	/* __MACH_TEGRA_AHB_H__ */
diff --git a/drivers/amba/tegra-ahb.c b/drivers/amba/tegra-ahb.c
index 106a780..aa0b1f1 100644
--- a/drivers/amba/tegra-ahb.c
+++ b/drivers/amba/tegra-ahb.c
@@ -76,6 +76,10 @@
 
 #define AHB_ARBITRATION_AHB_MEM_WRQUE_MST_ID	0xf8
 
+#define AHB_ARBITRATION_XBAR_CTRL_SMMU_INIT_DONE BIT(17)
+
+static struct platform_driver tegra_ahb_driver;
+
 static const u32 tegra_ahb_gizmo[] = {
 	AHB_ARBITRATION_DISABLE,
 	AHB_ARBITRATION_PRIORITY_CTRL,
@@ -124,6 +128,34 @@ static inline void gizmo_writel(struct tegra_ahb *ahb, u32 value, u32 offset)
 	writel(value, ahb->regs + offset);
 }
 
+#ifdef CONFIG_ARCH_TEGRA_3x_SOC
+static int tegra_ahb_match_by_smmu(struct device *dev, void *data)
+{
+	struct tegra_ahb *ahb = dev_get_drvdata(dev);
+	struct device_node *dn = data;
+
+	return (ahb->dev->of_node == dn) ? 1 : 0;
+}
+
+int tegra_ahb_enable_smmu(struct device_node *dn)
+{
+	struct device *dev;
+	u32 val;
+	struct tegra_ahb *ahb;
+
+	dev = driver_find_device(&tegra_ahb_driver.driver, NULL, dn,
+				 tegra_ahb_match_by_smmu);
+	if (!dev)
+		return -EPROBE_DEFER;
+	ahb = dev_get_drvdata(dev);
+	val = gizmo_readl(ahb, AHB_ARBITRATION_XBAR_CTRL);
+	val |= AHB_ARBITRATION_XBAR_CTRL_SMMU_INIT_DONE;
+	gizmo_writel(ahb, val, AHB_ARBITRATION_XBAR_CTRL);
+	return 0;
+}
+EXPORT_SYMBOL(tegra_ahb_enable_smmu);
+#endif
+
 static int tegra_ahb_suspend(struct device *dev)
 {
 	int i;
-- 
1.7.5.4
