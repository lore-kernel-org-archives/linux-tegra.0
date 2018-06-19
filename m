From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 3/5] ARM: tegra: Setup L2 cache using Trusted Foundations firmware
Date: Tue, 19 Jun 2018 14:00:25 +0300
Message-ID: <20180619110027.16935-4-digetx@gmail.com>
References: <20180619110027.16935-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180619110027.16935-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@armlinux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
List-Id: linux-tegra@vger.kernel.org

On Tegra20/30 L2 cache must be initialized using firmware call if CPU
is running in insecure mode. Initialize L2 cache and setup the outer-cache
callbacks in early boot using the firmware API.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/mach-tegra/tegra.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/mach-tegra/tegra.c b/arch/arm/mach-tegra/tegra.c
index f9587be48235..590b1cf1a8c4 100644
--- a/arch/arm/mach-tegra/tegra.c
+++ b/arch/arm/mach-tegra/tegra.c
@@ -38,6 +38,7 @@
 #include <soc/tegra/fuse.h>
 #include <soc/tegra/pmc.h>
 
+#include <asm/firmware.h>
 #include <asm/hardware/cache-l2x0.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/time.h>
@@ -70,9 +71,23 @@ u32 tegra_uart_config[3] = {
 	0,
 };
 
+static void __init tegra_trusted_foundations_l2x0_cache_init(void)
+{
+	if (IS_ENABLED(CONFIG_CACHE_L2X0) &&
+	    IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) &&
+	    of_machine_is_compatible("nvidia,tegra20"))
+		call_firmware_op(l2x0_init);
+
+	if (IS_ENABLED(CONFIG_CACHE_L2X0) &&
+	    IS_ENABLED(CONFIG_ARCH_TEGRA_3x_SOC) &&
+	    of_machine_is_compatible("nvidia,tegra30"))
+		call_firmware_op(l2x0_init);
+}
+
 static void __init tegra_init_early(void)
 {
 	of_register_trusted_foundations();
+	tegra_trusted_foundations_l2x0_cache_init();
 	tegra_cpu_reset_handler_init();
 }
 
-- 
2.17.1
