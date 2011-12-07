From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 1/6] ASoC: Allow device tree to specify a card's name
Date: Wed,  7 Dec 2011 13:58:25 -0700
Message-ID: <1323291510-22338-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

If a card's device was instantiated from device tree, and the device tree
has a "user-visible-name" property, use that as the card's name.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v2: New patch implementing new functionality

Re: the binding documentation:
* "SoC" here refers to the fact this is a binding oriented at System-on-
  chip audio complexes, rather than having to do with "ASoC"; both names
  were derived from the same root.
* Do we need a compatible property for this "base class" binding at all?
  I think it's a good idea, even though the code doesn't actually rely
  on it.
* Should the vendor field in the compatible property be "generic",
  "linux", or absent? I've tried to make these bindings generic and
  applicable to other OSs, so "linux," seems wrong.
* Should the property "user-visible-name" have a "generic," prefix or
  similar?

 .../bindings/sound/soc-audio-complex.txt           |   14 ++++++++
 sound/soc/soc-core.c                               |   35 ++++++++++++++++++-
 2 files changed, 47 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/soc-audio-complex.txt

diff --git a/Documentation/devicetree/bindings/sound/soc-audio-complex.txt b/Documentation/devicetree/bindings/sound/soc-audio-complex.txt
new file mode 100644
index 0000000..1cc7059
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/soc-audio-complex.txt
@@ -0,0 +1,14 @@
+SoC Audio Complex
+
+Required properties:
+- compatible : "generic,soc-audio-complex". Other compatible values
+  indicating the specific HW model will typically be present too.
+- user-visible-name : The user-visible name of this sound complex.
+
+Example:
+
+sound {
+	compatible = "nvidia,tegra-audio-wm8903",
+		     "generic,soc-audio-complex";
+	user-visible-name = "tegra-wm8903-harmony";
+};
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 5195f06..56d1bc5 100644
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
@@ -2809,6 +2810,25 @@ int snd_soc_dai_digital_mute(struct snd_soc_dai *dai, int mute)
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_digital_mute);
 
+/* Retrieve a card's name from device tree */
+static int snd_soc_of_parse_card_name(struct snd_soc_card *card)
+{
+	struct device_node *np = card->dev->of_node;
+	int ret;
+
+	ret = of_property_read_string_index(np, "user-visible-name", 0,
+					    &card->name);
+	/*
+	 * EINVAL means the property does not exist. This is fine providing
+	 * card->name was previously set, which is checked later in
+	 * snd_soc_register_card.
+	 */
+	if (ret < 0 && ret != -EINVAL)
+		return ret;
+
+	return 0;
+}
+
 /**
  * snd_soc_register_card - Register a card with the ASoC core
  *
@@ -2817,11 +2837,22 @@ EXPORT_SYMBOL_GPL(snd_soc_dai_digital_mute);
  */
 int snd_soc_register_card(struct snd_soc_card *card)
 {
-	int i;
+	int i, ret;
 
-	if (!card->name || !card->dev)
+	if (!card->dev)
 		return -EINVAL;
 
+	if (card->dev->of_node) {
+		ret = snd_soc_of_parse_card_name(card);
+		if (ret < 0)
+			return ret;
+	}
+
+	if (!card->name) {
+		dev_err(card->dev, "Card name is not set\n");
+		return -EINVAL;
+	}
+
 	dev_set_drvdata(card->dev, card);
 
 	snd_soc_initialize_card_lists(card);
-- 
1.7.0.4
