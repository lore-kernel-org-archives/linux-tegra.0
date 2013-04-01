From: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V6 5/9] unicore32: Provide regulator to pwm-backlight
Date: Mon, 1 Apr 2013 14:53:24 -0700
Message-ID: <1364853208-32503-6-git-send-email-achew@nvidia.com>
References: <1364853208-32503-1-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364853208-32503-1-git-send-email-achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: romain.naour-oid7hba3+9NWj0EZb7rXcA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, drwyrm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, stefan-WB6LKoYH/xlAfugRpC6u6w@public.gmane.org, laforge-WB6LKoYH/xlAfugRpC6u6w@public.gmane.org, philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lost.distance-/E1597aS9LQAvxtiuMwx3w@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gxt-TG0Ac1+ktVePQbnJrJN+5g@public.gmane.org
Cc: thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, openezx-devel-ZwoEplunGu3n3BO9LpVK+9i2O/JbrIOy@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The pwm-backlight driver now takes a mandatory regulator that is gotten
during driver probe.  Initialize a dummy regulator to satisfy this
requirement.

Signed-off-by: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/unicore32/kernel/puv3-nb0916.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/unicore32/kernel/puv3-nb0916.c b/arch/unicore32/kernel/puv3-nb0916.c
index 181108b..839b536 100644
--- a/arch/unicore32/kernel/puv3-nb0916.c
+++ b/arch/unicore32/kernel/puv3-nb0916.c
@@ -19,6 +19,8 @@
 #include <linux/reboot.h>
 #include <linux/interrupt.h>
 #include <linux/i2c.h>
+#include <linux/regulator/machine.h>
+#include <linux/regulator/fixed.h>
 #include <linux/pwm_backlight.h>
 #include <linux/gpio.h>
 #include <linux/gpio_keys.h>
@@ -49,6 +51,10 @@ static struct resource puv3_i2c_resources[] = {
 	}
 };
 
+/* Dummy regulator for pwm-backlight driver */
+static struct regulator_consumer_supply backlight_supply =
+	REGULATOR_SUPPLY("power", "pwm-backlight");
+
 static struct platform_pwm_backlight_data nb0916_backlight_data = {
 	.pwm_id		= 0,
 	.max_brightness	= 100,
@@ -111,6 +117,9 @@ int __init mach_nb0916_init(void)
 	platform_device_register_simple("PKUnity-v3-I2C", -1,
 			puv3_i2c_resources, ARRAY_SIZE(puv3_i2c_resources));
 
+	regulator_register_always_on(-1, "backlight-power",
+				     &backlight_supply, 1, 0);
+
 	platform_device_register_data(&platform_bus, "pwm-backlight", -1,
 			&nb0916_backlight_data, sizeof(nb0916_backlight_data));
 
-- 
1.8.1.5
