From: Kyle McMartin <kyle-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] tegra-cpuidle: provide stub when !CONFIG_CPU_IDLE
Date: Mon, 26 Aug 2013 11:30:51 -0400
Message-ID: <20130826153050.GC8764@redacted.bos.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

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

--- a/include/linux/tegra-cpuidle.h
+++ b/include/linux/tegra-cpuidle.h
@@ -14,6 +14,13 @@
 #ifndef __LINUX_TEGRA_CPUIDLE_H__
 #define __LINUX_TEGRA_CPUIDLE_H__
 
+#ifdef CONFIG_CPU_IDLE
 void tegra_cpuidle_pcie_irqs_in_use(void);
+#else
+static inline void tegra_cpuidle_pcie_irqs_in_use(void)
+{
+	return;
+}
+#endif
 
 #endif
