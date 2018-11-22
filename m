From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH] soc/tegra: pmc: Change to use DEFINE_SHOW_ATTRIBUTE macro
Date: Thu, 22 Nov 2018 08:12:07 -0500
Message-ID: <20181122131207.24791-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, avienamo@nvidia.com, mperttunen@nvidia.com, andy.gross@linaro.org, robh@kernel.org, vivek.gautam@codeaurora.org
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: linux-tegra@vger.kernel.org

Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/soc/tegra/pmc.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 1fa840e3d930..d42a1f5ced82 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -717,17 +717,7 @@ static int powergate_show(struct seq_file *s, void *data)
 	return 0;
 }
 
-static int powergate_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, powergate_show, inode->i_private);
-}
-
-static const struct file_operations powergate_fops = {
-	.open = powergate_open,
-	.read = seq_read,
-	.llseek = seq_lseek,
-	.release = single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(powergate);
 
 static int tegra_powergate_debugfs_init(void)
 {
-- 
2.17.0
