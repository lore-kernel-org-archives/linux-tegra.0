From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH] clk: tegra: Change to use DEFINE_SHOW_ATTRIBUTE macro
Date: Fri, 23 Nov 2018 10:01:04 -0500
Message-ID: <20181123150104.27336-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, sboyd@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: linux-tegra@vger.kernel.org

Use macro to simplify the code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/clk/tegra/clk-dfll.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
index ebb0e1b6bf01..609e363dabf8 100644
--- a/drivers/clk/tegra/clk-dfll.c
+++ b/drivers/clk/tegra/clk-dfll.c
@@ -1184,17 +1184,7 @@ static int attr_registers_show(struct seq_file *s, void *data)
 	return 0;
 }
 
-static int attr_registers_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, attr_registers_show, inode->i_private);
-}
-
-static const struct file_operations attr_registers_fops = {
-	.open		= attr_registers_open,
-	.read		= seq_read,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(attr_registers);
 
 static void dfll_debug_init(struct tegra_dfll *td)
 {
-- 
2.17.0
