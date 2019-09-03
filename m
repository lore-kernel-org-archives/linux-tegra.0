From: Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [Patch V2] soc/tegra: fuse: Add fuse clock check in tegra_fuse_readl
Date: Tue, 3 Sep 2019 16:26:52 +0530
Message-ID: <1567508212-1194-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Nagarjuna Kristam <nkristam@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

tegra_fuse_readl() can be called from drivers at any time. If this API is
called before tegra_fuse_probe(), we end up enabling clock before it is
registered. Add check for fuse clock in tegra_fuse_readl() and return
corresponding error if any.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
V2:
	- Added Null and other error checks for fuse->clk.
---
 drivers/soc/tegra/fuse/fuse-tegra.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index 3eb44e6..58996c6 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -186,9 +186,12 @@ u32 __init tegra_fuse_read_early(unsigned int offset)
 
 int tegra_fuse_readl(unsigned long offset, u32 *value)
 {
-	if (!fuse->read)
+	if (!fuse->read || !fuse->clk)
 		return -EPROBE_DEFER;
 
+	if (IS_ERR(fuse->clk))
+		return PTR_ERR(fuse->clk);
+
 	*value = fuse->read(fuse, offset);
 
 	return 0;
-- 
2.7.4
