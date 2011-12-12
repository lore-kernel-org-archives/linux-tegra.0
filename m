From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 1/3] ASoC: Add utility to set a card's name from device tree
Date: Mon, 12 Dec 2011 15:55:34 -0700
Message-ID: <1323730536-19915-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Implement snd_soc_of_parse_card_name(), a utility function that sets a
card's name from device tree. The machine driver specifies the DT
property to use, since this is binding-specific.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
This series is based on my previously posted patch "ASoC: Allow DAI
links to be specified using device tree nodes" v4. Patches 1 & 2 at
most rely on that for context. Patch 3 relies on it for functionality.

v2: New patch implementing new functionality
v3: Name this embedded-audio-complex instead of soc-audio-complex.
    Change property name from user-visible-name to model.
    Remove compatible property from binding.
v4: Convert this to a utility function that cards can call if desired.
    Modify snd_soc_register_card() not to call this automatically.
    Allow cards to specify the name of the device tree property that
    stores that card's name. Don't specify the property as a generic
    binding; remove embedded-audio-complex.txt

 include/sound/soc.h  |    3 +++
 sound/soc/soc-core.c |   25 +++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 40c256e..6e51a3f 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -966,6 +966,9 @@ static inline bool snd_soc_volsw_is_stereo(struct soc_mixer_control *mc)
 int snd_soc_util_init(void);
 void snd_soc_util_exit(void);
 
+int snd_soc_of_parse_card_name(struct snd_soc_card *card,
+			       const char *propname);
+
 #include <sound/soc-dai.h>
 
 #ifdef CONFIG_DEBUG_FS
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 83aa82e..4e8d762 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -32,6 +32,7 @@
 #include <linux/platform_device.h>
 #include <linux/ctype.h>
 #include <linux/slab.h>
+#include <linux/of.h>
 #include <sound/ac97_codec.h>
 #include <sound/core.h>
 #include <sound/jack.h>
@@ -3367,6 +3368,30 @@ found:
 }
 EXPORT_SYMBOL_GPL(snd_soc_unregister_codec);
 
+/* Retrieve a card's name from device tree */
+int snd_soc_of_parse_card_name(struct snd_soc_card *card,
+			       const char *propname)
+{
+	struct device_node *np = card->dev->of_node;
+	int ret;
+
+	ret = of_property_read_string_index(np, propname, 0, &card->name);
+	/*
+	 * EINVAL means the property does not exist. This is fine providing
+	 * card->name was previously set, which is checked later in
+	 * snd_soc_register_card.
+	 */
+	if (ret < 0 && ret != -EINVAL) {
+		dev_err(card->dev,
+			"Property '%s' could not be read: %d\n",
+			propname, ret);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_of_parse_card_name);
+
 static int __init snd_soc_init(void)
 {
 #ifdef CONFIG_DEBUG_FS
-- 
1.7.0.4
