From: Stephen Warren <swarren@nvidia.com>
Subject: [PATCH 4/4] arm/tegra: Convert pinmux driver to a platform device
Date: Thu, 22 Sep 2011 15:06:07 -0600
Message-ID: <1316725567-17881-5-git-send-email-swarren@nvidia.com>
References: <1316725567-17881-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1316725567-17881-1-git-send-email-swarren@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nico@fluxnic.net>, Olof Johansson <olof@lixom.net>, Colin Cross <ccross@android.com>, Erik Gilling <konkers@android.com>, Grant Likely <grant.likely@secretlab.ca>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
See patch 0000 for details on dependencies.

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
