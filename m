From: Baoyou Xie <baoyou.xie@linaro.org>
Subject: [PATCH] phy: mark tegra_xusb_lane_lookup_function() static
Date: Wed, 31 Aug 2016 17:05:19 +0800
Message-ID: <1472634319-11886-1-git-send-email-baoyou.xie@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon@ti.com, swarren@wwwdotorg.org, thierry.reding@gmail.com, gnurou@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, arnd@arndb.de, baoyou.xie@linaro.org, xie.baoyou@zte.com.cn
List-Id: linux-tegra@vger.kernel.org

We get 1 warning when building kernel with W=1:
drivers/phy/tegra/xusb.c:104:5: warning: no previous prototype for 'tegra_xusb_lane_lookup_function' [-Wmissing-prototypes]

In fact, this function is only used in the file in which it is
declared and don't need a declaration, but can be made static.
So this patch marks it 'static'.

Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
---
 drivers/phy/tegra/xusb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index ec83dfd..0a372d9 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -101,7 +101,8 @@ tegra_xusb_pad_find_phy_node(struct tegra_xusb_pad *pad, unsigned int index)
 	return of_find_node_by_name(np, pad->soc->lanes[index].name);
 }
 
-int tegra_xusb_lane_lookup_function(struct tegra_xusb_lane *lane,
+static int
+tegra_xusb_lane_lookup_function(struct tegra_xusb_lane *lane,
 				    const char *function)
 {
 	unsigned int i;
-- 
2.7.4
