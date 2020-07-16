From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 8/9] firmware: tegra: Enable BPMP support on Tegra234
Date: Thu, 16 Jul 2020 16:18:55 +0200
Message-ID: <20200716141856.544718-9-thierry.reding@gmail.com>
References: <20200716141856.544718-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200716141856.544718-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Enable support for the BPMP on Tegra234 to avoid relying on Tegra194
being enabled to pull in the needed OF device ID table entry.

On simulation platforms the BPMP hasn't booted up yet by the time we
probe the BPMP driver and the BPMP hasn't had a chance to mark the
doorbell as ringable by the CCPLEX. This corresponding check in the
BPMP driver will therefore fail. Work around this by disabling the
check on simulation platforms.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/firmware/tegra/bpmp.c | 3 ++-
 drivers/mailbox/tegra-hsp.c   | 9 ++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index 4d93d8925e14..0742a90cb844 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -856,7 +856,8 @@ static const struct tegra_bpmp_soc tegra210_soc = {
 
 static const struct of_device_id tegra_bpmp_match[] = {
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC) || \
-    IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC)
+    IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
+    IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC)
 	{ .compatible = "nvidia,tegra186-bpmp", .data = &tegra186_soc },
 #endif
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index 834b35dc3b13..e07091d71986 100644
--- a/drivers/mailbox/tegra-hsp.c
+++ b/drivers/mailbox/tegra-hsp.c
@@ -13,6 +13,8 @@
 #include <linux/pm.h>
 #include <linux/slab.h>
 
+#include <soc/tegra/fuse.h>
+
 #include <dt-bindings/mailbox/tegra186-hsp.h>
 
 #include "mailbox.h"
@@ -322,7 +324,12 @@ static int tegra_hsp_doorbell_startup(struct mbox_chan *chan)
 	if (!ccplex)
 		return -ENODEV;
 
-	if (!tegra_hsp_doorbell_can_ring(db))
+	/*
+	 * On simulation platforms the BPMP hasn't had a chance yet to mark
+	 * the doorbell as ringable by the CCPLEX, so we want to skip extra
+	 * checks here.
+	 */
+	if (tegra_is_silicon() && !tegra_hsp_doorbell_can_ring(db))
 		return -ENODEV;
 
 	spin_lock_irqsave(&hsp->lock, flags);
-- 
2.27.0
