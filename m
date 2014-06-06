From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] clk: tegra: Fix typo in PLLE_MISC VREG_CTRL define
Date: Fri, 6 Jun 2014 11:06:08 +0300
Message-ID: <1402041968-21525-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The mask of PLLE_MISC_VREG_CTRL was defined to be 2, which
clearly cannot be a mask. Documentation shows that the field
is 2 bits long, so change this to 3.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 637b62c..e7f79fa 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -116,7 +116,7 @@
 #define PLLE_MISC_VREG_BG_CTRL_SHIFT	4
 #define PLLE_MISC_VREG_BG_CTRL_MASK	(3 << PLLE_MISC_VREG_BG_CTRL_SHIFT)
 #define PLLE_MISC_VREG_CTRL_SHIFT	2
-#define PLLE_MISC_VREG_CTRL_MASK	(2 << PLLE_MISC_VREG_CTRL_SHIFT)
+#define PLLE_MISC_VREG_CTRL_MASK	(3 << PLLE_MISC_VREG_CTRL_SHIFT)
 
 #define PLLCX_MISC_STROBE	BIT(31)
 #define PLLCX_MISC_RESET	BIT(30)
-- 
1.8.1.5
