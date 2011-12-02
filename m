From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 2/5] ASoC: WM8903: Create default platform data structure
Date: Fri,  2 Dec 2011 15:08:38 -0700
Message-ID: <1322863721-29793-3-git-send-email-swarren@nvidia.com>
References: <1322863721-29793-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1322863721-29793-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

When no platform data is supplied, point pdata at a default platform
structure. This enables two future changes:

a) Defines the default platform data values in a single place.
b) There is always a valid pdata pointer, so some conditional code can
   be simplified by a later patch.

Based on work by John Bonesio, but significantly reworked since then.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/codecs/wm8903.c |   19 +++++++++++++++++--
 1 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index 3070a94..9fd89be 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -114,6 +114,7 @@ static const struct reg_default wm8903_reg_defaults[] = {
 };
 
 struct wm8903_priv {
+	struct wm8903_platform_data *pdata;
 	struct snd_soc_codec *codec;
 	struct regmap *regmap;
 
@@ -1834,7 +1835,7 @@ static struct gpio_chip wm8903_template_chip = {
 static void wm8903_init_gpio(struct snd_soc_codec *codec)
 {
 	struct wm8903_priv *wm8903 = snd_soc_codec_get_drvdata(codec);
-	struct wm8903_platform_data *pdata = dev_get_platdata(codec->dev);
+	struct wm8903_platform_data *pdata = wm8903->pdata;
 	int ret;
 
 	wm8903->gpio_chip = wm8903_template_chip;
@@ -1872,8 +1873,8 @@ static void wm8903_free_gpio(struct snd_soc_codec *codec)
 
 static int wm8903_probe(struct snd_soc_codec *codec)
 {
-	struct wm8903_platform_data *pdata = dev_get_platdata(codec->dev);
 	struct wm8903_priv *wm8903 = snd_soc_codec_get_drvdata(codec);
+	struct wm8903_platform_data *pdata = wm8903->pdata;
 	int ret, i;
 	int trigger, irq_pol;
 	u16 val;
@@ -2040,6 +2041,7 @@ static const struct regmap_config wm8903_regmap = {
 static __devinit int wm8903_i2c_probe(struct i2c_client *i2c,
 				      const struct i2c_device_id *id)
 {
+	struct wm8903_platform_data *pdata = dev_get_platdata(&i2c->dev);
 	struct wm8903_priv *wm8903;
 	unsigned int val;
 	int ret;
@@ -2060,6 +2062,19 @@ static __devinit int wm8903_i2c_probe(struct i2c_client *i2c,
 	i2c_set_clientdata(i2c, wm8903);
 	wm8903->irq = i2c->irq;
 
+	/* If no platform data was supplied, create storage for defaults */
+	if (pdata) {
+		wm8903->pdata = pdata;
+	} else {
+		wm8903->pdata = devm_kzalloc(&i2c->dev,
+					sizeof(struct wm8903_platform_data),
+					GFP_KERNEL);
+		if (wm8903->pdata == NULL) {
+			dev_err(&i2c->dev, "Failed to allocate pdata\n");
+			return -ENOMEM;
+		}
+	}
+
 	ret = regmap_read(wm8903->regmap, WM8903_SW_RESET_AND_ID, &val);
 	if (ret != 0) {
 		dev_err(&i2c->dev, "Failed to read chip ID: %d\n", ret);
-- 
1.7.0.4
