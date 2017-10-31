From: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 2/4] PCI: tegra: Enable ASPM-L1 capability advertisement
Date: Tue, 31 Oct 2017 09:52:47 +0530
Message-ID: <1509423769-10522-3-git-send-email-vidyas@nvidia.com>
References: <1509423769-10522-1-git-send-email-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1509423769-10522-1-git-send-email-vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, rajatja-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, yinghai-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org, Julia.Lawall-L2FTfq7BK8M@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Enables advertisement of ASPM-L1 support in capability
registers of applicable Tegra chips

Signed-off-by: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
V2:
* no change in this patch

 drivers/pci/host/pci-tegra.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index adae03d671ab..e1526cc5d381 100644
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@ -226,6 +226,9 @@
 #define  RP_VEND_XP_UPDATE_FC_THRESHOLD_MASK	(0xff << 18)
 #define  RP_VEND_XP_UPDATE_FC_THRESHOLD_T210	(0x60 << 18)
 
+#define RP_VEND_XP1	0xf04
+#define RP_VEND_XP1_LINK_PVT_CTL_L1_ASPM_SUPPORT	BIT(21)
+
 #define RP_VEND_CTL0	0xf44
 #define  RP_VEND_CTL0_DSK_RST_PULSE_WIDTH_MASK	(0xf << 12)
 #define  RP_VEND_CTL0_DSK_RST_PULSE_WIDTH	(0x9 << 12)
@@ -327,6 +330,7 @@ struct tegra_pcie_soc {
 	bool RAW_violation_fixup;
 	bool program_deskew_time;
 	bool updateFC_threshold;
+	bool has_aspm_l1;
 };
 
 static inline struct tegra_msi *to_tegra_msi(struct msi_controller *chip)
@@ -2188,6 +2192,13 @@ static void tegra_pcie_enable_rp_features(struct tegra_pcie_port *port)
 	value = readl(port->base + RP_VEND_CTL1);
 	value |= RP_VEND_CTL1_ERPT;
 	writel(value, port->base + RP_VEND_CTL1);
+
+	if (port->pcie->soc->has_aspm_l1) {
+		/* Advertise ASPM-L1 state capability*/
+		value = readl(port->base + RP_VEND_XP1);
+		value |= RP_VEND_XP1_LINK_PVT_CTL_L1_ASPM_SUPPORT;
+		writel(value, port->base + RP_VEND_XP1);
+	}
 }
 
 static void tegra_pcie_apply_sw_fixup(struct tegra_pcie_port *port)
@@ -2391,6 +2402,7 @@ static const struct tegra_pcie_soc tegra20_pcie = {
 	.RAW_violation_fixup = false,
 	.program_deskew_time = false,
 	.updateFC_threshold = false,
+	.has_aspm_l1 = false,
 };
 
 static const struct tegra_pcie_soc tegra30_pcie = {
@@ -2412,6 +2424,7 @@ static const struct tegra_pcie_soc tegra30_pcie = {
 	.RAW_violation_fixup = false,
 	.program_deskew_time = false,
 	.updateFC_threshold = false,
+	.has_aspm_l1 = true,
 };
 
 static const struct tegra_pcie_soc tegra124_pcie = {
@@ -2432,6 +2445,7 @@ static const struct tegra_pcie_soc tegra124_pcie = {
 	.RAW_violation_fixup = true,
 	.program_deskew_time = false,
 	.updateFC_threshold = false,
+	.has_aspm_l1 = true,
 };
 
 static const struct tegra_pcie_soc tegra210_pcie = {
@@ -2460,6 +2474,7 @@ static const struct tegra_pcie_soc tegra210_pcie = {
 	.RAW_violation_fixup = false,
 	.program_deskew_time = true,
 	.updateFC_threshold = true,
+	.has_aspm_l1 = true,
 };
 
 static const struct tegra_pcie_soc tegra186_pcie = {
@@ -2481,6 +2496,7 @@ static const struct tegra_pcie_soc tegra186_pcie = {
 	.RAW_violation_fixup = false,
 	.program_deskew_time = false,
 	.updateFC_threshold = false,
+	.has_aspm_l1 = true,
 };
 
 static const struct of_device_id tegra_pcie_of_match[] = {
-- 
2.7.4
