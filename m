From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 09/10] mmc: sdhci-tegra: Enable boot partitions scanning on Tegra20 and Tegra30
Date: Mon, 23 Mar 2020 19:34:30 +0300
Message-ID: <20200323163431.7678-10-digetx@gmail.com>
References: <20200323163431.7678-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200323163431.7678-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, David Heidelberg <david@ixit.cz>, Peter Geis <pgwipeout@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Nicolas Chauvet <kwizart@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, Billy Laws <blaws05@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-block@vger.kernel.org, Andrey Danin <danindrey@mail.ru>, Gilles Grandou <gilles@grandou.net>, Ryan Grachek <ryan@edited.us>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Consumer-grade devices usually have a custom NVIDIA Tegra Partition table
used by built-in eMMC storage. On some devices partition table resides on
a boot eMMC partition, and thus, the boot partitions need to be scanned.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mmc/host/sdhci-tegra.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
index 3e2c5101291d..364572eaed8a 100644
--- a/drivers/mmc/host/sdhci-tegra.c
+++ b/drivers/mmc/host/sdhci-tegra.c
@@ -100,6 +100,7 @@
 #define NVQUIRK_NEEDS_PAD_CONTROL			BIT(7)
 #define NVQUIRK_DIS_CARD_CLK_CONFIG_TAP			BIT(8)
 #define NVQUIRK_CQHCI_DCMD_R1B_CMD_TIMING		BIT(9)
+#define NVQUIRK_SCAN_BOOT_PARTITIONS			BIT(10)
 
 /* SDMMC CQE Base Address for Tegra Host Ver 4.1 and Higher */
 #define SDHCI_TEGRA_CQE_BASE_ADDR			0xF000
@@ -1304,7 +1305,8 @@ static const struct sdhci_tegra_soc_data soc_data_tegra20 = {
 	.pdata = &sdhci_tegra20_pdata,
 	.dma_mask = DMA_BIT_MASK(32),
 	.nvquirks = NVQUIRK_FORCE_SDHCI_SPEC_200 |
-		    NVQUIRK_ENABLE_BLOCK_GAP_DET,
+		    NVQUIRK_ENABLE_BLOCK_GAP_DET |
+		    NVQUIRK_SCAN_BOOT_PARTITIONS,
 };
 
 static const struct sdhci_pltfm_data sdhci_tegra30_pdata = {
@@ -1333,7 +1335,8 @@ static const struct sdhci_tegra_soc_data soc_data_tegra30 = {
 	.nvquirks = NVQUIRK_ENABLE_SDHCI_SPEC_300 |
 		    NVQUIRK_ENABLE_SDR50 |
 		    NVQUIRK_ENABLE_SDR104 |
-		    NVQUIRK_HAS_PADCALIB,
+		    NVQUIRK_HAS_PADCALIB |
+		    NVQUIRK_SCAN_BOOT_PARTITIONS,
 };
 
 static const struct sdhci_ops tegra114_sdhci_ops = {
@@ -1586,6 +1589,9 @@ static int sdhci_tegra_probe(struct platform_device *pdev)
 	/* HW busy detection is supported, but R1B responses are required. */
 	host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY | MMC_CAP_NEED_RSP_BUSY;
 
+	if (tegra_host->soc_data->nvquirks & NVQUIRK_SCAN_BOOT_PARTITIONS)
+		host->mmc->scan_mmc_boot_partitions = true;
+
 	tegra_sdhci_parse_dt(host);
 
 	tegra_host->power_gpio = devm_gpiod_get_optional(&pdev->dev, "power",
-- 
2.25.1
