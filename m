From: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 3/3] usb: gadget: tegra-xudc: add port_speed_quirk
Date: Mon, 4 May 2020 12:04:41 +0530
Message-ID: <1588574081-23160-4-git-send-email-nkristam@nvidia.com>
References: <1588574081-23160-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1588574081-23160-1-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

OTG port on Tegra194 supports GEN1 speeds when in device mode and GEN2
speeds when in host mode. dd port_speed_quirk that configures port to
GEN1/GEN2 speds, corresponding to the mode.

Based on work by WayneChang <waynec-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Signed-off-by: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
V2:
 - Updated commit message to explain on why this change is needed.
 - Fixed checkpatch errors.
---
 drivers/usb/gadget/udc/tegra-xudc.c | 106 ++++++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 04c6a06..8111b32 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -158,6 +158,30 @@
 #define  SSPX_CORE_CNT32_POLL_TBURST_MAX_MASK GENMASK(7, 0)
 #define  SSPX_CORE_CNT32_POLL_TBURST_MAX(x) ((x) & \
 					SSPX_CORE_CNT32_POLL_TBURST_MAX_MASK)
+#define SSPX_CORE_CNT56 0x6fc
+#define  SSPX_CORE_CNT56_SCD_BIT0_TRPT_MAX_MASK GENMASK(19, 0)
+#define  SSPX_CORE_CNT56_SCD_BIT0_TRPT_MAX(x) ((x) & \
+				SSPX_CORE_CNT56_SCD_BIT0_TRPT_MAX_MASK)
+#define SSPX_CORE_CNT57 0x700
+#define  SSPX_CORE_CNT57_SCD_BIT1_TRPT_MAX_MASK GENMASK(19, 0)
+#define  SSPX_CORE_CNT57_SCD_BIT1_TRPT_MAX(x) ((x) & \
+				SSPX_CORE_CNT57_SCD_BIT1_TRPT_MAX_MASK)
+#define SSPX_CORE_CNT65 0x720
+#define  SSPX_CORE_CNT65_TX_SCD_END_TRPT_MID_MASK GENMASK(19, 0)
+#define  SSPX_CORE_CNT65_TX_SCD_END_TRPT_MID(x) ((x) & \
+				SSPX_CORE_CNT65_TX_SCD_END_TRPT_MID_MASK)
+#define SSPX_CORE_CNT66 0x724
+#define  SSPX_CORE_CNT66_TX_SCD_BIT0_TRPT_MID_MASK GENMASK(19, 0)
+#define  SSPX_CORE_CNT66_TX_SCD_BIT0_TRPT_MID(x) ((x) & \
+				SSPX_CORE_CNT66_TX_SCD_BIT0_TRPT_MID_MASK)
+#define SSPX_CORE_CNT67 0x728
+#define  SSPX_CORE_CNT67_TX_SCD_BIT1_TRPT_MID_MASK GENMASK(19, 0)
+#define  SSPX_CORE_CNT67_TX_SCD_BIT1_TRPT_MID(x) ((x) & \
+				SSPX_CORE_CNT67_TX_SCD_BIT1_TRPT_MID_MASK)
+#define SSPX_CORE_CNT72 0x73c
+#define  SSPX_CORE_CNT72_SCD_LFPS_TIMEOUT_MASK GENMASK(19, 0)
+#define  SSPX_CORE_CNT72_SCD_LFPS_TIMEOUT(x) ((x) & \
+				SSPX_CORE_CNT72_SCD_LFPS_TIMEOUT_MASK)
 #define SSPX_CORE_PADCTL4 0x750
 #define  SSPX_CORE_PADCTL4_RXDAT_VLD_TIMEOUT_U3_MASK GENMASK(19, 0)
 #define  SSPX_CORE_PADCTL4_RXDAT_VLD_TIMEOUT_U3(x) ((x) & \
@@ -530,6 +554,7 @@ struct tegra_xudc_soc {
 	bool invalid_seq_num;
 	bool pls_quirk;
 	bool port_reset_quirk;
+	bool port_speed_quirk;
 	bool has_ipfs;
 };
 
@@ -599,6 +624,78 @@ static inline void dump_trb(struct tegra_xudc *xudc, const char *type,
 		trb->control);
 }
 
