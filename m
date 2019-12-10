From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1] sdhci: tegra: Add workaround for Broadcom WiFi
Date: Tue, 10 Dec 2019 04:40:11 +0300
Message-ID: <20191210014011.21987-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

All Tegra20 boards that have embedded Broadcom WiFi SDIO chip are affected
by a problem where WiFi chip reports CCCR v1.10, while it should v1.20.
In a result high-speed mode isn't enabled for the WiFi card and this
results in a malfunctioning SDIO communication.

 brcmfmac: brcmf_sdio_readframes: read 304 bytes from channel 1 failed: -84
 brcmfmac: brcmf_sdio_rxfail: abort command, terminate frame, send NAK

Downstream kernels are overriding card's CCCR info in SDHCI driver to fix
the problem, let's do the same in upstream.

The change is inspired by omap_hsmmc_init_card() of OMAP's HSMMC driver,
which overrides card's info for the TI wl1251 WiFi.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mmc/host/sdhci-tegra.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
index 7bc950520fd9..2ad87da98f2c 100644
--- a/drivers/mmc/host/sdhci-tegra.c
+++ b/drivers/mmc/host/sdhci-tegra.c
@@ -1501,6 +1501,32 @@ static int sdhci_tegra_add_host(struct sdhci_host *host)
 	return ret;
 }
 
+static void sdhci_tegra_init_card(struct mmc_host *mmc, struct mmc_card *card)
+{
+	if (card->type == MMC_TYPE_SDIO) {
+		struct device_node *np = mmc_dev(mmc)->of_node;
+
+		np = of_get_compatible_child(np, "brcm,bcm4329-fmac");
+		if (np) {
+			dev_info(mmc_dev(mmc), "found bcm4329\n");
+
+			/*
+			 * All Tegra20 boards that have embedded BCM4329
+			 * chip need to enable high speed for SDIO, otherwise
+			 * further communication with the card doesn't work
+			 * well.
+			 *
+			 * Later BCM43xx chips do not need this workaround,
+			 * but there is no good way to differentiate chip's
+			 * version at this stage and it doesn't cause any
+			 * harm for the later chips.
+			 */
+			card->cccr.high_speed = 1;
+			of_node_put(np);
+		}
+	}
+}
+
 static int sdhci_tegra_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *match;
@@ -1545,6 +1571,8 @@ static int sdhci_tegra_probe(struct platform_device *pdev)
 		host->mmc_host_ops.execute_tuning =
 				tegra_sdhci_execute_hw_tuning;
 
+	host->mmc_host_ops.init_card = sdhci_tegra_init_card;
+
 	rc = mmc_of_parse(host->mmc);
 	if (rc)
 		goto err_parse_dt;
-- 
2.24.0
