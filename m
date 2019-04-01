From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 3/6] usb: host: xhci-tegra: Add Tegra186 XUSB support
Date: Mon,  1 Apr 2019 12:40:47 +0200
Message-ID: <20190401104050.31355-4-thierry.reding@gmail.com>
References: <20190401104050.31355-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190401104050.31355-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Mathias Nyman <mathias.nyman@linux.intel.com>
List-Id: linux-tegra@vger.kernel.org

From: JC Kuo <jckuo@nvidia.com>

This commit adds Tegra186 XUSB host mode controller support. This is
very similar to the existing support for Tegra124 and Tegra210, except
that the number of ports and PHYs differs and the IPFS wrapper being
gone.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 4d133bbabdda..294158113d62 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1423,9 +1423,34 @@ static const struct tegra_xusb_soc tegra210_soc = {
 };
 MODULE_FIRMWARE("nvidia/tegra210/xusb.bin");
 
+static const char * const tegra186_supply_names[] = {
+};
+
+static const struct tegra_xusb_phy_type tegra186_phy_types[] = {
+	{ .name = "usb3", .num = 3, },
+	{ .name = "usb2", .num = 3, },
+	{ .name = "hsic", .num = 1, },
+};
+
+static const struct tegra_xusb_soc tegra186_soc = {
+	.firmware = "nvidia/tegra186/xusb.bin",
+	.supply_names = tegra186_supply_names,
+	.num_supplies = ARRAY_SIZE(tegra186_supply_names),
+	.phy_types = tegra186_phy_types,
+	.num_types = ARRAY_SIZE(tegra186_phy_types),
+	.ports = {
+		.usb3 = { .offset = 0, .count = 3, },
+		.usb2 = { .offset = 3, .count = 3, },
+		.hsic = { .offset = 6, .count = 1, },
+	},
+	.scale_ss_clock = false,
+	.has_ipfs = false,
+};
+
 static const struct of_device_id tegra_xusb_of_match[] = {
 	{ .compatible = "nvidia,tegra124-xusb", .data = &tegra124_soc },
 	{ .compatible = "nvidia,tegra210-xusb", .data = &tegra210_soc },
+	{ .compatible = "nvidia,tegra186-xusb", .data = &tegra186_soc },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, tegra_xusb_of_match);
-- 
2.21.0
