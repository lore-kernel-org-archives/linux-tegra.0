From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 19/29] memory: tegra20-emc: Register as interconnect provider
Date: Mon, 18 Nov 2019 23:02:37 +0300
Message-ID: <20191118200247.3567-20-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

EMC now provides MC with memory bandwidth using interconnect API.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra20-emc.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 28bd9fd4c3c9..61ce422e102a 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -19,6 +19,7 @@
 #include <linux/types.h>
 
 #include <soc/tegra/fuse.h>
+#include <soc/tegra/mc.h>
 
 #define EMC_INTSTATUS				0x000
 #define EMC_INTMASK				0x004
@@ -87,6 +88,8 @@
 #define EMC_DBG_READ_DQM_CTRL			BIT(9)
 #define EMC_DBG_CFG_PRIORITY			BIT(24)
 
+#define EMC_FBIO_CFG5_DRAM_WIDTH_X16		BIT(4)
+
 static const u16 emc_timing_registers[] = {
 	EMC_RC,
 	EMC_RFC,
@@ -486,10 +489,27 @@ static long emc_round_rate(unsigned long rate,
 	return timing->rate;
 }
 
+static unsigned int emc_dram_data_bus_width_bytes(struct tegra_emc *emc)
+{
+	unsigned int bus_width;
+	u32 emc_cfg;
+
+	emc_cfg = readl_relaxed(emc->regs + EMC_FBIO_CFG5);
+	if (emc_cfg & EMC_FBIO_CFG5_DRAM_WIDTH_X16)
+		bus_width = 16;
+	else
+		bus_width = 32;
+
+	dev_info(emc->dev, "DRAM data-bus width: %ubit\n", bus_width);
+
+	return bus_width / 8;
+}
+
 static int tegra_emc_probe(struct platform_device *pdev)
 {
 	struct device_node *np;
 	struct tegra_emc *emc;
+	unsigned int bus_width;
 	int irq, err;
 
 	emc = devm_kzalloc(&pdev->dev, sizeof(*emc), GFP_KERNEL);
@@ -549,6 +569,12 @@ static int tegra_emc_probe(struct platform_device *pdev)
 		goto unset_cb;
 	}
 
+	bus_width = emc_dram_data_bus_width_bytes(emc);
+
+	err = tegra_icc_emc_setup_interconnect(&pdev->dev, bus_width);
+	if (err)
+		dev_err(&pdev->dev, "failed to initialize ICC: %d\n", err);
+
 	return 0;
 
 unset_cb:
-- 
2.23.0
