From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: tegra: Provide dummy powergate implementation
Date: Fri, 22 Nov 2013 21:23:32 +0100
Message-ID: <1385151812-17270-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

In order to support increased build test coverage for drivers, implement
dummies for the powergate implementation. This will allow the drivers to
be built without requiring support for Tegra to be selected.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 include/linux/tegra-powergate.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/linux/tegra-powergate.h b/include/linux/tegra-powergate.h
index c98cfa406952..fd4498329c7c 100644
--- a/include/linux/tegra-powergate.h
+++ b/include/linux/tegra-powergate.h
@@ -45,6 +45,7 @@ struct clk;
 
 #define TEGRA_POWERGATE_3D0	TEGRA_POWERGATE_3D
 
+#ifdef CONFIG_ARCH_TEGRA
 int tegra_powergate_is_powered(int id);
 int tegra_powergate_power_on(int id);
 int tegra_powergate_power_off(int id);
@@ -52,5 +53,31 @@ int tegra_powergate_remove_clamping(int id);
 
 /* Must be called with clk disabled, and returns with clk enabled */
 int tegra_powergate_sequence_power_up(int id, struct clk *clk);
+#else
+static inline int tegra_powergate_is_powered(int id)
+{
+	return -ENOSYS;
+}
+
+static inline int tegra_powergate_power_on(int id)
+{
+	return -ENOSYS;
+}
+
+static inline int tegra_powergate_power_off(int id)
+{
+	return -ENOSYS;
+}
+
+static inline int tegra_powergate_remove_clamping(int id)
+{
+	return -ENOSYS;
+}
+
+static inline int tegra_powergate_sequence_power_up(int id, struct clk *clk)
+{
+	return -ENOSYS;
+}
+#endif
 
 #endif /* _MACH_TEGRA_POWERGATE_H_ */
-- 
1.8.4.2
