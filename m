From: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/4] PCI: tegra: fixups to avoid unnecessary wakeup from ASPM-L1.2
Date: Mon, 30 Oct 2017 16:33:05 +0530
Message-ID: <1509361385-21224-5-git-send-email-vidyas@nvidia.com>
References: <1509361385-21224-1-git-send-email-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1509361385-21224-1-git-send-email-vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, rajatja-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, yinghai-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org, Julia.Lawall-L2FTfq7BK8M@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

sets CLKREQ asserted delay to a higher value to avoid
unnecessary wake up from L1.2_ENTRY state for Tegra210

Signed-off-by: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pci/host/pci-tegra.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
index 08da67a82a2d..811209dedde2 100644
--- a/drivers/pci/host/pci-tegra.c
+++ b/drivers/pci/host/pci-tegra.c
@@ -204,6 +204,8 @@
 #define RP_L1_PM_SUBSTATES_1_CTL			0xC04
 #define RP_L1_PM_SUBSTATES_1_CTL_PWR_OFF_DLY_MASK	0x1FFF
 #define RP_L1_PM_SUBSTATES_1_CTL_PWR_OFF_DLY		0x26
+#define RP_L1SS_1_CTL_CLKREQ_ASSERTED_DLY_MASK		(0x1FF << 13)
+#define RP_L1SS_1_CTL_CLKREQ_ASSERTED_DLY		(0x27 << 13)
 
 #define RP_L1_PM_SUBSTATES_2_CTL			0xC08
 #define RP_L1_PM_SUBSTATES_2_CTL_T_L1_2_DLY_MASK	0x1FFF
@@ -354,6 +356,7 @@ struct tegra_pcie_soc {
 	bool updateFC_threshold;
 	bool has_aspm_l1;
 	bool has_aspm_l1ss;
+	bool l1ss_rp_wake_fixup;
 };
 
 static inline struct tegra_msi *to_tegra_msi(struct msi_controller *chip)
@@ -2307,6 +2310,16 @@ static void tegra_pcie_apply_sw_fixup(struct tegra_pcie_port *port)
 			(7 << RP_L1_PM_SUBSTATES_CTL_T_PWRN_VAL_SHIFT);
 		writel(value, port->base + RP_L1_PM_SUBSTATES_CTL);
 
+		if (soc->l1ss_rp_wake_fixup) {
+			/* Set CLKREQ asserted delay greater than Power_Off
+			 * time (2us) to avoid RP wakeup in L1.2_ENTRY
+			 */
+			value = readl(port->base + RP_L1_PM_SUBSTATES_1_CTL);
+			value &= ~RP_L1SS_1_CTL_CLKREQ_ASSERTED_DLY_MASK;
+			value |= RP_L1SS_1_CTL_CLKREQ_ASSERTED_DLY;
+			writel(value, port->base + RP_L1_PM_SUBSTATES_1_CTL);
+		}
+
 		/* Following is based on clk_m being 19.2 MHz */
 		value = readl(port->base + RP_L1_PM_SUBSTATES_1_CTL);
 		value &= ~RP_L1_PM_SUBSTATES_1_CTL_PWR_OFF_DLY_MASK;
@@ -2464,6 +2477,7 @@ static const struct tegra_pcie_soc tegra20_pcie = {
 	.updateFC_threshold = false,
 	.has_aspm_l1 = false,
 	.has_aspm_l1ss = false,
+	.l1ss_rp_wake_fixup = false,
 };
 
 static const struct tegra_pcie_soc tegra30_pcie = {
@@ -2487,6 +2501,7 @@ static const struct tegra_pcie_soc tegra30_pcie = {
 	.updateFC_threshold = false,
 	.has_aspm_l1 = true,
 	.has_aspm_l1ss = false,
+	.l1ss_rp_wake_fixup = false,
 };
 
 static const struct tegra_pcie_soc tegra124_pcie = {
@@ -2509,6 +2524,7 @@ static const struct tegra_pcie_soc tegra124_pcie = {
 	.updateFC_threshold = false,
 	.has_aspm_l1 = true,
 	.has_aspm_l1ss = false,
+	.l1ss_rp_wake_fixup = false,
 };
 
 static const struct tegra_pcie_soc tegra210_pcie = {
@@ -2539,6 +2555,7 @@ static const struct tegra_pcie_soc tegra210_pcie = {
 	.updateFC_threshold = true,
 	.has_aspm_l1 = true,
 	.has_aspm_l1ss = true,
+	.l1ss_rp_wake_fixup = true,
 };
 
 static const struct tegra_pcie_soc tegra186_pcie = {
@@ -2562,6 +2579,7 @@ static const struct tegra_pcie_soc tegra186_pcie = {
 	.updateFC_threshold = false,
 	.has_aspm_l1 = true,
 	.has_aspm_l1ss = true,
+	.l1ss_rp_wake_fixup = false,
 };
 
 static const struct of_device_id tegra_pcie_of_match[] = {
-- 
2.7.4
