From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v10 9/9] usb: xhci: tegra: Add Tegra210 support
Date: Fri,  4 Mar 2016 17:19:39 +0100
Message-ID: <1457108379-20794-9-git-send-email-thierry.reding@gmail.com>
References: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457108379-20794-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Parameterize more parts of the driver and add support for Tegra210.

Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/host/xhci-tegra.c | 59 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 51 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index ab6f9856c5c4..426e8d922cf4 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -159,6 +159,8 @@ struct tegra_xusb_soc {
 			unsigned int count;
 		} usb2, ulpi, hsic, usb3;
 	} ports;
+
+	bool scale_ss_clock;
 };
 
 struct tegra_xusb {
@@ -495,13 +497,19 @@ static void tegra_xusb_mbox_handle(struct tegra_xusb *tegra,
 
 	case MBOX_CMD_INC_SSPI_CLOCK:
 	case MBOX_CMD_DEC_SSPI_CLOCK:
-		err = tegra_xusb_set_ss_clk(tegra, msg->data * 1000);
-		if (err < 0)
-			rsp.cmd = MBOX_CMD_NAK;
-		else
+		if (tegra->soc->scale_ss_clock) {
+			err = tegra_xusb_set_ss_clk(tegra, msg->data * 1000);
+			if (err < 0)
+				rsp.cmd = MBOX_CMD_NAK;
+			else
+				rsp.cmd = MBOX_CMD_ACK;
+
+			rsp.data = clk_get_rate(tegra->ss_src_clk) / 1000;
+		} else {
 			rsp.cmd = MBOX_CMD_ACK;
+			rsp.data = msg->data;
+		}
 
-		rsp.data = clk_get_rate(tegra->ss_src_clk) / 1000;
 		break;
 
 	case MBOX_CMD_SET_BW:
@@ -783,9 +791,11 @@ static int tegra_xusb_clk_enable(struct tegra_xusb *tegra)
 	if (err < 0)
 		goto disable_fs_src;
 
-	err = tegra_xusb_set_ss_clk(tegra, TEGRA_XHCI_SS_HIGH_SPEED);
-	if (err < 0)
-		goto disable_hs_src;
+	if (tegra->soc->scale_ss_clock) {
+		err = tegra_xusb_set_ss_clk(tegra, TEGRA_XHCI_SS_HIGH_SPEED);
+		if (err < 0)
+			goto disable_hs_src;
+	}
 
 	return 0;
 
@@ -890,11 +900,44 @@ static const struct tegra_xusb_soc tegra124_soc = {
 		.hsic = { .offset = 6, .count = 2, },
 		.usb3 = { .offset = 0, .count = 2, },
 	},
+	.scale_ss_clock = true,
 };
 MODULE_FIRMWARE("nvidia/tegra124/xusb.bin");
 
+static const char * const tegra210_supply_names[] = {
+	"dvddio-pex",
+	"hvddio-pex",
+	"avdd-usb",
+	"avdd-pll-utmip",
+	"avdd-pll-uerefe",
+	"dvdd-pex-pll",
+	"hvdd-pex-pll-e",
+};
+
+static const struct tegra_xusb_phy_type tegra210_phy_types[] = {
+	{ .name = "usb3", .num = 4, },
+	{ .name = "usb2", .num = 4, },
+	{ .name = "hsic", .num = 1, },
+};
+
+static const struct tegra_xusb_soc tegra210_soc = {
+	.firmware_file = "nvidia/tegra210/xusb.bin",
+	.supply_names = tegra210_supply_names,
+	.num_supplies = ARRAY_SIZE(tegra210_supply_names),
+	.phy_types = tegra210_phy_types,
+	.num_types = ARRAY_SIZE(tegra210_phy_types),
+	.ports = {
+		.usb2 = { .offset = 4, .count = 4, },
+		.hsic = { .offset = 8, .count = 1, },
+		.usb3 = { .offset = 0, .count = 4, },
+	},
+	.scale_ss_clock = false,
+};
+MODULE_FIRMWARE("nvidia/tegra210/xusb.bin");
+
 static const struct of_device_id tegra_xusb_of_match[] = {
 	{ .compatible = "nvidia,tegra124-xusb", .data = &tegra124_soc },
+	{ .compatible = "nvidia,tegra210-xusb", .data = &tegra210_soc },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, tegra_xusb_of_match);
-- 
2.7.1
