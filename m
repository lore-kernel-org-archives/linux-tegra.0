From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v5 4/8] ARM: tegra: Set up L2 cache using Trusted Foundations firmware
Date: Fri, 22 Feb 2019 20:59:22 +0300
Message-ID: <20190222175926.23366-5-digetx@gmail.com>
References: <20190222175926.23366-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190222175926.23366-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@armlinux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Robert Yang <decatf@gmail.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tegra30 L2 cache should be initialized using firmware call if CPU is
running in insecure mode. Initialize L2 cache and set up the outer-cache
callbacks early during boot using the firmware API.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/mach-tegra/tegra.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/mach-tegra/tegra.c b/arch/arm/mach-tegra/tegra.c
index f9587be48235..67d8ae60ac67 100644
--- a/arch/arm/mach-tegra/tegra.c
+++ b/arch/arm/mach-tegra/tegra.c
@@ -38,6 +38,7 @@
 #include <soc/tegra/fuse.h>
 #include <soc/tegra/pmc.h>
 
+#include <asm/firmware.h>
 #include <asm/hardware/cache-l2x0.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/time.h>
@@ -70,9 +71,18 @@ u32 tegra_uart_config[3] = {
 	0,
 };
 
+static void __init tegra_trusted_foundations_l2x0_cache_init(void)
+{
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
2.20.1
