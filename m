From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v6 4/7] ARM: tegra: Set up L2 cache using Trusted Foundations firmware
Date: Fri, 22 Feb 2019 22:34:23 +0300
Message-ID: <20190222193426.10747-5-digetx@gmail.com>
References: <20190222193426.10747-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190222193426.10747-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@armlinux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Robert Yang <decatf@gmail.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tegra30 L2 cache should be initialized using firmware call if CPU
is running in insecure mode. Set up the required outer-cache write_sec()
callback early during boot using the firmware API, it is always a NO-OP
on T114+ and is NO-OP on T20/30 if Trusted Foundations firmware node
isn't present in device-tree.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/mach-tegra/tegra.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-tegra/tegra.c b/arch/arm/mach-tegra/tegra.c
index f9587be48235..1e89cfefbf68 100644
--- a/arch/arm/mach-tegra/tegra.c
+++ b/arch/arm/mach-tegra/tegra.c
@@ -38,6 +38,7 @@
 #include <soc/tegra/fuse.h>
 #include <soc/tegra/pmc.h>
 
+#include <asm/firmware.h>
 #include <asm/hardware/cache-l2x0.h>
 #include <asm/mach/arch.h>
 #include <asm/mach/time.h>
@@ -74,6 +75,7 @@ static void __init tegra_init_early(void)
 {
 	of_register_trusted_foundations();
 	tegra_cpu_reset_handler_init();
+	call_firmware_op(l2x0_init);
 }
 
 static void __init tegra_dt_init_irq(void)
-- 
2.20.1
