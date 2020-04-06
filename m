From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
Subject: [PATCH 2/5] [2/5] mmc: host: Remove redundant host CQE bindings
Date: Mon, 6 Apr 2020 17:27:58 +0800
Message-ID: <1586165281-11888-3-git-send-email-chun-hung.wu@mediatek.com>
References: <1586165281-11888-1-git-send-email-chun-hung.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
In-Reply-To: <1586165281-11888-1-git-send-email-chun-hung.wu@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org
To: mirq-linux@rere.qmqm.pl, Jonathan Hunter <jonathanh@nvidia.com>, Al
 Cooper <alcooperx@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Michal Simek <michal.simek@xilinx.com>, Thierry Reding <thierry.reding@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Linus
 Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Pan Bian <bianpan2016@163.com>, Thomas
 Gleixner <tglx@linutronix.de>, Alli
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com, linux-arm-msm@vger.kernel.org, Chun-Hung Wu <chun-hung.wu@mediatek.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, kernel-team@android.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

CQE bindings "supports-cqe" and "disable-cqe-dcmd" is parsed
in mmc_of_parse(). Remove vendor code which parses CQE bindings,
and use mmc_host->caps2 to decide support CQE or not.

Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
---
 drivers/mmc/host/sdhci-brcmstb.c   | 11 ++++++-----
 drivers/mmc/host/sdhci-msm.c       |  3 +--
 drivers/mmc/host/sdhci-of-arasan.c |  3 ---
 drivers/mmc/host/sdhci-tegra.c     |  2 +-
 4 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/mmc/host/sdhci-brcmstb.c b/drivers/mmc/host/sdhci-brcmstb.c
index ad01f64..07c90c6 100644
--- a/drivers/mmc/host/sdhci-brcmstb.c
+++ b/drivers/mmc/host/sdhci-brcmstb.c
@@ -247,10 +247,6 @@ static int sdhci_brcmstb_probe(struct platform_device *pdev)
 		return res;
 
 	memset(&brcmstb_pdata, 0, sizeof(brcmstb_pdata));
-	if (device_property_read_bool(&pdev->dev, "supports-cqe")) {
-		has_cqe = true;
-		match_priv->ops->irq = sdhci_brcmstb_cqhci_irq;
-	}
 	brcmstb_pdata.ops = match_priv->ops;
 	host = sdhci_pltfm_init(pdev, &brcmstb_pdata,
 				sizeof(struct sdhci_brcmstb_priv));
@@ -261,7 +257,6 @@ static int sdhci_brcmstb_probe(struct platform_device *pdev)
 
 	pltfm_host = sdhci_priv(host);
 	priv = sdhci_pltfm_priv(pltfm_host);
-	priv->has_cqe = has_cqe;
 
 	/* Map in the non-standard CFG registers */
 	iomem = platform_get_resource(pdev, IORESOURCE_MEM, 1);
@@ -276,6 +271,12 @@ static int sdhci_brcmstb_probe(struct platform_device *pdev)
 	if (res)
 		goto err;
 
+	if (host->mmc->caps2 & MMC_CAP2_CQE) {
+		has_cqe = true;
+		match_priv->ops->irq = sdhci_brcmstb_cqhci_irq;
+	}
+	priv->has_cqe = has_cqe;
+
 	/*
 	 * If the chip has enhanced strobe and it's enabled, add
 	 * callback
diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index c3a160c..fbb2f57 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1880,7 +1880,6 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	u8 core_major;
 	const struct sdhci_msm_offset *msm_offset;
 	const struct sdhci_msm_variant_info *var_info;
-	struct device_node *node = pdev->dev.of_node;
 
 	host = sdhci_pltfm_init(pdev, &sdhci_msm_pdata, sizeof(*msm_host));
 	if (IS_ERR(host))
@@ -2076,7 +2075,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(&pdev->dev);
 
 	host->mmc_host_ops.execute_tuning = sdhci_msm_execute_tuning;
-	if (of_property_read_bool(node, "supports-cqe"))
+	if (host->mmc->caps2 & MMC_CAP2_CQE)
 		ret = sdhci_msm_cqe_add_host(host, pdev);
 	else
 		ret = sdhci_add_host(host);
diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
index e49b44b..359eff6 100644
--- a/drivers/mmc/host/sdhci-of-arasan.c
+++ b/drivers/mmc/host/sdhci-of-arasan.c
@@ -1281,9 +1281,6 @@ static int sdhci_arasan_probe(struct platform_device *pdev)
 					sdhci_arasan_voltage_switch;
 		sdhci_arasan->has_cqe = true;
 		host->mmc->caps2 |= MMC_CAP2_CQE;
-
-		if (!of_property_read_bool(np, "disable-cqe-dcmd"))
-			host->mmc->caps2 |= MMC_CAP2_CQE_DCMD;
 	}
 
 	ret = sdhci_arasan_add_host(sdhci_arasan);
diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
index 403ac44..d09abdd 100644
--- a/drivers/mmc/host/sdhci-tegra.c
+++ b/drivers/mmc/host/sdhci-tegra.c
@@ -715,7 +715,7 @@ static void tegra_sdhci_parse_dt(struct sdhci_host *host)
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct sdhci_tegra *tegra_host = sdhci_pltfm_priv(pltfm_host);
 
-	if (device_property_read_bool(host->mmc->parent, "supports-cqe"))
+	if (host->mmc->caps2 & MMC_CAP2_CQE)
 		tegra_host->enable_hwcq = true;
 	else
 		tegra_host->enable_hwcq = false;
-- 
1.9.1
