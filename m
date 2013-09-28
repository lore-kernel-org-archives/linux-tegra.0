From: Manish Badarkhe <badarkhe.manish-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] tps65090-charger: Use "IS_ENABLED(CONFIG_OF)" for DT code.
Date: Sat, 28 Sep 2013 10:02:24 +0530
Message-ID: <1380342744-4227-1-git-send-email-badarkhe.manish@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: badarkhe.manish-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Instead of "#if defined(CONFIG_OF)" use "IS_ENABLED(CONFIG_OF)" option
for DT code to avoid if-deffery in code.
Also, arranged header files in alphabetically.

Signed-off-by: Manish Badarkhe <badarkhe.manish-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
:100644 100644 bdd7b9b... 8b9c406... M	drivers/power/tps65090-charger.c
 drivers/power/tps65090-charger.c |   19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/power/tps65090-charger.c b/drivers/power/tps65090-charger.c
index bdd7b9b..8b9c406 100644
--- a/drivers/power/tps65090-charger.c
+++ b/drivers/power/tps65090-charger.c
@@ -15,15 +15,17 @@
  * You should have received a copy of the GNU General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
+#include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/slab.h>
-#include <linux/delay.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/power_supply.h>
+#include <linux/slab.h>
+
 #include <linux/mfd/tps65090.h>
 
 #define TPS65090_REG_INTR_STS	0x00
@@ -185,10 +187,6 @@ static irqreturn_t tps65090_charger_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-#if defined(CONFIG_OF)
-
-#include <linux/of_device.h>
-
 static struct tps65090_platform_data *
 		tps65090_parse_dt_charger_data(struct platform_device *pdev)
 {
@@ -210,13 +208,6 @@ static struct tps65090_platform_data *
 	return pdata;
 
 }
-#else
-static struct tps65090_platform_data *
-		tps65090_parse_dt_charger_data(struct platform_device *pdev)
-{
-	return NULL;
-}
-#endif
 
 static int tps65090_charger_probe(struct platform_device *pdev)
 {
@@ -228,7 +219,7 @@ static int tps65090_charger_probe(struct platform_device *pdev)
 
 	pdata = dev_get_platdata(pdev->dev.parent);
 
-	if (!pdata && pdev->dev.of_node)
+	if (IS_ENABLED(CONFIG_OF) && !pdata && pdev->dev.of_node)
 		pdata = tps65090_parse_dt_charger_data(pdev);
 
 	if (!pdata) {
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
