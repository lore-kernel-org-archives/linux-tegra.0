From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 2/2] tegra-cpuidle: provide stub when !CONFIG_CPU_IDLE
Date: Tue, 27 Aug 2013 12:52:34 -0600
Message-ID: <1377629554-17490-3-git-send-email-swarren@wwwdotorg.org>
References: <1377629554-17490-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1377629554-17490-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kyle McMartin <kyle-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Kyle McMartin <kyle-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

While poking at something using the for-3.12/* trees, I hit the
following compile error:
drivers/built-in.o: In function `tegra_pcie_map_irq':
/builddir/build/BUILD/kernel-3.10.fc20/linux-3.11.0-0.rc6.git4.1.fc20.armv7hl/drivers/pci/host/pci-tegra.c:640:
undefined reference to `tegra_cpuidle_pcie_irqs_in_use'
drivers/built-in.o: In function `tegra_msi_map':
/builddir/build/BUILD/kernel-3.10.fc20/linux-3.11.0-0.rc6.git4.1.fc20.armv7hl/drivers/pci/host/pci-tegra.c:1227:
undefined reference to `tegra_cpuidle_pcie_irqs_in_use'
make: *** [vmlinux] Error 1

Since our .config had CONFIG_CPU_IDLE off. We should probably provide
an empty function to handle this to avoid cluttering up pci-tegra.c
with conditionals.

Signed-off-by: Kyle McMartin <kyle-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
[swarren, removed unnecessary return statement]
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 include/linux/tegra-cpuidle.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/tegra-cpuidle.h b/include/linux/tegra-cpuidle.h
index dda3647..9c6286b 100644
--- a/include/linux/tegra-cpuidle.h
+++ b/include/linux/tegra-cpuidle.h
@@ -14,6 +14,12 @@
 #ifndef __LINUX_TEGRA_CPUIDLE_H__
 #define __LINUX_TEGRA_CPUIDLE_H__
 
+#ifdef CONFIG_CPU_IDLE
 void tegra_cpuidle_pcie_irqs_in_use(void);
+#else
+static inline void tegra_cpuidle_pcie_irqs_in_use(void)
+{
+}
+#endif
 
 #endif
-- 
1.8.1.5
