From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [RFC 1/3] ARM: Tegra: Device Tree Support: Update how sdhci devices
	are initialized
Date: Wed, 11 May 2011 16:26:51 -0700
Message-ID: <20110511232637.10362.84551.stgit@riker>
References: <20110511231905.10362.12844.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110511231905.10362.12844.stgit@riker>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This patch changes how sdhci devices are initialized so that a later patch can
easily add support for i2c devies.

Signed-off-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---

 arch/arm/mach-tegra/Makefile   |    1 
 arch/arm/mach-tegra/board-dt.c |   88 ++--------------------------------------
 2 files changed, 6 insertions(+), 83 deletions(-)

diff --git a/arch/arm/mach-tegra/Makefile b/arch/arm/mach-tegra/Makefile
index 842ec1a..54d2215 100644
--- a/arch/arm/mach-tegra/Makefile
+++ b/arch/arm/mach-tegra/Makefile
@@ -31,6 +31,7 @@ obj-${CONFIG_MACH_SEABOARD}             += board-seaboard.o
 obj-${CONFIG_MACH_SEABOARD}             += board-seaboard-pinmux.o
 
 obj-${CONFIG_MACH_TEGRA_DT}             += board-dt.o
+obj-${CONFIG_MACH_TEGRA_DT}             += board-harmony-pinmux.o
 
 obj-${CONFIG_MACH_TRIMSLICE}            += board-trimslice.o
 obj-${CONFIG_MACH_TRIMSLICE}            += board-trimslice-pinmux.o
diff --git a/arch/arm/mach-tegra/board-dt.c b/arch/arm/mach-tegra/board-dt.c
index 9a35741..50ab328 100644
--- a/arch/arm/mach-tegra/board-dt.c
+++ b/arch/arm/mach-tegra/board-dt.c
@@ -36,92 +36,14 @@
 
 #include <mach/iomap.h>
 #include <mach/irqs.h>
+#include <mach/sdhci.h>
 
 #include "board.h"
-#include "board-harmony.h"
 #include "clock.h"
+#include "devices.h"
+#include "gpio-names.h"
 
-static struct resource sdhci_resource1[] = {
-	[0] = {
-		.start  = INT_SDMMC1,
-		.end    = INT_SDMMC1,
-		.flags  = IORESOURCE_IRQ,
-	},
-	[1] = {
-		.start	= TEGRA_SDMMC1_BASE,
-		.end	= TEGRA_SDMMC1_BASE + TEGRA_SDMMC1_SIZE-1,
-		.flags	= IORESOURCE_MEM,
-	},
-};
-
-static struct platform_device tegra_sdhci_device1 = {
-	.name		= "sdhci-tegra",
-	.id		= 0,
-	.resource	= sdhci_resource1,
-	.num_resources	= ARRAY_SIZE(sdhci_resource1),
-};
-
-static struct resource sdhci_resource2[] = {
-	[0] = {
-		.start  = INT_SDMMC2,
-		.end    = INT_SDMMC2,
-		.flags  = IORESOURCE_IRQ,
-	},
-	[1] = {
-		.start	= TEGRA_SDMMC2_BASE,
-		.end	= TEGRA_SDMMC2_BASE + TEGRA_SDMMC2_SIZE-1,
-		.flags	= IORESOURCE_MEM,
-	},
-};
-
-static struct platform_device tegra_sdhci_device2 = {
-	.name		= "sdhci-tegra",
-	.id		= 1,
-	.resource	= sdhci_resource2,
-	.num_resources	= ARRAY_SIZE(sdhci_resource2),
-};
-
-static struct resource sdhci_resource3[] = {
-	[0] = {
-		.start  = INT_SDMMC3,
-		.end    = INT_SDMMC3,
-		.flags  = IORESOURCE_IRQ,
-	},
-	[1] = {
-		.start	= TEGRA_SDMMC3_BASE,
-		.end	= TEGRA_SDMMC3_BASE + TEGRA_SDMMC3_SIZE-1,
-		.flags	= IORESOURCE_MEM,
-	},
-};
-
-static struct platform_device tegra_sdhci_device3 = {
-	.name		= "sdhci-tegra",
-	.id		= 2,
-	.resource	= sdhci_resource3,
-	.num_resources	= ARRAY_SIZE(sdhci_resource3),
-};
-
-static struct resource sdhci_resource4[] = {
-	[0] = {
-		.start  = INT_SDMMC4,
-		.end    = INT_SDMMC4,
-		.flags  = IORESOURCE_IRQ,
-	},
-	[1] = {
-		.start	= TEGRA_SDMMC4_BASE,
-		.end	= TEGRA_SDMMC4_BASE + TEGRA_SDMMC4_SIZE-1,
-		.flags	= IORESOURCE_MEM,
-	},
-};
-
-static struct platform_device tegra_sdhci_device4 = {
-	.name		= "sdhci-tegra",
-	.id		= 3,
-	.resource	= sdhci_resource4,
-	.num_resources	= ARRAY_SIZE(sdhci_resource4),
-};
-
-static struct platform_device *harmony_devices[] __initdata = {
+static struct platform_device *tegra250_devices[] __initdata = {
 	&tegra_sdhci_device1,
 	&tegra_sdhci_device2,
 	&tegra_sdhci_device3,
@@ -164,7 +86,7 @@ static void __init tegra_dt_init(void)
 
 	harmony_pinmux_init();
 
-	platform_add_devices(harmony_devices, ARRAY_SIZE(harmony_devices));
+	platform_add_devices(tegra250_devices, ARRAY_SIZE(tegra250_devices));
 
 	/*
 	 * Finished with the static registrations now; fill in the missing
