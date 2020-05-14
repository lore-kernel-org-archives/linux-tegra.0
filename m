From: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V3 7/8] phy: tegra: xusb: Enable charger detect for Tegra186
Date: Thu, 14 May 2020 11:52:42 +0530
Message-ID: <1589437363-16727-8-git-send-email-nkristam@nvidia.com>
References: <1589437363-16727-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1589437363-16727-1-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Tegra186 SoC supports charger detect, set corresponding soc flag.

Signed-off-by: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
V3:
 - Used supports_charger_detect name instead of charger_detect.
 - Added Acked-by updates to commit message.
---
V2:
 - Patch re-based.
---
 drivers/phy/tegra/xusb-tegra186.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index 59b78a7..da61721 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -1041,6 +1041,7 @@ const struct tegra_xusb_padctl_soc tegra186_xusb_padctl_soc = {
 	.ops = &tegra186_xusb_padctl_ops,
 	.supply_names = tegra186_xusb_padctl_supply_names,
 	.num_supplies = ARRAY_SIZE(tegra186_xusb_padctl_supply_names),
+	.supports_charger_detect = true,
 };
 EXPORT_SYMBOL_GPL(tegra186_xusb_padctl_soc);
 #endif
-- 
2.7.4
