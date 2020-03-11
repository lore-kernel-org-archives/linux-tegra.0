From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 1/2] sdhci: tegra: Implement Tegra specific set_timeout callback
Date: Wed, 11 Mar 2020 01:54:06 -0700
Message-ID: <1583916847-30400-1-git-send-email-skomatineni@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kstewart-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, bradleybolen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: anrao-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

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

Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/mmc/host/sdhci-tegra.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
index a25c3a4..fa8f6a4 100644
--- a/drivers/mmc/host/sdhci-tegra.c
+++ b/drivers/mmc/host/sdhci-tegra.c
@@ -45,6 +45,7 @@
 #define SDHCI_TEGRA_CAP_OVERRIDES_DQS_TRIM_SHIFT	8
 
 #define SDHCI_TEGRA_VENDOR_MISC_CTRL			0x120
+#define SDHCI_MISC_CTRL_ERASE_TIMEOUT_LIMIT		BIT(0)
 #define SDHCI_MISC_CTRL_ENABLE_SDR104			0x8
 #define SDHCI_MISC_CTRL_ENABLE_SDR50			0x10
 #define SDHCI_MISC_CTRL_ENABLE_SDHCI_SPEC_300		0x20
@@ -1227,6 +1228,34 @@ static u32 sdhci_tegra_cqhci_irq(struct sdhci_host *host, u32 intmask)
 	return 0;
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
 static const struct cqhci_host_ops sdhci_tegra_cqhci_ops = {
 	.write_l    = tegra_cqhci_writel,
 	.enable	= sdhci_tegra_cqe_enable,
@@ -1366,6 +1395,7 @@ static const struct sdhci_ops tegra210_sdhci_ops = {
 	.set_uhs_signaling = tegra_sdhci_set_uhs_signaling,
 	.voltage_switch = tegra_sdhci_voltage_switch,
 	.get_max_clock = tegra_sdhci_get_max_clock,
+	.set_timeout = tegra_sdhci_set_timeout,
 };
 
 static const struct sdhci_pltfm_data sdhci_tegra210_pdata = {
@@ -1403,6 +1433,7 @@ static const struct sdhci_ops tegra186_sdhci_ops = {
 	.voltage_switch = tegra_sdhci_voltage_switch,
 	.get_max_clock = tegra_sdhci_get_max_clock,
 	.irq = sdhci_tegra_cqhci_irq,
+	.set_timeout = tegra_sdhci_set_timeout,
 };
 
 static const struct sdhci_pltfm_data sdhci_tegra186_pdata = {
-- 
2.7.4
