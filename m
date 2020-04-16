From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] firmware: tegra: Make BPMP a regular driver
Date: Thu, 16 Apr 2020 22:26:36 +0200
Message-ID: <20200416202636.1085884-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The Tegra BPMP driver typically ends up deferring probe because it wants
to attach to the SMMU, so there's little sense in registering it at the
core init-level.

One side-effect of this is that the driver will be probed later even if
it doesn't want to attach to an SMMU, which means that consumers will
end up deferring probe, which in turn takes care of ordering the suspend
and resume queue in the correct way. Currently since suspend/resume
order depends on instantiation order, and because BPMP is listed at the
very end of the device tree (after most of its consumers), the suspend
and resume queue is ordered wrongly, which can cause issues for drivers
(like I2C) which suspend after and resume before BPMP. In the case of
I2C this typically leads to the clock failing to enable.

Besides fixing this suspend/resume ordering issue, this also has the
added benefit of allowing the driver to be built as a loadable module,
which can help decrease the size of multiplatform kernel.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/firmware/tegra/bpmp.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index 6741fcda0c37..30174f35e896 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -6,6 +6,7 @@
 #include <linux/clk/tegra.h>
 #include <linux/genalloc.h>
 #include <linux/mailbox_client.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
@@ -872,9 +873,4 @@ static struct platform_driver tegra_bpmp_driver = {
 	},
 	.probe = tegra_bpmp_probe,
 };
-
-static int __init tegra_bpmp_init(void)
-{
-	return platform_driver_register(&tegra_bpmp_driver);
-}
-core_initcall(tegra_bpmp_init);
+module_platform_driver(tegra_bpmp_driver);
-- 
2.24.1
