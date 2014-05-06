From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: tegra: Support reboot modes
Date: Tue,  6 May 2014 17:04:11 +0200
Message-ID: <1399388651-12819-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The boot ROM on Tegra SoCs supports booting into forced recovery mode
(RCM) by setting a bit in the PMC scratch register 0. Similarily, the
Android bootloader examines some of the bits in this register to disable
autoboot or enter recovery mode.

Support these modes by setting the corresponding bits depending on the
specified reboot command (forced-recovery, bootloader, recovery). Recent
systemd-based distributions allow this to be specified using an optional
argument to the reboot command.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/pmc.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/mach-tegra/pmc.c b/arch/arm/mach-tegra/pmc.c
index fb7920201ab4..7c7123e7557b 100644
--- a/arch/arm/mach-tegra/pmc.c
+++ b/arch/arm/mach-tegra/pmc.c
@@ -41,6 +41,14 @@
 #define PMC_REMOVE_CLAMPING		0x34
 #define PMC_PWRGATE_STATUS		0x38
 
+#define PMC_SCRATCH0			0x50
+#define PMC_SCRATCH0_MODE_RECOVERY	(1 << 31)
+#define PMC_SCRATCH0_MODE_BOOTLOADER	(1 << 30)
+#define PMC_SCRATCH0_MODE_RCM		(1 << 1)
+#define PMC_SCRATCH0_MODE_MASK		(PMC_SCRATCH0_MODE_RECOVERY | \
+					 PMC_SCRATCH0_MODE_BOOTLOADER | \
+					 PMC_SCRATCH0_MODE_RCM)
+
 #define PMC_CPUPWRGOOD_TIMER	0xc8
 #define PMC_CPUPWROFF_TIMER	0xcc
 
@@ -165,6 +173,22 @@ void tegra_pmc_restart(enum reboot_mode mode, const char *cmd)
 {
 	u32 val;
 
+	val = tegra_pmc_readl(PMC_SCRATCH0);
+	val &= ~PMC_SCRATCH0_MODE_MASK;
+
+	if (cmd) {
+		if (strcmp(cmd, "recovery") == 0)
+			val |= PMC_SCRATCH0_MODE_RECOVERY;
+
+		if (strcmp(cmd, "bootloader") == 0)
+			val |= PMC_SCRATCH0_MODE_BOOTLOADER;
+
+		if (strcmp(cmd, "forced-recovery") == 0)
+			val |= PMC_SCRATCH0_MODE_RCM;
+	}
+
+	tegra_pmc_writel(val, PMC_SCRATCH0);
+
 	val = tegra_pmc_readl(0);
 	val |= 0x10;
 	tegra_pmc_writel(val, 0);
-- 
1.9.2
