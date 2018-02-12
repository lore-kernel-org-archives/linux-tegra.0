From: Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] gpio: tegra: Convert to use DEFINE_SHOW_ATTRIBUTE macro
Date: Mon, 12 Feb 2018 22:01:57 +0800
Message-ID: <20180212140157.27023-1-axel.lin@ingics.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.

Signed-off-by: Axel Lin <axel.lin-8E1dMatC8ynQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpio/gpio-tegra.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 02fa8fe2292a..94396caaca75 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -506,7 +506,7 @@ static int tegra_gpio_irq_set_wake(struct irq_data *d, unsigned int enable)
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
 
-static int dbg_gpio_show(struct seq_file *s, void *unused)
+static int tegra_dbg_gpio_show(struct seq_file *s, void *unused)
 {
 	struct tegra_gpio_info *tgi = s->private;
 	unsigned int i, j;
@@ -530,22 +530,12 @@ static int dbg_gpio_show(struct seq_file *s, void *unused)
 	return 0;
 }
 
-static int dbg_gpio_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, dbg_gpio_show, inode->i_private);
-}
-
-static const struct file_operations debug_fops = {
-	.open		= dbg_gpio_open,
-	.read		= seq_read,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(tegra_dbg_gpio);
 
 static void tegra_gpio_debuginit(struct tegra_gpio_info *tgi)
 {
 	(void) debugfs_create_file("tegra_gpio", 0444,
-					NULL, tgi, &debug_fops);
+				   NULL, tgi, &tegra_dbg_gpio_fops);
 }
 
 #else
-- 
2.14.1
