From: JC Kuo <jckuo@nvidia.com>
Subject: [PATCH v3 3/7] phy: tegra: xusb: Protect Tegra186 soc with config
Date: Sat, 5 Oct 2019 00:29:02 +0800
Message-ID: <20191004162906.4818-4-jckuo@nvidia.com>
References: <20191004162906.4818-1-jckuo@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191004162906.4818-1-jckuo@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com, skomatineni@nvidia.com, JC Kuo <jckuo@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

As xusb-tegra186.c will be reused for Tegra194, it would be good to
protect Tegra186 soc data with CONFIG_ARCH_TEGRA_186_SOC. This commit
also reshuffles Tegra186 soc data single CONFIG_ARCH_TEGRA_186_SOC
will be sufficient.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
Changes in v3: none
Changes in v2:
- new patch to protect Tegra186 soc data with config

 drivers/phy/tegra/xusb-tegra186.c | 70 ++++++++++++++++---------------
 1 file changed, 36 insertions(+), 34 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index 6f3afaf9398f..3b60270f2009 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -503,19 +503,6 @@ static const char * const tegra186_usb2_functions[] = {
 	"xusb",
 };
 
-static const struct tegra_xusb_lane_soc tegra186_usb2_lanes[] = {
-	TEGRA186_LANE("usb2-0", 0,  0, 0, usb2),
-	TEGRA186_LANE("usb2-1", 0,  0, 0, usb2),
-	TEGRA186_LANE("usb2-2", 0,  0, 0, usb2),
-};
-
-static const struct tegra_xusb_pad_soc tegra186_usb2_pad = {
-	.name = "usb2",
-	.num_lanes = ARRAY_SIZE(tegra186_usb2_lanes),
-	.lanes = tegra186_usb2_lanes,
-	.ops = &tegra186_usb2_pad_ops,
-};
-
 static int tegra186_usb2_port_enable(struct tegra_xusb_port *port)
 {
 	return 0;
@@ -765,27 +752,6 @@ static const char * const tegra186_usb3_functions[] = {
 	"xusb",
 };
 
-static const struct tegra_xusb_lane_soc tegra186_usb3_lanes[] = {
-	TEGRA186_LANE("usb3-0", 0,  0, 0, usb3),
-	TEGRA186_LANE("usb3-1", 0,  0, 0, usb3),
-	TEGRA186_LANE("usb3-2", 0,  0, 0, usb3),
-};
-
-static const struct tegra_xusb_pad_soc tegra186_usb3_pad = {
-	.name = "usb3",
-	.num_lanes = ARRAY_SIZE(tegra186_usb3_lanes),
-	.lanes = tegra186_usb3_lanes,
-	.ops = &tegra186_usb3_pad_ops,
-};
-
-static const struct tegra_xusb_pad_soc * const tegra186_pads[] = {
-	&tegra186_usb2_pad,
-	&tegra186_usb3_pad,
-#if 0 /* TODO implement */
-	&tegra186_hsic_pad,
-#endif
-};
-
 static int
 tegra186_xusb_read_fuse_calibration(struct tegra186_xusb_padctl *padctl)
 {
@@ -862,6 +828,7 @@ static const struct tegra_xusb_padctl_ops tegra186_xusb_padctl_ops = {
 	.remove = tegra186_xusb_padctl_remove,
 };
 
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC)
 static const char * const tegra186_xusb_padctl_supply_names[] = {
 	"avdd-pll-erefeut",
 	"avdd-usb",
@@ -869,6 +836,40 @@ static const char * const tegra186_xusb_padctl_supply_names[] = {
 	"vddio-hsic",
 };
 
+static const struct tegra_xusb_lane_soc tegra186_usb2_lanes[] = {
+	TEGRA186_LANE("usb2-0", 0,  0, 0, usb2),
+	TEGRA186_LANE("usb2-1", 0,  0, 0, usb2),
+	TEGRA186_LANE("usb2-2", 0,  0, 0, usb2),
+};
+
+static const struct tegra_xusb_pad_soc tegra186_usb2_pad = {
+	.name = "usb2",
+	.num_lanes = ARRAY_SIZE(tegra186_usb2_lanes),
+	.lanes = tegra186_usb2_lanes,
+	.ops = &tegra186_usb2_pad_ops,
+};
+
+static const struct tegra_xusb_lane_soc tegra186_usb3_lanes[] = {
+	TEGRA186_LANE("usb3-0", 0,  0, 0, usb3),
+	TEGRA186_LANE("usb3-1", 0,  0, 0, usb3),
+	TEGRA186_LANE("usb3-2", 0,  0, 0, usb3),
+};
+
+static const struct tegra_xusb_pad_soc tegra186_usb3_pad = {
+	.name = "usb3",
+	.num_lanes = ARRAY_SIZE(tegra186_usb3_lanes),
+	.lanes = tegra186_usb3_lanes,
+	.ops = &tegra186_usb3_pad_ops,
+};
+
+static const struct tegra_xusb_pad_soc * const tegra186_pads[] = {
+	&tegra186_usb2_pad,
+	&tegra186_usb3_pad,
+#if 0 /* TODO implement */
+	&tegra186_hsic_pad,
+#endif
+};
+
 const struct tegra_xusb_padctl_soc tegra186_xusb_padctl_soc = {
 	.num_pads = ARRAY_SIZE(tegra186_pads),
 	.pads = tegra186_pads,
@@ -893,6 +894,7 @@ const struct tegra_xusb_padctl_soc tegra186_xusb_padctl_soc = {
 	.num_supplies = ARRAY_SIZE(tegra186_xusb_padctl_supply_names),
 };
 EXPORT_SYMBOL_GPL(tegra186_xusb_padctl_soc);
+#endif
 
 MODULE_AUTHOR("JC Kuo <jckuo@nvidia.com>");
 MODULE_DESCRIPTION("NVIDIA Tegra186 XUSB Pad Controller driver");
-- 
2.17.1