+static void tegra_xudc_limit_port_speed(struct tegra_xudc *xudc)
+{
+	u32 val;
+
+	/* limit port speed to gen 1 */
+	val = xudc_readl(xudc, SSPX_CORE_CNT56);
+	val &= ~(SSPX_CORE_CNT56_SCD_BIT0_TRPT_MAX_MASK);
+	val |= SSPX_CORE_CNT56_SCD_BIT0_TRPT_MAX(0x260);
+	xudc_writel(xudc, val, SSPX_CORE_CNT56);
+
+	val = xudc_readl(xudc, SSPX_CORE_CNT57);
+	val &= ~(SSPX_CORE_CNT57_SCD_BIT1_TRPT_MAX_MASK);
+	val |= SSPX_CORE_CNT57_SCD_BIT1_TRPT_MAX(0x6D6);
+	xudc_writel(xudc, val, SSPX_CORE_CNT57);
+
+	val = xudc_readl(xudc, SSPX_CORE_CNT65);
+	val &= ~(SSPX_CORE_CNT65_TX_SCD_END_TRPT_MID_MASK);
+	val |= SSPX_CORE_CNT65_TX_SCD_END_TRPT_MID(0x4B0);
+	xudc_writel(xudc, val, SSPX_CORE_CNT66);
+
+	val = xudc_readl(xudc, SSPX_CORE_CNT66);
+	val &= ~(SSPX_CORE_CNT66_TX_SCD_BIT0_TRPT_MID_MASK);
+	val |= SSPX_CORE_CNT66_TX_SCD_BIT0_TRPT_MID(0x4B0);
+	xudc_writel(xudc, val, SSPX_CORE_CNT66);
+
+	val = xudc_readl(xudc, SSPX_CORE_CNT67);
+	val &= ~(SSPX_CORE_CNT67_TX_SCD_BIT1_TRPT_MID_MASK);
+	val |= SSPX_CORE_CNT67_TX_SCD_BIT1_TRPT_MID(0x4B0);
+	xudc_writel(xudc, val, SSPX_CORE_CNT67);
+
+	val = xudc_readl(xudc, SSPX_CORE_CNT72);
+	val &= ~(SSPX_CORE_CNT72_SCD_LFPS_TIMEOUT_MASK);
+	val |= SSPX_CORE_CNT72_SCD_LFPS_TIMEOUT(0x10);
+	xudc_writel(xudc, val, SSPX_CORE_CNT72);
+}
+
+static void tegra_xudc_restore_port_speed(struct tegra_xudc *xudc)
+{
+	u32 val;
+
+	/* restore port speed to gen2 */
+	val = xudc_readl(xudc, SSPX_CORE_CNT56);
+	val &= ~(SSPX_CORE_CNT56_SCD_BIT0_TRPT_MAX_MASK);
+	val |= SSPX_CORE_CNT56_SCD_BIT0_TRPT_MAX(0x438);
+	xudc_writel(xudc, val, SSPX_CORE_CNT56);
+
+	val = xudc_readl(xudc, SSPX_CORE_CNT57);
+	val &= ~(SSPX_CORE_CNT57_SCD_BIT1_TRPT_MAX_MASK);
+	val |= SSPX_CORE_CNT57_SCD_BIT1_TRPT_MAX(0x528);
+	xudc_writel(xudc, val, SSPX_CORE_CNT57);
+
+	val = xudc_readl(xudc, SSPX_CORE_CNT65);
+	val &= ~(SSPX_CORE_CNT65_TX_SCD_END_TRPT_MID_MASK);
+	val |= SSPX_CORE_CNT65_TX_SCD_END_TRPT_MID(0xE10);
+	xudc_writel(xudc, val, SSPX_CORE_CNT66);
+
+	val = xudc_readl(xudc, SSPX_CORE_CNT66);
+	val &= ~(SSPX_CORE_CNT66_TX_SCD_BIT0_TRPT_MID_MASK);
+	val |= SSPX_CORE_CNT66_TX_SCD_BIT0_TRPT_MID(0x348);
+	xudc_writel(xudc, val, SSPX_CORE_CNT66);
+
+	val = xudc_readl(xudc, SSPX_CORE_CNT67);
+	val &= ~(SSPX_CORE_CNT67_TX_SCD_BIT1_TRPT_MID_MASK);
+	val |= SSPX_CORE_CNT67_TX_SCD_BIT1_TRPT_MID(0x5a0);
+	xudc_writel(xudc, val, SSPX_CORE_CNT67);
+
+	val = xudc_readl(xudc, SSPX_CORE_CNT72);
+	val &= ~(SSPX_CORE_CNT72_SCD_LFPS_TIMEOUT_MASK);
+	val |= SSPX_CORE_CNT72_SCD_LFPS_TIMEOUT(0x1c21);
+	xudc_writel(xudc, val, SSPX_CORE_CNT72);
+}
+
 static void tegra_xudc_device_mode_on(struct tegra_xudc *xudc)
 {
 	int err;
@@ -631,6 +728,9 @@ static void tegra_xudc_device_mode_off(struct tegra_xudc *xudc)
 
 	reinit_completion(&xudc->disconnect_complete);
 
+	if (xudc->soc->port_speed_quirk)
+		tegra_xudc_restore_port_speed(xudc);
+
 	phy_set_mode_ext(xudc->curr_utmi_phy, PHY_MODE_USB_OTG, USB_ROLE_NONE);
 
 	pls = (xudc_readl(xudc, PORTSC) & PORTSC_PLS_MASK) >>
@@ -3274,6 +3374,9 @@ static void tegra_xudc_device_params_init(struct tegra_xudc *xudc)
 		xudc_writel(xudc, val, BLCG);
 	}
 
+	if (xudc->soc->port_speed_quirk)
+		tegra_xudc_limit_port_speed(xudc);
+
 	/* Set a reasonable U3 exit timer value. */
 	val = xudc_readl(xudc, SSPX_CORE_PADCTL4);
 	val &= ~(SSPX_CORE_PADCTL4_RXDAT_VLD_TIMEOUT_U3_MASK);
@@ -3506,6 +3609,7 @@ static struct tegra_xudc_soc tegra210_xudc_soc_data = {
 	.invalid_seq_num = true,
 	.pls_quirk = true,
 	.port_reset_quirk = true,
+	.port_speed_quirk = false,
 	.has_ipfs = true,
 };
 
@@ -3519,6 +3623,7 @@ static struct tegra_xudc_soc tegra186_xudc_soc_data = {
 	.invalid_seq_num = false,
 	.pls_quirk = false,
 	.port_reset_quirk = false,
+	.port_speed_quirk = false,
 	.has_ipfs = false,
 };
 
@@ -3532,6 +3637,7 @@ static struct tegra_xudc_soc tegra194_xudc_soc_data = {
 	.invalid_seq_num = false,
 	.pls_quirk = false,
 	.port_reset_quirk = false,
+	.port_speed_quirk = true,
 	.has_ipfs = false,
 };
 
-- 
2.7.4
