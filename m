From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/5] clk: tegra: Add periph regs bank X
Date: Fri, 4 Oct 2013 12:12:41 +0300
Message-ID: <1380878014-22088-3-git-send-email-pdeschrijver@nvidia.com>
References: <1380878014-22088-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380878014-22088-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Tegra124 has an extra bank of peripheral clock registers. Add it to the
generic peripheral clock code.

Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk.c |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
index c8c84ce..0240dc3 100644
--- a/drivers/clk/tegra/clk.c
+++ b/drivers/clk/tegra/clk.c
@@ -57,6 +57,8 @@
 #define RST_DEVICES_CLR_V		0x434
 #define RST_DEVICES_SET_W		0x438
 #define RST_DEVICES_CLR_W		0x43c
+#define RST_DEVICES_SET_X		0x290
+#define RST_DEVICES_CLR_X		0x294
 
 /* Global data of Tegra CPU CAR ops */
 static struct tegra_cpu_car_ops dummy_car_ops;
@@ -109,6 +111,14 @@ static struct tegra_clk_periph_regs periph_regs[] = {
 		.rst_set_reg = RST_DEVICES_SET_W,
 		.rst_clr_reg = RST_DEVICES_CLR_W,
 	},
+	[5] = {
+		.enb_reg = CLK_OUT_ENB_X,
+		.enb_set_reg = CLK_OUT_ENB_SET_X,
+		.enb_clr_reg = CLK_OUT_ENB_CLR_X,
+		.rst_reg = RST_DEVICES_X,
+		.rst_set_reg = RST_DEVICES_SET_X,
+		.rst_clr_reg = RST_DEVICES_CLR_X,
+	},
 };
 
 struct tegra_clk_periph_regs * __init get_reg_bank(int clkid)
-- 
1.7.7.rc0.72.g4b5ea.dirty
