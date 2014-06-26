From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] clk: tegra: export clock names for debugging
Date: Thu, 26 Jun 2014 18:48:25 +0300
Message-ID: <1403797705-26910-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

When writing a module for testing or debugging purposes, there is no way to
get hold of clk handles. This patch solves this by exposing all valid clocks
as clkdev's for the virtual device tegra-clk-debug.

Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
index c0a7d77..3315fca 100644
--- a/drivers/clk/tegra/clk.c
+++ b/drivers/clk/tegra/clk.c
@@ -277,6 +277,12 @@ void __init tegra_register_devclks(struct tegra_devclk *dev_clks, int num)
 	for (i = 0; i < num; i++, dev_clks++)
 		clk_register_clkdev(clks[dev_clks->dt_id], dev_clks->con_id,
 				dev_clks->dev_id);
+
+	for (i = 0; i < clk_num; i++) {
+		if (!IS_ERR(clks[i]) || !clks[i])
+			clk_register_clkdev(clks[i], __clk_get_name(clks[i]),
+				"tegra-clk-debug");
+	}
 }
 
 struct clk ** __init tegra_lookup_dt_id(int clk_id,
-- 
1.7.7.rc0.72.g4b5ea.dirty
