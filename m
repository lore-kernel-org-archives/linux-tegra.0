From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH v1 02/17] soc: tegra: pmc: Add helper function for PLLE IDDQ override
Date: Mon, 18 Nov 2019 22:50:19 -0800
Message-ID: <1574146234-3871-3-git-send-email-skomatineni@nvidia.com>
References: <1574146234-3871-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1574146234-3871-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: allison@lohutok.net, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, horms+renesas@verge.net.au, Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra PMC has PLLE IDDQ mode override to allow software control
of PLLE power up or down.

PLLE is put in IDDQ mode by the hardware. Software can override
the PLLE IDDQ control by setting the IDDQ override bit and IDDQ
SWCTL bits in the PMC_SATA_PWRGT PMC register.

Currently Tegra clock driver overrides hardware IDDQ control and
clears PLLE IDDQ during PLLE training by direct Tegra PMC register
access. With this, when PMC is in secure mode any direct PMC register
access from non-secure mode will not go through.

This patch adds helper function for software control of PLLE IDDQ
to use by Tegra clock driver.

Helper function uses tegra_pmc_readl and tegra_pmc_writel which
handles both secure mode and non-secure mode PMC register access.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 22 ++++++++++++++++++++++
 include/soc/tegra/pmc.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 224e7cf8dc00..7a5aab0b993b 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -108,6 +108,10 @@
 #define PMC_WAKE2_STATUS		0x168
 #define PMC_SW_WAKE2_STATUS		0x16c
 
+#define PMC_SATA_PWRGT			0x1ac
+#define PMC_SATA_PWRGT_PLLE_IDDQ_VALUE BIT(5)
+#define PMC_SATA_PWRGT_PLLE_IDDQ_SWCTL BIT(4)
+
 #define PMC_SENSOR_CTRL			0x1b0
 #define  PMC_SENSOR_CTRL_SCRATCH_WRITE	BIT(2)
 #define  PMC_SENSOR_CTRL_ENABLE_RST	BIT(1)
@@ -1177,6 +1181,24 @@ static void tegra_powergate_remove_all(struct device_node *parent)
 	of_node_put(np);
 }
 
+void tegra_pmc_clear_plle_iddq(void)
+{
+	u32 val;
+
+	val = tegra_pmc_readl(pmc, PMC_SATA_PWRGT);
+	val |= PMC_SATA_PWRGT_PLLE_IDDQ_VALUE;
+	tegra_pmc_writel(pmc, val, PMC_SATA_PWRGT);
+
+	val = tegra_pmc_readl(pmc, PMC_SATA_PWRGT);
+	val |= PMC_SATA_PWRGT_PLLE_IDDQ_SWCTL;
+	tegra_pmc_writel(pmc, val, PMC_SATA_PWRGT);
+
+	val = tegra_pmc_readl(pmc, PMC_SATA_PWRGT);
+	val &= ~PMC_SATA_PWRGT_PLLE_IDDQ_VALUE;
+	tegra_pmc_writel(pmc, val, PMC_SATA_PWRGT);
+}
+EXPORT_SYMBOL(tegra_pmc_clear_plle_iddq);
+
 bool tegra_pmc_is_pllm_wb0_override_enabled(void)
 {
 	u32 val;
diff --git a/include/soc/tegra/pmc.h b/include/soc/tegra/pmc.h
index cbf23e0d3c55..2fdd60484765 100644
--- a/include/soc/tegra/pmc.h
+++ b/include/soc/tegra/pmc.h
@@ -25,6 +25,7 @@ bool tegra_pmc_is_pllm_wb0_enabled(void);
 void tegra_pmc_set_pllm_wb0_enable(bool enable);
 void tegra_pmc_get_pllm_wb0_mnp_overrides(u32 *divm, u32 *divn, u8 *divp);
 void tegra_pmc_set_pllm_wb0_mnp_overrides(u32 divm, u32 divn, u8 divp);
+void tegra_pmc_clear_plle_iddq(void);
 
 /*
  * powergate and I/O rail APIs
-- 
2.7.4
