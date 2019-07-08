From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] gpio: tegra: fix debugfs compile error
Date: Mon,  8 Jul 2019 14:38:17 +0200
Message-ID: <20190708123843.3302581-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Dmitry Osipenko <digetx@gmail.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Without this header, some configurations now run into a build failure:

drivers/gpio/gpio-tegra.c:665:2: error: implicit declaration of function 'debugfs_create_file'
      [-Werror,-Wimplicit-function-declaration]
        debugfs_create_file("tegra_gpio", 0444, NULL, tgi,
        ^
drivers/gpio/gpio-tegra.c:665:2: error: this function declaration is not a prototype [-Werror,-Wstrict-prototypes]
drivers/gpio/gpio-tegra.c:666:9: error: use of undeclared identifier 'tegra_dbg_gpio_fops'

Remove the #ifdef here and let the compiler drop the unused
functions itself when debugfs_create_file() is an empty inline
function.

Fixes: a4de43049a1d ("gpio: tegra: Clean-up debugfs initialisation")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpio/gpio-tegra.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 59b99d8c3647..dbcecbe5f52f 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -9,6 +9,7 @@
  *	Erik Gilling <konkers@google.com>
  */
 
+#include <linux/debugfs.h>
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/irq.h>
@@ -22,6 +23,7 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm.h>
+#include <linux/seq_file.h>
 
 #define GPIO_BANK(x)		((x) >> 5)
 #define GPIO_PORT(x)		(((x) >> 3) & 0x3)
@@ -508,10 +510,6 @@ static int tegra_gpio_irq_set_wake(struct irq_data *d, unsigned int enable)
 }
 #endif
 
-#ifdef CONFIG_DEBUG_FS
-
-#include <linux/debugfs.h>
-#include <linux/seq_file.h>
 
 static int tegra_dbg_gpio_show(struct seq_file *s, void *unused)
 {
@@ -538,7 +536,6 @@ static int tegra_dbg_gpio_show(struct seq_file *s, void *unused)
 }
 
 DEFINE_SHOW_ATTRIBUTE(tegra_dbg_gpio);
-#endif
 
 static const struct dev_pm_ops tegra_gpio_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(tegra_gpio_suspend, tegra_gpio_resume)
-- 
2.20.0
