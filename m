From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 05/37] memory: tegra30-emc: Make driver modular
Date: Tue,  9 Jun 2020 16:13:32 +0300
Message-ID: <20200609131404.17523-6-digetx@gmail.com>
References: <20200609131404.17523-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200609131404.17523-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
Cc: =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>, linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This patch adds modularization support to the Tegra30 EMC driver. Driver
now can be compiled as a loadable kernel module.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/Kconfig       |  2 +-
 drivers/memory/tegra/mc.c          |  3 +++
 drivers/memory/tegra/tegra30-emc.c | 17 ++++++++++++-----
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
index 7e0e1ef87763..bd453de9d446 100644
--- a/drivers/memory/tegra/Kconfig
+++ b/drivers/memory/tegra/Kconfig
@@ -18,7 +18,7 @@ config TEGRA20_EMC
 	  external memory.
 
 config TEGRA30_EMC
-	bool "NVIDIA Tegra30 External Memory Controller driver"
+	tristate "NVIDIA Tegra30 External Memory Controller driver"
 	default y
 	depends on TEGRA_MC && ARCH_TEGRA_3x_SOC
 	help
diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index ec8403557ed4..772aa021b5f6 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -6,6 +6,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
+#include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -298,6 +299,7 @@ int tegra_mc_write_emem_configuration(struct tegra_mc *mc, unsigned long rate)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(tegra_mc_write_emem_configuration);
 
 unsigned int tegra_mc_get_emem_device_count(struct tegra_mc *mc)
 {
@@ -309,6 +311,7 @@ unsigned int tegra_mc_get_emem_device_count(struct tegra_mc *mc)
 
 	return dram_count;
 }
+EXPORT_SYMBOL_GPL(tegra_mc_get_emem_device_count);
 
 static int load_one_timing(struct tegra_mc *mc,
 			   struct tegra_mc_timing *timing,
diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index 055af0e08a2e..85d4effb8e6f 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -1343,6 +1343,13 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, emc);
 	tegra_emc_debugfs_init(emc);
 
+	/*
+	 * Don't allow the kernel module to be unloaded. Unloading adds some
+	 * extra complexity which doesn't really worth the effort in a case of
+	 * this driver.
+	 */
+	try_module_get(THIS_MODULE);
+
 	return 0;
 
 unset_cb:
@@ -1393,6 +1400,7 @@ static const struct of_device_id tegra_emc_of_match[] = {
 	{ .compatible = "nvidia,tegra30-emc", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, tegra_emc_of_match);
 
 static struct platform_driver tegra_emc_driver = {
 	.probe = tegra_emc_probe,
@@ -1403,9 +1411,8 @@ static struct platform_driver tegra_emc_driver = {
 		.suppress_bind_attrs = true,
 	},
 };
+module_platform_driver(tegra_emc_driver);
 
-static int __init tegra_emc_init(void)
-{
-	return platform_driver_register(&tegra_emc_driver);
-}
-subsys_initcall(tegra_emc_init);
+MODULE_AUTHOR("Dmitry Osipenko <digetx@gmail.com>");
+MODULE_DESCRIPTION("NVIDIA Tegra30 EMC driver");
+MODULE_LICENSE("GPL v2");
-- 
2.26.0
