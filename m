From: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 3/9] memory: tegra: add flush operation for Tegra124 memory clients
Date: Wed, 14 Jan 2015 14:19:26 +0800
Message-ID: <1421216372-8025-4-git-send-email-vinceh@nvidia.com>
References: <1421216372-8025-1-git-send-email-vinceh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421216372-8025-1-git-send-email-vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/memory/tegra/tegra124.c | 108 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 107 insertions(+), 1 deletion(-)

diff --git a/drivers/memory/tegra/tegra124.c b/drivers/memory/tegra/tegra124.c
index 278d40b854c1..cce255d3df5c 100644
--- a/drivers/memory/tegra/tegra124.c
+++ b/drivers/memory/tegra/tegra124.c
@@ -6,6 +6,8 @@
  * published by the Free Software Foundation.
  */
 
+#include <linux/delay.h>
+#include <linux/device.h>
 #include <linux/of.h>
 #include <linux/mm.h>
 
@@ -15,7 +17,7 @@
 
 #include "mc.h"
 
-static const struct tegra_mc_client tegra124_mc_clients[] = {
+static struct tegra_mc_client tegra124_mc_clients[] = {
 	{
 		.id = 0x00,
 		.name = "ptcr",
@@ -959,7 +961,108 @@ static const struct tegra_smmu_swgroup tegra124_swgroups[] = {
 	{ .swgroup = TEGRA_SWGROUP_VI,        .reg = 0x280 },
 };
 
+static struct tegra_mc_hotreset tegra124_mc_hotreset[] = {
+	{TEGRA_SWGROUP_AFI,        0x200, 0x204,  0},
+	{TEGRA_SWGROUP_AVPC,       0x200, 0x204,  1},
+	{TEGRA_SWGROUP_DC,         0x200, 0x204,  2},
+	{TEGRA_SWGROUP_DCB,        0x200, 0x204,  3},
+	{TEGRA_SWGROUP_HC,         0x200, 0x204,  6},
+	{TEGRA_SWGROUP_HDA,        0x200, 0x204,  7},
+	{TEGRA_SWGROUP_ISP2,       0x200, 0x204,  8},
+	{TEGRA_SWGROUP_MPCORE,     0x200, 0x204,  9},
+	{TEGRA_SWGROUP_MPCORELP,   0x200, 0x204, 10},
+	{TEGRA_SWGROUP_MSENC,      0x200, 0x204, 11},
+	{TEGRA_SWGROUP_PPCS,       0x200, 0x204, 14},
+	{TEGRA_SWGROUP_SATA,       0x200, 0x204, 15},
+	{TEGRA_SWGROUP_VDE,        0x200, 0x204, 16},
+	{TEGRA_SWGROUP_VI,         0x200, 0x204, 17},
+	{TEGRA_SWGROUP_VIC,        0x200, 0x204, 18},
+	{TEGRA_SWGROUP_XUSB_HOST,  0x200, 0x204, 19},
+	{TEGRA_SWGROUP_XUSB_DEV,   0x200, 0x204, 20},
+	{TEGRA_SWGROUP_TSEC,       0x200, 0x204, 22},
+	{TEGRA_SWGROUP_SDMMC1A,    0x200, 0x204, 29},
+	{TEGRA_SWGROUP_SDMMC2A,    0x200, 0x204, 30},
+	{TEGRA_SWGROUP_SDMMC3A,    0x200, 0x204, 31},
+	{TEGRA_SWGROUP_SDMMC4A,    0x970, 0x974,  0},
+	{TEGRA_SWGROUP_ISP2B,      0x970, 0x974,  1},
+	{TEGRA_SWGROUP_GPU,        0x970, 0x974,  2},
+};
+
 #ifdef CONFIG_ARCH_TEGRA_124_SOC
+
+static bool tegra124_stable_hotreset_check(struct tegra_mc *mc,
+		u32 reg, u32 *stat)
+{
+	int i;
+	u32 cur_stat;
+	u32 prv_stat;
+
+	/*
+	 * There might be a glitch seen with the status register if we program
+	 * the control register and then read the status register in a short
+	 * window due to a HW bug. So here we poll for a stable status read.
+	 */
+	prv_stat = mc_readl(mc, reg);
+	for (i = 0; i < 5; i++) {
+		cur_stat = mc_readl(mc, reg);
+		if (cur_stat != prv_stat)
+			return false;
+	}
+	*stat = cur_stat;
+	return true;
+}
+
+static int tegra124_mc_flush(struct tegra_mc *mc,
+		const struct tegra_mc_hotreset *hotreset)
+{
+	u32 val;
+
+	if (!mc || !hotreset)
+		return -EINVAL;
+
+	/* XXX add mutex */
+
+	val = mc_readl(mc, hotreset->ctrl);
+	val |= BIT(hotreset->bit);
+	mc_writel(mc, val, hotreset->ctrl);
+	mc_readl(mc, hotreset->ctrl);
+
+	/* poll till the flush is done */
+	do {
+		udelay(10);
+		val = 0;
+		if (!tegra124_stable_hotreset_check(mc, hotreset->status, &val))
+			continue;
+	} while (!(val & BIT(hotreset->bit)));
+
+	dev_dbg(mc->dev, "%s bit %d\n", __func__, hotreset->bit);
+	return 0;
+}
+
+static int tegra124_mc_flush_done(struct tegra_mc *mc,
+		const struct tegra_mc_hotreset *hotreset)
+{
+	u32 val;
+
+	if (!mc || !hotreset)
+		return -EINVAL;
+
+	/* XXX add mutex */
+
+	val = mc_readl(mc, hotreset->ctrl);
+	val &= ~BIT(hotreset->bit);
+	mc_writel(mc, val, hotreset->ctrl);
+	mc_readl(mc, hotreset->ctrl);
+
+	dev_dbg(mc->dev, "%s bit %d\n", __func__, hotreset->bit);
+	return 0;
+}
+
+static const struct tegra_mc_ops tegra124_mc_ops = {
+	.flush = tegra124_mc_flush,
+	.flush_done = tegra124_mc_flush_done,
+};
+
 static void tegra124_flush_dcache(struct page *page, unsigned long offset,
 				  size_t size)
 {
@@ -991,5 +1094,8 @@ const struct tegra_mc_soc tegra124_mc_soc = {
 	.num_address_bits = 34,
 	.atom_size = 32,
 	.smmu = &tegra124_smmu_soc,
+	.hotresets = tegra124_mc_hotreset,
+	.num_hotresets = ARRAY_SIZE(tegra124_mc_hotreset),
+	.ops = &tegra124_mc_ops,
 };
 #endif /* CONFIG_ARCH_TEGRA_124_SOC */
-- 
1.9.1
