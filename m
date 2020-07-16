From: Qinglang Miao <miaoqinglang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH -next] gpu: host1x: Convert to DEFINE_SHOW_ATTRIBUTE
Date: Thu, 16 Jul 2020 17:03:23 +0800
Message-ID: <20200716090323.13274-1-miaoqinglang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Yongqiang Liu <liuyongqiang13-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>

Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.

Signed-off-by: Yongqiang Liu <liuyongqiang13-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/debug.c | 28 ++++------------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/host1x/debug.c b/drivers/gpu/host1x/debug.c
index 545fc0afb..1688e98c4 100644
--- a/drivers/gpu/host1x/debug.c
+++ b/drivers/gpu/host1x/debug.c
@@ -110,7 +110,7 @@ static void show_all(struct host1x *m, struct output *o, bool show_fifo)
 	}
 }
 
-static int host1x_debug_show_all(struct seq_file *s, void *unused)
+static int host1x_debug_all_show(struct seq_file *s, void *unused)
 {
 	struct output o = {
 		.fn = write_to_seqfile,
@@ -122,6 +122,8 @@ static int host1x_debug_show_all(struct seq_file *s, void *unused)
 	return 0;
 }
 
+DEFINE_SHOW_ATTRIBUTE(host1x_debug_all);
+
 static int host1x_debug_show(struct seq_file *s, void *unused)
 {
 	struct output o = {
@@ -134,29 +136,7 @@ static int host1x_debug_show(struct seq_file *s, void *unused)
 	return 0;
 }
 
-static int host1x_debug_open_all(struct inode *inode, struct file *file)
-{
-	return single_open(file, host1x_debug_show_all, inode->i_private);
-}
-
-static const struct file_operations host1x_debug_all_fops = {
-	.open = host1x_debug_open_all,
-	.read_iter = seq_read_iter,
-	.llseek = seq_lseek,
-	.release = single_release,
-};
-
-static int host1x_debug_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, host1x_debug_show, inode->i_private);
-}
-
-static const struct file_operations host1x_debug_fops = {
-	.open = host1x_debug_open,
-	.read_iter = seq_read_iter,
-	.llseek = seq_lseek,
-	.release = single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(host1x_debug);
 
 static void host1x_debugfs_init(struct host1x *host1x)
 {
-- 
2.17.1
