From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 2/2] usb: phy: tegra: Read UTMIP parameters from device tree
Date: Wed, 26 Jun 2013 15:34:40 +0300
Message-ID: <1372250080-10945-3-git-send-email-mperttunen@nvidia.com>
References: <1372250080-10945-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372250080-10945-1-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

UTMIP parameters used to be hardcoded into tables in the
PHY driver. This patch reads them from the device tree instead
in accordance with the phy-tegra-usb DT documentation.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/phy/phy-tegra-usb.c | 129 +++++++++++++++++++++++++++-------------
 1 file changed, 87 insertions(+), 42 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index b3b4809..0352886c 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -185,27 +185,6 @@ static const struct tegra_xtal_freq tegra_freq_table[] = {
 	},
 };
 
-static struct tegra_utmip_config utmip_default[] = {
-	[0] = {
-		.hssync_start_delay = 9,
-		.idle_wait_delay = 17,
-		.elastic_limit = 16,
-		.term_range_adj = 6,
-		.xcvr_setup = 9,
-		.xcvr_lsfslew = 1,
-		.xcvr_lsrslew = 1,
-	},
-	[2] = {
-		.hssync_start_delay = 9,
-		.idle_wait_delay = 17,
-		.elastic_limit = 16,
-		.term_range_adj = 6,
-		.xcvr_setup = 9,
-		.xcvr_lsfslew = 2,
-		.xcvr_lsrslew = 2,
-	},
-};
-
 static void set_pts(struct tegra_usb_phy *phy, u8 pts_val)
 {
 	void __iomem *base = phy->regs;
@@ -727,13 +706,6 @@ static int tegra_usb_phy_init(struct tegra_usb_phy *phy)
 	int i;
 	int err;
 
-	if (!phy->is_ulpi_phy) {
-		if (phy->is_legacy_phy)
-			phy->config = &utmip_default[0];
-		else
-			phy->config = &utmip_default[2];
-	}
-
 	phy->pll_u = devm_clk_get(phy->dev, "pll_u");
 	if (IS_ERR(phy->pll_u)) {
 		pr_err("Can't get pll_u clock\n");
@@ -808,6 +780,88 @@ void tegra_ehci_phy_restore_end(struct usb_phy *x)
 }
 EXPORT_SYMBOL_GPL(tegra_ehci_phy_restore_end);
 
+static int read_utmi_param(struct platform_device *pdev, const char *param,
+			   u8 *dest)
+{
+	u32 value;
+	int err = of_property_read_u32(pdev->dev.of_node, param, &value);
+	*dest = (u8)value;
+	if (err < 0)
+		dev_err(&pdev->dev, "Failed to read USB UTMI parameter %s: %d\n",
+			param, err);
+	return err;
+}
+
+static int utmi_phy_probe(struct tegra_usb_phy *tegra_phy,
+			  struct platform_device *pdev)
+{
+	struct resource *res;
+	int err;
+	struct tegra_utmip_config *config;
+
+	tegra_phy->is_ulpi_phy = false;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	if (!res) {
+		dev_err(&pdev->dev, "Failed to get UTMI Pad regs\n");
+		return  -ENXIO;
+	}
+
+	tegra_phy->pad_regs = devm_ioremap(&pdev->dev, res->start,
+		resource_size(res));
+	if (!tegra_phy->regs) {
+		dev_err(&pdev->dev, "Failed to remap UTMI Pad regs\n");
+		return -ENOMEM;
+	}
+
+	tegra_phy->config = devm_kzalloc(&pdev->dev,
+		sizeof(*tegra_phy->config), GFP_KERNEL);
+	if (!tegra_phy->config) {
+		dev_err(&pdev->dev,
+			"unable to allocate memory for USB UTMIP config\n");
+		return -ENOMEM;
+	}
+
+	config = tegra_phy->config;
+
+	err = read_utmi_param(pdev, "nvidia,hssync-start-delay",
+		&config->hssync_start_delay);
+	if (err < 0)
+		return err;
+
+	err = read_utmi_param(pdev, "nvidia,elastic-limit",
+		&config->elastic_limit);
+	if (err < 0)
+		return err;
+
+	err = read_utmi_param(pdev, "nvidia,idle-wait-delay",
+		&config->idle_wait_delay);
+	if (err < 0)
+		return err;
+
+	err = read_utmi_param(pdev, "nvidia,term-range-adj",
+		&config->term_range_adj);
+	if (err < 0)
+		return err;
+
+	err = read_utmi_param(pdev, "nvidia,xcvr-setup",
+		&config->xcvr_setup);
+	if (err < 0)
+		return err;
+
+	err = read_utmi_param(pdev, "nvidia,xcvr-lsfslew",
+		&config->xcvr_lsfslew);
+	if (err < 0)
+		return err;
+
+	err = read_utmi_param(pdev, "nvidia,xcvr-lsrslew",
+		&config->xcvr_lsrslew);
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+
 static int tegra_usb_phy_probe(struct platform_device *pdev)
 {
 	struct resource *res;
@@ -839,20 +893,9 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 
 	err = of_property_match_string(np, "phy_type", "ulpi");
 	if (err < 0) {
-		tegra_phy->is_ulpi_phy = false;
-
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-		if (!res) {
-			dev_err(&pdev->dev, "Failed to get UTMI Pad regs\n");
-			return  -ENXIO;
-		}
