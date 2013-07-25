From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v5 02/16] ARM: tegra: Move pmc.h to include/linux/tegra-pmc.h
Date: Thu, 25 Jul 2013 10:53:16 -0700
Message-ID: <1374774810-18459-3-git-send-email-thierry.reding@gmail.com>
References: <1374774810-18459-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374774810-18459-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jay Agarwal <jagarwal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>

In preparation for moving the PCIe driver into the drivers/pci/host
directory, this header, which contains prototypes that are required by
the PCIe driver, needs to be moved to a globally visible location.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v2:
- keep tegra_pmc_init() prototype in arch/arm/mach-tegra/pmc.h
- move pmc.h to includex/linux/tegra-pmc.h

Changes in v3:
- update subject to match new location

 arch/arm/mach-tegra/pmc.h |  1 -
 include/linux/tegra-pmc.h | 23 +++++++++++++++++++++++
 2 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/tegra-pmc.h

diff --git a/arch/arm/mach-tegra/pmc.h b/arch/arm/mach-tegra/pmc.h
index cdb08a1..e1c2df2 100644
--- a/arch/arm/mach-tegra/pmc.h
+++ b/arch/arm/mach-tegra/pmc.h
@@ -37,6 +37,5 @@ int tegra_pmc_cpu_power_on(int cpuid);
 int tegra_pmc_cpu_remove_clamping(int cpuid);
 
 void tegra_pmc_init(void);
-void tegra_pmc_pcie_xclk_clamp(bool clamp);
 
 #endif
diff --git a/include/linux/tegra-pmc.h b/include/linux/tegra-pmc.h
new file mode 100644
index 0000000..b6296bf
--- /dev/null
+++ b/include/linux/tegra-pmc.h
@@ -0,0 +1,23 @@
+/*
+ * Copyright (C) 2012 NVIDIA CORPORATION. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+
+#ifndef __LINUX_TEGRA_PMC_H
+#define __LINUX_TEGRA_PMC_H
+
+void tegra_pmc_pcie_xclk_clamp(bool clamp);
+
+#endif
-- 
1.8.1.5
