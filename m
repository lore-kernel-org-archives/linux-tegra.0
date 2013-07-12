From: Wei Ni <wni@nvidia.com>
Subject: [PATCH v3 3/4] hwmon: (lm90) add support to handle IRQ
Date: Fri, 12 Jul 2013 15:48:06 +0800
Message-ID: <1373615287-18502-4-git-send-email-wni@nvidia.com>
References: <1373615287-18502-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <lm-sensors-bounces@lm-sensors.org>
In-Reply-To: <1373615287-18502-1-git-send-email-wni@nvidia.com>
List-Unsubscribe: <http://lists.lm-sensors.org/mailman/options/lm-sensors>,
	<mailto:lm-sensors-request@lm-sensors.org?subject=unsubscribe>
List-Archive: <http://lists.lm-sensors.org/pipermail/lm-sensors/>
List-Post: <mailto:lm-sensors@lm-sensors.org>
List-Help: <mailto:lm-sensors-request@lm-sensors.org?subject=help>
List-Subscribe: <http://lists.lm-sensors.org/mailman/listinfo/lm-sensors>,
	<mailto:lm-sensors-request@lm-sensors.org?subject=subscribe>
Sender: lm-sensors-bounces@lm-sensors.org
Errors-To: lm-sensors-bounces@lm-sensors.org
To: khali@linux-fr.org, linux@roeck-us.net, thierry.reding@gmail.com
Cc: linux-tegra@vger.kernel.org, Wei Ni <wni@nvidia.com>, linux-kernel@vger.kernel.org, lm-sensors@lm-sensors.org
List-Id: linux-tegra@vger.kernel.org

When the temperature exceed the limit range value,
the driver can handle the interrupt.

Signed-off-by: Wei Ni <wni@nvidia.com>
---
 drivers/hwmon/lm90.c |   24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index c90037f..1cc3d19 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -89,6 +89,7 @@
 #include <linux/err.h>
 #include <linux/mutex.h>
 #include <linux/sysfs.h>
+#include <linux/interrupt.h>
 
 /*
  * Addresses to scan
@@ -1460,6 +1461,17 @@ static bool lm90_is_tripped(struct i2c_client *client)
 	return true;
 }
 
+static irqreturn_t lm90_irq_thread(int irq, void *dev_id)
+{
+	struct lm90_data *data = dev_id;
+	struct i2c_client *client = to_i2c_client(data->hwmon_dev->parent);
+
+	if (lm90_is_tripped(client))
+		return IRQ_HANDLED;
+	else
+		return IRQ_NONE;
+}
+
 static int lm90_probe(struct i2c_client *client,
 		      const struct i2c_device_id *id)
 {
@@ -1536,6 +1548,18 @@ static int lm90_probe(struct i2c_client *client,
 		goto exit_remove_files;
 	}
 
+	if (client->irq >= 0) {
+		dev_dbg(dev, "lm90 IRQ: %d\n", client->irq);
+		err = devm_request_threaded_irq(dev, client->irq,
+						NULL, lm90_irq_thread,
+						IRQF_TRIGGER_LOW | IRQF_ONESHOT,
+						"lm90", data);
+		if (err < 0) {
+			dev_err(dev, "cannot request interrupt\n");
+			goto exit_remove_files;
+		}
+	}
+
 	return 0;
 
 exit_remove_files:
-- 
1.7.9.5


_______________________________________________
lm-sensors mailing list
lm-sensors@lm-sensors.org
http://lists.lm-sensors.org/mailman/listinfo/lm-sensors
