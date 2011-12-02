From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 4/5] ASoC: WM8903: Get default irq_active_low from IRQ controller
Date: Fri,  2 Dec 2011 15:08:40 -0700
Message-ID: <1322863721-29793-5-git-send-email-swarren@nvidia.com>
References: <1322863721-29793-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1322863721-29793-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

If the WM8903 is hooked up to an interrupt, set the irq_active_low flag
in the default platform data based on the IRQ's IRQ_TYPE. Map IRQ_TYPE_NONE
(a lack of explicit configuration/restriction) to irq_active_low = false;
the previous default.

This code is mainly added to support device tree interrupt bindings,
although will work perfectly well in a non device tree system too.

Any interrupt controller that supports only a single IRQ_TYPE could
set each IRQ's type based on that restriction. This applies equally
with and without device tree. To cater for interrupt controllers
that don't do this, for which irqd_get_trigger_type() will return
IRQ_TYPE_NONE, the platform data irq_active_low field may be used
in systems that don't use device tree.

With device tree, every IRQ must have some IRQ_TYPE set.

Controllers that support DT and multiple IRQ_TYPEs must define the
interrupts property (as used in interrupt source nodes) such that it
defines the IRQ_TYPE to use. When the core DT setup code initializes
wm8903->irq, the interrupts property will be parsed, and as a side-
effect, set the IRQ's IRQ_TYPE for the WM8903 probe() function to read.

Controllers that support DT and a single IRQ_TYPE could arrange to
set the IRQ_TYPE somehow during their initialization, or hard-code
it during the processing of the child interrupts property.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/codecs/wm8903.c |   40 ++++++++++++++++++++++++++++++++++++++++
 1 files changed, 40 insertions(+), 0 deletions(-)

diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index 7e3b960..a44bbfb 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -25,6 +25,7 @@
 #include <linux/i2c.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
+#include <linux/irq.h>
 #include <sound/core.h>
 #include <sound/jack.h>
 #include <sound/pcm.h>
@@ -2036,6 +2037,39 @@ static const struct regmap_config wm8903_regmap = {
 	.num_reg_defaults = ARRAY_SIZE(wm8903_reg_defaults),
 };
 
+static int wm8903_set_pdata_irq_trigger(struct i2c_client *i2c,
+					struct wm8903_platform_data *pdata)
+{
+	struct irq_data *irq_data = irq_get_irq_data(i2c->irq);
+	if (!irq_data) {
+		dev_err(&i2c->dev, "Invalid IRQ: %d\n",
+			i2c->irq);
+		return -EINVAL;
+	}
+
+	switch (irqd_get_trigger_type(irq_data)) {
+	case IRQ_TYPE_NONE:
+		/*
+		* We assume the controller imposes no restrictions,
+		* so we are able to select active-high
+		*/
+		/* Fall-through */
+	case IRQ_TYPE_LEVEL_HIGH:
+		pdata->irq_active_low = false;
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		pdata->irq_active_low = true;
+		break;
+	default:
+		dev_err(&i2c->dev,
+			"Unsupported IRQ_TYPE %x\n",
+			irqd_get_trigger_type(irq_data));
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static __devinit int wm8903_i2c_probe(struct i2c_client *i2c,
 				      const struct i2c_device_id *id)
 {
@@ -2071,6 +2105,12 @@ static __devinit int wm8903_i2c_probe(struct i2c_client *i2c,
 			dev_err(&i2c->dev, "Failed to allocate pdata\n");
 			return -ENOMEM;
 		}
+
+		if (i2c->irq) {
+			ret = wm8903_set_pdata_irq_trigger(i2c, wm8903->pdata);
+			if (ret != 0)
+				return ret;
+		}
 	}
 
 	ret = regmap_read(wm8903->regmap, WM8903_SW_RESET_AND_ID, &val);
-- 
1.7.0.4
