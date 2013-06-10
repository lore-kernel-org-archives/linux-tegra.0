From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/4] power: sbs-battery: Add dt to power_supply struct
Date: Mon, 10 Jun 2013 17:26:40 -0400
Message-ID: <1370899602-22123-3-git-send-email-rklein@nvidia.com>
References: <1370899602-22123-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370899602-22123-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anton Vorontsov <cbou-JGs/UdohzUI@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

By passing in the dt node of this device, we enable the logic for
linking power_supplies together from dt. This is specified by adding
a "power-supplies" property with a phandle to the charger for a
given supply.

Enable this logic now for the sbs-battery driver.

Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/power/sbs-battery.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/power/sbs-battery.c b/drivers/power/sbs-battery.c
index c8c78a7..b5f2a76 100644
--- a/drivers/power/sbs-battery.c
+++ b/drivers/power/sbs-battery.c
@@ -704,6 +704,7 @@ static int sbs_probe(struct i2c_client *client,
 	chip->power_supply.properties = sbs_properties;
 	chip->power_supply.num_properties = ARRAY_SIZE(sbs_properties);
 	chip->power_supply.get_property = sbs_get_property;
+	chip->power_supply.of_node = client->dev.of_node;
 	/* ignore first notification of external change, it is generated
 	 * from the power_supply_register call back
 	 */
-- 
1.7.9.5
