From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH V2 2/3] mfd: palmas: support IRQ inversion at the board level
Date: Thu, 27 Feb 2014 13:51:20 -0700
Message-ID: <1393534281-30759-2-git-send-email-swarren@wwwdotorg.org>
References: <1393534281-30759-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393534281-30759-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, J Keerthy <j-keerthy-l0cyMroinI0@public.gmane.org>, Ian Lartey <ian-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Implement the new DT property ti,irq-externally-inverted, and add an
equivalent platform data field to match. This allows the driver to
correctly automatically configure the IRQ output polarity when the board
or SoC contains an inverter between the Palmas IRQ output and IRQ
controller input.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
v2: Split V1's patch 1/2 into separate patches 1/3 and 2/3.

If this patch (and likely 1/3 too) could be applied to its own branch
(w/ signed tag) in the MFD tree, that would great; then I can pull patch
it into the Tegra tree so that I can apply patch 3/3 on top. Thanks.
---
 drivers/mfd/palmas.c       | 4 ++++
 include/linux/mfd/palmas.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/mfd/palmas.c b/drivers/mfd/palmas.c
index d280d789e55a..f4ea932adf8d 100644
--- a/drivers/mfd/palmas.c
+++ b/drivers/mfd/palmas.c
@@ -293,6 +293,8 @@ static int palmas_set_pdata_irq_flag(struct i2c_client *i2c,
 	}
 
 	pdata->irq_flags = irqd_get_trigger_type(irq_data);
+	pdata->irq_external_inversion = of_property_read_bool(i2c->dev.of_node,
+						"ti,irq-externally-inverted");
 	dev_info(&i2c->dev, "Irq flag is 0x%08x\n", pdata->irq_flags);
 	return 0;
 }
@@ -447,6 +449,8 @@ static int palmas_i2c_probe(struct i2c_client *i2c,
 		reg = PALMAS_POLARITY_CTRL_INT_POLARITY;
 	else
 		reg = 0;
+	if (pdata->irq_external_inversion)
+		reg ^= PALMAS_POLARITY_CTRL_INT_POLARITY;
 	ret = palmas_update_bits(palmas, PALMAS_PU_PD_OD_BASE,
 			PALMAS_POLARITY_CTRL, PALMAS_POLARITY_CTRL_INT_POLARITY,
 			reg);
diff --git a/include/linux/mfd/palmas.h b/include/linux/mfd/palmas.h
index 9974e387e483..2fdf08c50a48 100644
--- a/include/linux/mfd/palmas.h
+++ b/include/linux/mfd/palmas.h
@@ -292,6 +292,7 @@ struct palmas_clk_platform_data {
 
 struct palmas_platform_data {
 	int irq_flags;
+	bool irq_external_inversion;
 	int gpio_base;
 
 	/* bit value to be loaded to the POWER_CTRL register */
-- 
1.8.1.5
