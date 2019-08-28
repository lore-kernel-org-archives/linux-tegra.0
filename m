From: Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [PATCH] soc/tegra: fuse: Add clock error check in tegra_fuse_readl
Date: Wed, 28 Aug 2019 16:48:49 +0530
Message-ID: <1566991129-13479-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@ti.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Nagarjuna Kristam <nkristam@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Tegra fuse clock handle is retrieved in tegra_fuse_probe().
tegra_fuse_readl() is exported symbol, which can be called from drivers
at any time. tegra_fuse_readl() enables fuse clock and reads corresponding
fuse register offset.

Calling tegra_fuse_readl() before tegra_fuse_probe(), will cause data
abort. Add DEFER_PROBE error check for fuse clock in tegra_fuse_readl(),
to avoid enabling of fuse clock, before clock is available.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
 drivers/soc/tegra/fuse/fuse-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index 3eb44e6..21b39b7 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -186,7 +186,7 @@ u32 __init tegra_fuse_read_early(unsigned int offset)
 
 int tegra_fuse_readl(unsigned long offset, u32 *value)
 {
-	if (!fuse->read)
+	if (!fuse->read || (PTR_ERR(fuse->clk) == -EPROBE_DEFER))
 		return -EPROBE_DEFER;
 
 	*value = fuse->read(fuse, offset);
-- 
2.7.4
