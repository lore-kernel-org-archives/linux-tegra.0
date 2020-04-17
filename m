From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH 4.19.113 3/3] sdhci: tegra: Enable MMC_CAP_WAIT_WHILE_BUSY host capability
Date: Fri, 17 Apr 2020 12:14:04 -0700
Message-ID: <1587150844-12003-4-git-send-email-skomatineni@nvidia.com>
References: <1587150844-12003-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1587150844-12003-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: adrian.hunter@intel.com, ulf.hansson@linaro.org, baolin.wang@linaro.org, kstewart@linuxfoundation.org, tglx@linutronix.de, bradleybolen@gmail.com, gregkh@linuxfoundation.org, faiz_abbas@ti.com, thierry.reding@gmail.com, jonathanh@nvidia.com, skomatineni@nvidia.com
Cc: bbiswas@nvidia.com, anrao@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

commit ff124c31ccd7
("sdhci: tegra: Enable MMC_CAP_WAIT_WHILE_BUSY host capability")

Tegra sdhci host supports HW busy detection of the device busy
signaling over data0 lane.

So, this patch enables host capability MMC_CAP_WAIT_WHILE_BUSY.

Cc: <stable@vger.kernel.org>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/mmc/host/sdhci-tegra.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
index 0f4de73..fde1f3b 100644
--- a/drivers/mmc/host/sdhci-tegra.c
+++ b/drivers/mmc/host/sdhci-tegra.c
@@ -529,6 +529,8 @@ static int sdhci_tegra_probe(struct platform_device *pdev)
 	if (rc)
 		goto err_parse_dt;
 
+	host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY;
+
 	if (tegra_host->soc_data->nvquirks & NVQUIRK_ENABLE_DDR50)
 		host->mmc->caps |= MMC_CAP_1_8V_DDR;
 
-- 
2.7.4
