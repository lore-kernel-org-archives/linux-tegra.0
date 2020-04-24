From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH 4.19.113 2/3] sdhci: tegra: Implement Tegra specific set_timeout callback
Date: Fri, 24 Apr 2020 13:06:51 -0700
Message-ID: <1587758812-3331-3-git-send-email-skomatineni@nvidia.com>
References: <1587758812-3331-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1587758812-3331-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: adrian.hunter@intel.com, ulf.hansson@linaro.org, baolin.wang@linaro.org, kstewart@linuxfoundation.org, tglx@linutronix.de, bradleybolen@gmail.com, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, skomatineni@nvidia.com
Cc: anrao@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

commit 5e958e4aacf4
("sdhci: tegra: Implement Tegra specific set_timeout callback")

Tegra host supports HW busy detection and timeouts based on the
count programmed in SDHCI_TIMEOUT_CONTROL register and max busy
timeout it supports is 11s in finite busy wait mode.

Some operations like SLEEP_AWAKE, ERASE and flush cache through
SWITCH commands take longer than 11s and Tegra host supports
infinite HW busy wait mode where HW waits forever till the card
is busy without HW timeout.

This patch implements Tegra specific set_timeout sdhci_ops to allow
switching between finite and infinite HW busy detection wait modes
based on the device command expected operation time.

Cc: <stable@vger.kernel.org>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/mmc/host/sdhci-tegra.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
index 27bdf6d..0f4de73 100644
--- a/drivers/mmc/host/sdhci-tegra.c
+++ b/drivers/mmc/host/sdhci-tegra.c
@@ -39,6 +39,7 @@
 #define SDHCI_CLOCK_CTRL_SPI_MODE_CLKEN_OVERRIDE	BIT(2)
 
 #define SDHCI_TEGRA_VENDOR_MISC_CTRL		0x120
+#define SDHCI_MISC_CTRL_ERASE_TIMEOUT_LIMIT	BIT(0)
 #define SDHCI_MISC_CTRL_ENABLE_SDR104		0x8
 #define SDHCI_MISC_CTRL_ENABLE_SDR50		0x10
 #define SDHCI_MISC_CTRL_ENABLE_SDHCI_SPEC_300	0x20
@@ -301,6 +302,34 @@ static int tegra_sdhci_execute_tuning(struct sdhci_host *host, u32 opcode)
 	return mmc_send_tuning(host->mmc, opcode, NULL);
 }
 
+static void tegra_sdhci_set_timeout(struct sdhci_host *host,
+				    struct mmc_command *cmd)
+{
+	u32 val;
+
+	/*
+	 * HW busy detection timeout is based on programmed data timeout
+	 * counter and maximum supported timeout is 11s which may not be
+	 * enough for long operations like cache flush, sleep awake, erase.
+	 *
+	 * ERASE_TIMEOUT_LIMIT bit of VENDOR_MISC_CTRL register allows
+	 * host controller to wait for busy state until the card is busy
+	 * without HW timeout.
+	 *
+	 * So, use infinite busy wait mode for operations that may take
+	 * more than maximum HW busy timeout of 11s otherwise use finite
+	 * busy wait mode.
+	 */
+	val = sdhci_readl(host, SDHCI_TEGRA_VENDOR_MISC_CTRL);
+	if (cmd && cmd->busy_timeout >= 11 * HZ)
+		val |= SDHCI_MISC_CTRL_ERASE_TIMEOUT_LIMIT;
+	else
+		val &= ~SDHCI_MISC_CTRL_ERASE_TIMEOUT_LIMIT;
+	sdhci_writel(host, val, SDHCI_TEGRA_VENDOR_MISC_CTRL);
+
+	__sdhci_set_timeout(host, cmd);
+}
+
 static void tegra_sdhci_voltage_switch(struct sdhci_host *host)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
@@ -379,6 +408,7 @@ static const struct sdhci_ops tegra114_sdhci_ops = {
 	.set_uhs_signaling = tegra_sdhci_set_uhs_signaling,
 	.voltage_switch = tegra_sdhci_voltage_switch,
 	.get_max_clock = tegra_sdhci_get_max_clock,
+	.set_timeout = tegra_sdhci_set_timeout,
 };
 
 static const struct sdhci_pltfm_data sdhci_tegra114_pdata = {
-- 
2.7.4
