From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/9] soc/tegra: pmc: Add Tegra194 support
Date: Fri, 21 Sep 2018 12:25:39 +0200
Message-ID: <20180921102546.12745-3-thierry.reding@gmail.com>
References: <20180921102546.12745-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180921102546.12745-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The PMC controller on Tegra194 has a couple of new I/O pads and drops
others compared to Tegra186.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 66 ++++++++++++++++++++++++++++++++++++++++-
 include/soc/tegra/pmc.h | 21 +++++++++++++
 2 files changed, 86 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index ab719fa90150..c08f0b942020 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -2138,8 +2138,72 @@ static const struct tegra_pmc_soc tegra186_pmc_soc = {
 	.setup_irq_polarity = tegra186_pmc_setup_irq_polarity,
 };
 
+static const struct tegra_io_pad_soc tegra194_io_pads[] = {
+	{ .id = TEGRA_IO_PAD_CSIA, .dpd = 0, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_CSIB, .dpd = 1, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_MIPI_BIAS, .dpd = 3, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_PEX_CLK_BIAS, .dpd = 4, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_PEX_CLK3, .dpd = 5, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_PEX_CLK2, .dpd = 6, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_PEX_CLK1, .dpd = 7, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_EQOS, .dpd = 8, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_PEX_CLK2_BIAS, .dpd = 9, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_PEX_CLK2, .dpd = 10, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_DAP3, .dpd = 11, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_DAP5, .dpd = 12, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_UART, .dpd = 14, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_PWR_CTL, .dpd = 15, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_SOC_GPIO53, .dpd = 16, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_AUDIO, .dpd = 17, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_GP_PWM2, .dpd = 18, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_GP_PWM3, .dpd = 19, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_SOC_GPIO12, .dpd = 20, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_SOC_GPIO13, .dpd = 21, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_SOC_GPIO10, .dpd = 22, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_UART4, .dpd = 23, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_UART5, .dpd = 24, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_DBG, .dpd = 25, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_HDMI_DP3, .dpd = 26, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_HDMI_DP2, .dpd = 27, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_HDMI_DP0, .dpd = 28, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_HDMI_DP1, .dpd = 29, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_PEX_CNTRL, .dpd = 32, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_PEX_CTL2, .dpd = 33, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_PEX_L0_RST_N, .dpd = 34, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_PEX_L1_RST_N, .dpd = 35, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_SDMMC4, .dpd = 36, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_PEX_L5_RST_N, .dpd = 37, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_CSIC, .dpd = 43, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_CSID, .dpd = 44, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_CSIE, .dpd = 45, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_CSIF, .dpd = 46, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_SPI, .dpd = 47, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_UFS, .dpd = 49, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_CSIG, .dpd = 50, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_CSIH, .dpd = 51, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_EDP, .dpd = 53, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_SDMMC1_HV, .dpd = 55, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_SDMMC3_HV, .dpd = 56, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_CONN, .dpd = 60, .voltage = UINT_MAX },
+	{ .id = TEGRA_IO_PAD_AUDIO_HV, .dpd = 61, .voltage = UINT_MAX },
+};
+
+static const struct tegra_pmc_soc tegra194_pmc_soc = {
+	.num_powergates = 0,
+	.powergates = NULL,
+	.num_cpu_powergates = 0,
+	.cpu_powergates = NULL,
+	.has_tsense_reset = false,
+	.has_gpu_clamps = false,
+	.num_io_pads = ARRAY_SIZE(tegra194_io_pads),
+	.io_pads = tegra194_io_pads,
+	.regs = &tegra186_pmc_regs,
+	.init = NULL,
+	.setup_irq_polarity = tegra186_pmc_setup_irq_polarity,
+};
+
 static const struct of_device_id tegra_pmc_match[] = {
-	{ .compatible = "nvidia,tegra194-pmc", .data = &tegra186_pmc_soc },
+	{ .compatible = "nvidia,tegra194-pmc", .data = &tegra194_pmc_soc },
 	{ .compatible = "nvidia,tegra186-pmc", .data = &tegra186_pmc_soc },
 	{ .compatible = "nvidia,tegra210-pmc", .data = &tegra210_pmc_soc },
 	{ .compatible = "nvidia,tegra132-pmc", .data = &tegra124_pmc_soc },
diff --git a/include/soc/tegra/pmc.h b/include/soc/tegra/pmc.h
index 562426812ab2..fd816f6aa9cc 100644
--- a/include/soc/tegra/pmc.h
+++ b/include/soc/tegra/pmc.h
@@ -90,6 +90,10 @@ enum tegra_io_pad {
 	TEGRA_IO_PAD_CSID,
 	TEGRA_IO_PAD_CSIE,
 	TEGRA_IO_PAD_CSIF,
+	TEGRA_IO_PAD_CSIG,
+	TEGRA_IO_PAD_CSIH,
+	TEGRA_IO_PAD_DAP3,
+	TEGRA_IO_PAD_DAP5,
 	TEGRA_IO_PAD_DBG,
 	TEGRA_IO_PAD_DEBUG_NONAO,
 	TEGRA_IO_PAD_DMIC,
@@ -102,10 +106,15 @@ enum tegra_io_pad {
 	TEGRA_IO_PAD_EDP,
 	TEGRA_IO_PAD_EMMC,
 	TEGRA_IO_PAD_EMMC2,
+	TEGRA_IO_PAD_EQOS,
 	TEGRA_IO_PAD_GPIO,
+	TEGRA_IO_PAD_GP_PWM2,
+	TEGRA_IO_PAD_GP_PWM3,
 	TEGRA_IO_PAD_HDMI,
 	TEGRA_IO_PAD_HDMI_DP0,
 	TEGRA_IO_PAD_HDMI_DP1,
+	TEGRA_IO_PAD_HDMI_DP2,
+	TEGRA_IO_PAD_HDMI_DP3,
 	TEGRA_IO_PAD_HSIC,
 	TEGRA_IO_PAD_HV,
 	TEGRA_IO_PAD_LVDS,
@@ -115,8 +124,14 @@ enum tegra_io_pad {
 	TEGRA_IO_PAD_PEX_CLK_BIAS,
 	TEGRA_IO_PAD_PEX_CLK1,
 	TEGRA_IO_PAD_PEX_CLK2,
+	TEGRA_IO_PAD_PEX_CLK2_BIAS,
 	TEGRA_IO_PAD_PEX_CLK3,
 	TEGRA_IO_PAD_PEX_CNTRL,
+	TEGRA_IO_PAD_PEX_CTL2,
+	TEGRA_IO_PAD_PEX_L0_RST_N,
+	TEGRA_IO_PAD_PEX_L1_RST_N,
+	TEGRA_IO_PAD_PEX_L5_RST_N,
+	TEGRA_IO_PAD_PWR_CTL,
 	TEGRA_IO_PAD_SDMMC1,
 	TEGRA_IO_PAD_SDMMC1_HV,
 	TEGRA_IO_PAD_SDMMC2,
@@ -124,10 +139,16 @@ enum tegra_io_pad {
 	TEGRA_IO_PAD_SDMMC3,
 	TEGRA_IO_PAD_SDMMC3_HV,
 	TEGRA_IO_PAD_SDMMC4,
+	TEGRA_IO_PAD_SOC_GPIO10,
+	TEGRA_IO_PAD_SOC_GPIO12,
+	TEGRA_IO_PAD_SOC_GPIO13,
+	TEGRA_IO_PAD_SOC_GPIO53,
 	TEGRA_IO_PAD_SPI,
 	TEGRA_IO_PAD_SPI_HV,
 	TEGRA_IO_PAD_SYS_DDC,
 	TEGRA_IO_PAD_UART,
+	TEGRA_IO_PAD_UART4,
+	TEGRA_IO_PAD_UART5,
 	TEGRA_IO_PAD_UFS,
 	TEGRA_IO_PAD_USB0,
 	TEGRA_IO_PAD_USB1,
-- 
2.19.0
