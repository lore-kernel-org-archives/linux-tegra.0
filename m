From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 1/4] memory: tegra: Fix missed registers values latching
Date: Fri, 12 Apr 2019 01:12:47 +0300
Message-ID: <20190411221250.23233-2-digetx@gmail.com>
References: <20190411221250.23233-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411221250.23233-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Some of Memory Controller registers are shadowed and require latching in
order to copy assembly state into the active, MC_EMEM_ARB_CFG is one of
these registers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/mc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 0a53598d982f..60474597180b 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -51,6 +51,9 @@
 #define MC_EMEM_ADR_CFG 0x54
 #define MC_EMEM_ADR_CFG_EMEM_NUMDEV BIT(0)
 
+#define MC_TIMING_CONTROL		0xfc
+#define MC_TIMING_UPDATE		BIT(0)
+
 static const struct of_device_id tegra_mc_of_match[] = {
 #ifdef CONFIG_ARCH_TEGRA_2x_SOC
 	{ .compatible = "nvidia,tegra20-mc-gart", .data = &tegra20_mc_soc },
@@ -301,6 +304,9 @@ static int tegra_mc_setup_latency_allowance(struct tegra_mc *mc)
 		writel(value, mc->regs + la->reg);
 	}
 
+	/* latch new values */
+	writel(MC_TIMING_UPDATE, mc->regs + MC_TIMING_CONTROL);
+
 	return 0;
 }
 
-- 
2.21.0
