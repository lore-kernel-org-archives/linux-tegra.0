From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] soc/tegra: Restrict SoC device registration to Tegra
Date: Wed, 23 Aug 2017 11:25:08 +0200
Message-ID: <20170823092509.5243-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Commit 8a46828e623c ("soc/tegra: Register SoC device") added an initcall
to register the SoC device on Tegra. However, that code is unrestricted
and will run on all platforms, causing unwanted warnings.

Fix this by first checking that we're running on hardware that supports
the fuses block that we use to provide SoC information.

Fixes: 8a46828e623c ("soc/tegra: Register SoC device")
Reported-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Tested-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/soc/tegra/fuse/fuse-tegra.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index e4f78de8f95f..be003d04383f 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -346,8 +346,16 @@ early_initcall(tegra_init_fuse);
 #ifdef CONFIG_ARM64
 static int __init tegra_init_soc(void)
 {
+	struct device_node *np;
 	struct device *soc;
 
+	/* make sure we're running on Tegra */
+	np = of_find_matching_node(NULL, tegra_fuse_match);
+	if (!np)
+		return 0;
+
+	of_node_put(np);
+
 	soc = tegra_soc_device_register();
 	if (IS_ERR(soc)) {
 		pr_err("failed to register SoC device: %ld\n", PTR_ERR(soc));
-- 
2.13.3
