From: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V1 3/4] usb: gadget: tegra-xudc: Add Tegra194 support
Date: Thu, 16 Apr 2020 13:04:19 +0530
Message-ID: <1587022460-31988-4-git-send-email-nkristam@nvidia.com>
References: <1587022460-31988-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1587022460-31988-1-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This commit adds support for XUSB device mode controller support on
Tegra194 SoC. This is very similar to the existing Tegra186 XUDC, with lpm
support added in addition.

Signed-off-by: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 52a6add..fb01117 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -3494,6 +3494,13 @@ static const char * const tegra186_xudc_clock_names[] = {
 	"fs_src",
 };
 
+static const char * const tegra194_xudc_clock_names[] = {
+	"dev",
+	"ss",
+	"ss_src",
+	"fs_src",
+};
+
 static struct tegra_xudc_soc tegra210_xudc_soc_data = {
 	.supply_names = tegra210_xudc_supply_names,
 	.num_supplies = ARRAY_SIZE(tegra210_xudc_supply_names),
@@ -3522,6 +3529,19 @@ static struct tegra_xudc_soc tegra186_xudc_soc_data = {
 	.has_ipfs = false,
 };
 
+static struct tegra_xudc_soc tegra194_xudc_soc_data = {
+	.clock_names = tegra194_xudc_clock_names,
+	.num_clks = ARRAY_SIZE(tegra194_xudc_clock_names),
+	.num_phys = 4,
+	.u1_enable = true,
+	.u2_enable = true,
+	.lpm_enable = true,
+	.invalid_seq_num = false,
+	.pls_quirk = false,
+	.port_reset_quirk = false,
+	.has_ipfs = false,
+};
+
 static const struct of_device_id tegra_xudc_of_match[] = {
 	{
 		.compatible = "nvidia,tegra210-xudc",
@@ -3531,6 +3551,10 @@ static const struct of_device_id tegra_xudc_of_match[] = {
 		.compatible = "nvidia,tegra186-xudc",
 		.data = &tegra186_xudc_soc_data
 	},
+	{
+		.compatible = "nvidia,tegra194-xudc",
+		.data = &tegra194_xudc_soc_data
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, tegra_xudc_of_match);
-- 
2.7.4
