From: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V3 09/12] PCI: tegra: Enable PCIe xclk clock clamping
Date: Mon, 30 Oct 2017 19:27:20 +0530
Message-ID: <1509371843-22931-10-git-send-email-mmaddireddy@nvidia.com>
References: <1509371843-22931-1-git-send-email-mmaddireddy@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1509371843-22931-1-git-send-email-mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch enables PCIe xlck clock clamping by pad control. Pad control
asserts UPHY lane sleep signal when L1 entry signal received from PCIe.
UPHY sleep signal assertion is done per lane. Default clamp threshold
margin is not enough to assert all UPHY lane sleep signals. Increase
the clamp threshold in Tegra124, 132, 210 and 186.

Signed-off-by: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
V3:
* Parentheses removed for OR operation
V2:
* no change in this patch

 drivers/pci/host/pci-tegra.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index 34740a7033f7..9f13e6fcc64e 100644
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@ -226,8 +226,14 @@
 #define  RP_VEND_CTL2_PCA_ENABLE (1 << 7)
 
 #define RP_PRIV_MISC	0x00000fe0
-#define  RP_PRIV_MISC_PRSNT_MAP_EP_PRSNT (0xe << 0)
-#define  RP_PRIV_MISC_PRSNT_MAP_EP_ABSNT (0xf << 0)
+#define  RP_PRIV_MISC_PRSNT_MAP_EP_PRSNT		(0xe << 0)
+#define  RP_PRIV_MISC_PRSNT_MAP_EP_ABSNT		(0xf << 0)
+#define  RP_PRIV_MISC_CTLR_CLK_CLAMP_THRESHOLD_MASK	(0x7f << 16)
+#define  RP_PRIV_MISC_CTLR_CLK_CLAMP_THRESHOLD		(0xf << 16)
+#define  RP_PRIV_MISC_CTLR_CLK_CLAMP_ENABLE		(1 << 23)
+#define  RP_PRIV_MISC_TMS_CLK_CLAMP_THRESHOLD_MASK	(0x7f << 24)
+#define  RP_PRIV_MISC_TMS_CLK_CLAMP_THRESHOLD		(0xf << 24)
+#define  RP_PRIV_MISC_TMS_CLK_CLAMP_ENABLE		(1 << 31)
 
 #define RP_LINK_CONTROL_STATUS			0x00000090
 #define  RP_LINK_CONTROL_STATUS_DL_LINK_ACTIVE	0x20000000
@@ -302,6 +308,7 @@ struct tegra_pcie_soc {
 	bool force_pca_enable;
 	bool program_uphy;
 	bool program_ectl_settings;
+	bool update_clamp_threshold;
 };
 
 static inline struct tegra_msi *to_tegra_msi(struct msi_controller *chip)
@@ -2158,6 +2165,7 @@ static void tegra_pcie_enable_rp_features(struct tegra_pcie_port *port)
 
 static void tegra_pcie_apply_sw_fixup(struct tegra_pcie_port *port)
 {
+	const struct tegra_pcie_soc *soc = port->pcie->soc;
 	unsigned long value;
 
 	/* Optimal settings to enhance bandwidth */
@@ -2172,6 +2180,17 @@ static void tegra_pcie_apply_sw_fixup(struct tegra_pcie_port *port)
 	value = readl(port->base + RP_VEND_XP_BIST);
 	value |= RP_VEND_XP_BIST_GOTO_L1_L2_AFTER_DLLP_DONE;
 	writel(value, port->base + RP_VEND_XP_BIST);
+
+	value = readl(port->base + RP_PRIV_MISC);
+	value |= RP_PRIV_MISC_CTLR_CLK_CLAMP_ENABLE |
+			RP_PRIV_MISC_TMS_CLK_CLAMP_ENABLE;
+	if (soc->update_clamp_threshold) {
+		value &= ~(RP_PRIV_MISC_CTLR_CLK_CLAMP_THRESHOLD_MASK |
+				RP_PRIV_MISC_TMS_CLK_CLAMP_THRESHOLD_MASK);
+		value |= RP_PRIV_MISC_CTLR_CLK_CLAMP_THRESHOLD |
+				RP_PRIV_MISC_TMS_CLK_CLAMP_THRESHOLD;
+	}
+	writel(value, port->base + RP_PRIV_MISC);
 }
 /*
  * FIXME: If there are no PCIe cards attached, then calling this function
@@ -2309,6 +2328,7 @@ static const struct tegra_pcie_soc tegra20_pcie = {
 	.force_pca_enable = false,
 	.program_uphy = true,
 	.program_ectl_settings = false,
+	.update_clamp_threshold = false,
 };
 
 static const struct tegra_pcie_soc tegra30_pcie = {
@@ -2326,6 +2346,7 @@ static const struct tegra_pcie_soc tegra30_pcie = {
 	.force_pca_enable = false,
 	.program_uphy = true,
 	.program_ectl_settings = false,
+	.update_clamp_threshold = false,
 };
 
 static const struct tegra_pcie_soc tegra124_pcie = {
@@ -2342,6 +2363,7 @@ static const struct tegra_pcie_soc tegra124_pcie = {
 	.force_pca_enable = false,
 	.program_uphy = true,
 	.program_ectl_settings = false,
+	.update_clamp_threshold = true,
 };
 
 static const struct tegra_pcie_soc tegra210_pcie = {
@@ -2366,6 +2388,7 @@ static const struct tegra_pcie_soc tegra210_pcie = {
 	.force_pca_enable = true,
 	.program_uphy = true,
 	.program_ectl_settings = true,
+	.update_clamp_threshold = true,
 };
 
 static const struct tegra_pcie_soc tegra186_pcie = {
@@ -2383,6 +2406,7 @@ static const struct tegra_pcie_soc tegra186_pcie = {
 	.force_pca_enable = false,
 	.program_uphy = false,
 	.program_ectl_settings = false,
+	.update_clamp_threshold = false,
 };
 
 static const struct of_device_id tegra_pcie_of_match[] = {
-- 
2.1.4
