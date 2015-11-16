From: "Suzuki K. Poulose" <suzuki.poulose@arm.com>
Subject: [PATCH] gpio-tegra: Do not create the debugfs entry by default
Date: Mon, 16 Nov 2015 16:07:10 +0000
Message-ID: <1447690030-26529-1-git-send-email-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, thierry.reding@gmail.com, swarren@wwwdotorg.org, gnurou@gmail.com, "Suzuki K. Poulose" <suzuki.poulose@arm.com>
List-Id: linux-tegra@vger.kernel.org

The tegra gpio driver creates the debugfs entry irrespective of
whether the device exists or not. This is enabled on an arm64_defconfig
and leaves an entry in debugfs on all platforms where it is not
useful. This patch fixes the issue by creating the entry only when
a device exists.

Signed-off-by: Suzuki K. Poulose <suzuki.poulose@arm.com>
---
 drivers/gpio/gpio-tegra.c |  105 ++++++++++++++++++++++++-----------------=
----
 1 file changed, 56 insertions(+), 49 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 027e5f4..896bf29 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -375,6 +375,60 @@ static int tegra_gpio_irq_set_wake(struct irq_data *d,=
 unsigned int enable)
 }
 #endif
=20
+#ifdef=09CONFIG_DEBUG_FS
+
+#include <linux/debugfs.h>
+#include <linux/seq_file.h>
+
+static int dbg_gpio_show(struct seq_file *s, void *unused)
+{
+=09int i;
+=09int j;
+
+=09for (i =3D 0; i < tegra_gpio_bank_count; i++) {
+=09=09for (j =3D 0; j < 4; j++) {
+=09=09=09int gpio =3D tegra_gpio_compose(i, j, 0);
+=09=09=09seq_printf(s,
+=09=09=09=09"%d:%d %02x %02x %02x %02x %02x %02x %06x\n",
+=09=09=09=09i, j,
+=09=09=09=09tegra_gpio_readl(GPIO_CNF(gpio)),
+=09=09=09=09tegra_gpio_readl(GPIO_OE(gpio)),
+=09=09=09=09tegra_gpio_readl(GPIO_OUT(gpio)),
+=09=09=09=09tegra_gpio_readl(GPIO_IN(gpio)),
+=09=09=09=09tegra_gpio_readl(GPIO_INT_STA(gpio)),
+=09=09=09=09tegra_gpio_readl(GPIO_INT_ENB(gpio)),
+=09=09=09=09tegra_gpio_readl(GPIO_INT_LVL(gpio)));
+=09=09}
+=09}
+=09return 0;
+}
+
+static int dbg_gpio_open(struct inode *inode, struct file *file)
+{
+=09return single_open(file, dbg_gpio_show, &inode->i_private);
+}
+
+static const struct file_operations debug_fops =3D {
+=09.open=09=09=3D dbg_gpio_open,
+=09.read=09=09=3D seq_read,
+=09.llseek=09=09=3D seq_lseek,
+=09.release=09=3D single_release,
+};
+
+static void tegra_gpio_debuginit(void)
+{
+=09(void) debugfs_create_file("tegra_gpio", S_IRUGO,
+=09=09=09=09=09NULL, NULL, &debug_fops);
+}
+
+#else
+
+static inline void tegra_gpio_debuginit(void)
+{
+}
+
+#endif
+
 static struct irq_chip tegra_gpio_irq_chip =3D {
 =09.name=09=09=3D "GPIO",
 =09.irq_ack=09=3D tegra_gpio_irq_ack,
@@ -519,6 +573,8 @@ static int tegra_gpio_probe(struct platform_device *pde=
v)
 =09=09=09spin_lock_init(&bank->lvl_lock[j]);
 =09}
=20
+=09tegra_gpio_debuginit();
+
 =09return 0;
 }
=20
@@ -536,52 +592,3 @@ static int __init tegra_gpio_init(void)
 =09return platform_driver_register(&tegra_gpio_driver);
 }
 postcore_initcall(tegra_gpio_init);
-
-#ifdef=09CONFIG_DEBUG_FS
-
-#include <linux/debugfs.h>
-#include <linux/seq_file.h>
-
-static int dbg_gpio_show(struct seq_file *s, void *unused)
-{
-=09int i;
-=09int j;
-
-=09for (i =3D 0; i < tegra_gpio_bank_count; i++) {
-=09=09for (j =3D 0; j < 4; j++) {
-=09=09=09int gpio =3D tegra_gpio_compose(i, j, 0);
-=09=09=09seq_printf(s,
-=09=09=09=09"%d:%d %02x %02x %02x %02x %02x %02x %06x\n",
-=09=09=09=09i, j,
-=09=09=09=09tegra_gpio_readl(GPIO_CNF(gpio)),
-=09=09=09=09tegra_gpio_readl(GPIO_OE(gpio)),
-=09=09=09=09tegra_gpio_readl(GPIO_OUT(gpio)),
-=09=09=09=09tegra_gpio_readl(GPIO_IN(gpio)),
-=09=09=09=09tegra_gpio_readl(GPIO_INT_STA(gpio)),
-=09=09=09=09tegra_gpio_readl(GPIO_INT_ENB(gpio)),
-=09=09=09=09tegra_gpio_readl(GPIO_INT_LVL(gpio)));
-=09=09}
-=09}
-=09return 0;
-}
-
-static int dbg_gpio_open(struct inode *inode, struct file *file)
-{
-=09return single_open(file, dbg_gpio_show, &inode->i_private);
-}
-
-static const struct file_operations debug_fops =3D {
-=09.open=09=09=3D dbg_gpio_open,
-=09.read=09=09=3D seq_read,
-=09.llseek=09=09=3D seq_lseek,
-=09.release=09=3D single_release,
-};
-
-static int __init tegra_gpio_debuginit(void)
-{
-=09(void) debugfs_create_file("tegra_gpio", S_IRUGO,
-=09=09=09=09=09NULL, NULL, &debug_fops);
-=09return 0;
-}
-late_initcall(tegra_gpio_debuginit);
-#endif
--=20
1.7.9.5

