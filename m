From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: tegra: emc: correction of ram-code parsing from dt
Date: Mon, 13 May 2013 00:26:49 +0400
Message-ID: <1368390409-14156-1-git-send-email-digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Change tegra_emc_ramcode_devnode() to get ram-code from child node instead of
parent.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
For me it looks like it should be better to place ram-code inside of table
nodes, so num_tables will be incremented if table has valid ram-code and table
with invalid ram-code will be skipped on getting table params loop. This avoids
placing of #address-cells and #size-cells in nodes with ram-code.
If it looks ok, I may send new patch.

 arch/arm/mach-tegra/tegra2_emc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/tegra2_emc.c b/arch/arm/mach-tegra/tegra2_emc.c
index 9e8bdfa..25f0189 100644
--- a/arch/arm/mach-tegra/tegra2_emc.c
+++ b/arch/arm/mach-tegra/tegra2_emc.c
@@ -183,7 +183,7 @@ static struct device_node *tegra_emc_ramcode_devnode(struct device_node *np)
 	u32 reg;
 
 	for_each_child_of_node(np, iter) {
-		if (of_property_read_u32(np, "nvidia,ram-code", &reg))
+		if (of_property_read_u32(iter, "nvidia,ram-code", &reg))
 			continue;
 		if (reg == tegra_bct_strapping)
 			return of_node_get(iter);
-- 
1.8.2.1
