From: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] drivers/rtc/rtc-em3027.c: add device tree support
Date: Tue, 13 Jan 2015 01:57:53 +0000
Message-ID: <1421114273-16368-1-git-send-email-pbrobinson@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mike Rapoport <mike@compulab.co.il>, Alessandro Zummo <a.zummo@towertech.it>, Grant Likely <grant.likely@linaro.org>, linux-arm-kernel@lists.infradead.org, arm@kernel.org, linux-tegra@kernel.org, rtc-linux@googlegroups.com
Cc: Peter Robinson <pbrobinson@gmail.com>
List-Id: linux-tegra@vger.kernel.org

Set the of_match_table for this driver so that devices can be described
in the device tree. This device is used in the Trimslice and is already
defined in the Trimslice device tree.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/rtc/rtc-em3027.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/rtc/rtc-em3027.c b/drivers/rtc/rtc-em3027.c
index fccf366..4f4930a 100644
--- a/drivers/rtc/rtc-em3027.c
+++ b/drivers/rtc/rtc-em3027.c
@@ -15,6 +15,7 @@
 #include <linux/rtc.h>
 #include <linux/bcd.h>
 #include <linux/module.h>
+#include <linux/of.h>
 
 /* Registers */
 #define EM3027_REG_ON_OFF_CTRL	0x00
@@ -135,10 +136,20 @@ static struct i2c_device_id em3027_id[] = {
 	{ "em3027", 0 },
 	{ }
 };
+MODULE_DEVICE_TABLE(i2c, em3027_id);
+
+#ifdef CONFIG_OF
+static const struct of_device_id em3027_of_match[] = {
+	{ .compatible = "emmicro,em3027", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, em3027_of_match);
+#endif
 
 static struct i2c_driver em3027_driver = {
 	.driver = {
 		   .name = "rtc-em3027",
+		   .of_match_table = of_match_ptr(em3027_of_match),
 	},
 	.probe = &em3027_probe,
 	.id_table = em3027_id,
-- 
2.1.0
