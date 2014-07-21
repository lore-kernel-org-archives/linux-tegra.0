From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] clk/tegra: Fix a bunch of sparse warnings
Date: Mon, 21 Jul 2014 13:23:21 +0200
Message-ID: <1405941801-27455-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The second to last parameter of the TEGRA_CLK_PERIPH macro denotes a
table and should therefore users should pass in NULL instead of 0.

Fixes a bunch of sparse warnings like this:

	warning: Using plain integer as NULL pointer

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra-periph.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index adf6b814b5bc..0bc59fba9e6a 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -218,7 +218,7 @@
 		.clk_id = _clk_id,					\
 		.p.parent_name = _parent_name,				\
 		.periph = TEGRA_CLK_PERIPH(0, 0, 0, 0, 0, 0, 0,		\
-				_clk_num, _gate_flags, 0, NULL),	\
+				_clk_num, _gate_flags, NULL, NULL),	\
 		.flags = _flags						\
 	}
 
-- 
2.0.1
