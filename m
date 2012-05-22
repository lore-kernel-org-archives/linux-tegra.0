From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 1/5] ASoC: WM8903: init GPIOs during I2C probe not codec probe
Date: Tue, 22 May 2012 16:08:52 -0600
Message-ID: <1337724536-12349-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This allows the GPIOs to be available as soon as the I2C device has
probed, which in turn enables machine drivers to request the GPIOs in
their probe(), rather than deferring this to their ASoC machine init
function, i.e. after the whole sound card has been constructed, and
hence the WM8903 codec is available.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/codecs/wm8903.c |   48 ++++++++++++++++++++------------------------
 1 files changed, 22 insertions(+), 26 deletions(-)

diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index 86b8a29..f6a3fc5 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -2,7 +2,7 @@
  * wm8903.c  --  WM8903 ALSA SoC Audio driver
  *
  * Copyright 2008 Wolfson Microelectronics
- * Copyright 2011 NVIDIA, Inc.
+ * Copyright 2011-2012 NVIDIA, Inc.
  *
  * Author: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
  *
@@ -116,6 +116,7 @@ static const struct reg_default wm8903_reg_defaults[] = {
 
 struct wm8903_priv {
 	struct wm8903_platform_data *pdata;
+	struct device *dev;
 	struct snd_soc_codec *codec;
 	struct regmap *regmap;
 
@@ -1774,7 +1775,6 @@ static int wm8903_gpio_request(struct gpio_chip *chip, unsigned offset)
 static int wm8903_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
 {
 	struct wm8903_priv *wm8903 = gpio_to_wm8903(chip);
-	struct snd_soc_codec *codec = wm8903->codec;
 	unsigned int mask, val;
 	int ret;
 
@@ -1782,8 +1782,8 @@ static int wm8903_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
 	val = (WM8903_GPn_FN_GPIO_INPUT << WM8903_GP1_FN_SHIFT) |
 		WM8903_GP1_DIR;
 
-	ret = snd_soc_update_bits(codec, WM8903_GPIO_CONTROL_1 + offset,
-				  mask, val);
+	ret = regmap_update_bits(wm8903->regmap,
+				 WM8903_GPIO_CONTROL_1 + offset, mask, val);
 	if (ret < 0)
 		return ret;
 
@@ -1793,10 +1793,9 @@ static int wm8903_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
 static int wm8903_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
 	struct wm8903_priv *wm8903 = gpio_to_wm8903(chip);
-	struct snd_soc_codec *codec = wm8903->codec;
-	int reg;
+	unsigned int reg;
 
-	reg = snd_soc_read(codec, WM8903_GPIO_CONTROL_1 + offset);
+	regmap_read(wm8903->regmap, WM8903_GPIO_CONTROL_1 + offset, &reg);
 
 	return (reg & WM8903_GP1_LVL_MASK) >> WM8903_GP1_LVL_SHIFT;
 }
@@ -1805,7 +1804,6 @@ static int wm8903_gpio_direction_out(struct gpio_chip *chip,
 				     unsigned offset, int value)
 {
 	struct wm8903_priv *wm8903 = gpio_to_wm8903(chip);
-	struct snd_soc_codec *codec = wm8903->codec;
 	unsigned int mask, val;
 	int ret;
 
@@ -1813,8 +1811,8 @@ static int wm8903_gpio_direction_out(struct gpio_chip *chip,
 	val = (WM8903_GPn_FN_GPIO_OUTPUT << WM8903_GP1_FN_SHIFT) |
 		(value << WM8903_GP2_LVL_SHIFT);
 
-	ret = snd_soc_update_bits(codec, WM8903_GPIO_CONTROL_1 + offset,
-				  mask, val);
+	ret = regmap_update_bits(wm8903->regmap,
+				 WM8903_GPIO_CONTROL_1 + offset, mask, val);
 	if (ret < 0)
 		return ret;
 
@@ -1824,11 +1822,10 @@ static int wm8903_gpio_direction_out(struct gpio_chip *chip,
 static void wm8903_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
 	struct wm8903_priv *wm8903 = gpio_to_wm8903(chip);
-	struct snd_soc_codec *codec = wm8903->codec;
 
-	snd_soc_update_bits(codec, WM8903_GPIO_CONTROL_1 + offset,
-			    WM8903_GP1_LVL_MASK,
-			    !!value << WM8903_GP1_LVL_SHIFT);
+	regmap_update_bits(wm8903->regmap, WM8903_GPIO_CONTROL_1 + offset,
+			   WM8903_GP1_LVL_MASK,
+			   !!value << WM8903_GP1_LVL_SHIFT);
 }
 
 static struct gpio_chip wm8903_template_chip = {
@@ -1842,15 +1839,14 @@ static struct gpio_chip wm8903_template_chip = {
 	.can_sleep		= 1,
 };
 
-static void wm8903_init_gpio(struct snd_soc_codec *codec)
+static void wm8903_init_gpio(struct wm8903_priv *wm8903)
 {
-	struct wm8903_priv *wm8903 = snd_soc_codec_get_drvdata(codec);
 	struct wm8903_platform_data *pdata = wm8903->pdata;
 	int ret;
 
 	wm8903->gpio_chip = wm8903_template_chip;
 	wm8903->gpio_chip.ngpio = WM8903_NUM_GPIO;
-	wm8903->gpio_chip.dev = codec->dev;
+	wm8903->gpio_chip.dev = wm8903->dev;
 
 	if (pdata->gpio_base)
 		wm8903->gpio_chip.base = pdata->gpio_base;
@@ -1859,24 +1855,23 @@ static void wm8903_init_gpio(struct snd_soc_codec *codec)
 
 	ret = gpiochip_add(&wm8903->gpio_chip);
 	if (ret != 0)
-		dev_err(codec->dev, "Failed to add GPIOs: %d\n", ret);
+		dev_err(wm8903->dev, "Failed to add GPIOs: %d\n", ret);
 }
 
-static void wm8903_free_gpio(struct snd_soc_codec *codec)
+static void wm8903_free_gpio(struct wm8903_priv *wm8903)
 {
-	struct wm8903_priv *wm8903 = snd_soc_codec_get_drvdata(codec);
 	int ret;
 
 	ret = gpiochip_remove(&wm8903->gpio_chip);
 	if (ret != 0)
-		dev_err(codec->dev, "Failed to remove GPIOs: %d\n", ret);
+		dev_err(wm8903->dev, "Failed to remove GPIOs: %d\n", ret);
 }
 #else
-static void wm8903_init_gpio(struct snd_soc_codec *codec)
+static void wm8903_init_gpio(struct wm8903_priv *wm8903)
 {
 }
 
-static void wm8903_free_gpio(struct snd_soc_codec *codec)
+static void wm8903_free_gpio(struct wm8903_priv *wm8903)
 {
 }
 #endif
@@ -2000,8 +1995,6 @@ static int wm8903_probe(struct snd_soc_codec *codec)
 			    WM8903_DAC_MUTEMODE | WM8903_DAC_MUTE,
 			    WM8903_DAC_MUTEMODE | WM8903_DAC_MUTE);
 
-	wm8903_init_gpio(codec);
-
 	return ret;
 }
 
@@ -2010,7 +2003,6 @@ static int wm8903_remove(struct snd_soc_codec *codec)
 {
 	struct wm8903_priv *wm8903 = snd_soc_codec_get_drvdata(codec);
 
-	wm8903_free_gpio(codec);
 	wm8903_set_bias_level(codec, SND_SOC_BIAS_OFF);
 	if (wm8903->irq)
 		free_irq(wm8903->irq, codec);
@@ -2130,6 +2122,7 @@ static __devinit int wm8903_i2c_probe(struct i2c_client *i2c,
 			      GFP_KERNEL);
 	if (wm8903 == NULL)
 		return -ENOMEM;
+	wm8903->dev = &i2c->dev;
 
 	wm8903->regmap = regmap_init_i2c(i2c, &wm8903_regmap);
 	if (IS_ERR(wm8903->regmap)) {
@@ -2189,6 +2182,8 @@ static __devinit int wm8903_i2c_probe(struct i2c_client *i2c,
 	/* Reset the device */
 	regmap_write(wm8903->regmap, WM8903_SW_RESET_AND_ID, 0x8903);
 
+	wm8903_init_gpio(wm8903);
+
 	ret = snd_soc_register_codec(&i2c->dev,
 			&soc_codec_dev_wm8903, &wm8903_dai, 1);
 	if (ret != 0)
@@ -2204,6 +2199,7 @@ static __devexit int wm8903_i2c_remove(struct i2c_client *client)
 {
 	struct wm8903_priv *wm8903 = i2c_get_clientdata(client);
 
+	wm8903_free_gpio(wm8903);
 	regmap_exit(wm8903->regmap);
 	snd_soc_unregister_codec(&client->dev);
 
-- 
1.7.0.4
