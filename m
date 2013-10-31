From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH RESEND] ARM: tegra: set regulator full constraints
Date: Thu, 31 Oct 2013 15:05:26 +0800
Message-ID: <1383203126-3243-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Set full constraints during machine initialisation, so that the
regulator_get() can get the dummy regulator if the regulator is
physically present and enabled.
Discussed this in the link:
https://lkml.org/lkml/2013/10/8/40

Signed-off-by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/tegra.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/mach-tegra/tegra.c b/arch/arm/mach-tegra/tegra.c
index ce553d5..5c69a75 100644
--- a/arch/arm/mach-tegra/tegra.c
+++ b/arch/arm/mach-tegra/tegra.c
@@ -34,6 +34,7 @@
 #include <linux/usb/tegra_usb_phy.h>
 #include <linux/clk/tegra.h>
 #include <linux/irqchip.h>
+#include <linux/regulator/machine.h>
 
 #include <asm/hardware/cache-l2x0.h>
 #include <asm/mach-types.h>
@@ -135,6 +136,8 @@ static void __init tegra_dt_init(void)
 
 	parent = soc_device_to_device(soc_dev);
 
+	regulator_has_full_constraints();
+
 	/*
 	 * Finished with the static registrations now; fill in the missing
 	 * devices
-- 
1.7.9.5
