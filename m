From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 4/4] arm/tegra: Convert pinmux driver to a platform device
Date: Tue, 11 Oct 2011 16:16:15 -0600
Message-ID: <1318371375-4083-4-git-send-email-swarren@nvidia.com>
References: <1318371375-4083-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1318371375-4083-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/pinmux.c |   26 ++++++++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/pinmux.c b/arch/arm/mach-tegra/pinmux.c
index f80d507..46b9d87 100644
--- a/arch/arm/mach-tegra/pinmux.c
+++ b/arch/arm/mach-tegra/pinmux.c
@@ -20,6 +20,7 @@
 #include <linux/errno.h>
 #include <linux/spinlock.h>
 #include <linux/io.h>
+#include <linux/platform_device.h>
 
 #include <mach/iomap.h>
 #include <mach/pinmux.h>
@@ -665,6 +666,31 @@ void tegra_pinmux_config_pullupdown_table(const struct tegra_pingroup_config *co
 	}
 }
 
+static int __init tegra_pinmux_probe(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static struct of_device_id tegra_pinmux_of_match[] __devinitdata = {
+	{ .compatible = "nvidia,tegra20-pinmux", },
+	{ },
+};
+
+static struct platform_driver tegra_pinmux_driver = {
+	.driver		= {
+		.name	= "tegra-pinmux",
+		.owner	= THIS_MODULE,
+		.of_match_table = tegra_pinmux_of_match,
+	},
+	.probe		= tegra_pinmux_probe,
+};
+
+static int __init tegra_pinmux_init(void)
+{
+	return platform_driver_register(&tegra_pinmux_driver);
+}
+postcore_initcall(tegra_pinmux_init);
+
 #ifdef	CONFIG_DEBUG_FS
 
 #include <linux/debugfs.h>
-- 
1.7.0.4
