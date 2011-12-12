From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 2/3] ASoC: Add utility to parse DAPM routes from device tree
Date: Mon, 12 Dec 2011 15:55:35 -0700
Message-ID: <1323730536-19915-2-git-send-email-swarren@nvidia.com>
References: <1323730536-19915-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1323730536-19915-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Implement snd_soc_of_parse_audio_routing(), a utility function that can
parses a simple DAPM route table from device tree.The machine driver
specifies the DT property to use, since this is binding-specific.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v2: New patch; separated this code out of the Tegra+WM8903 machine driver
into a generic feature.
v3: No changes.
v4: Convert this to a utility function that cards can call if desired.
    Modify snd_soc_register_card() not to call this automatically.
    Allow cards to specify the name of the device tree property that
    stores that card's name. Don't specify the property as a generic
    binding; remove embedded-audio-complex.txt

 include/sound/soc.h  |    2 +
 sound/soc/soc-core.c |   57 ++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+), 0 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 6e51a3f..1e68661 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -968,6 +968,8 @@ void snd_soc_util_exit(void);
 
 int snd_soc_of_parse_card_name(struct snd_soc_card *card,
 			       const char *propname);
+int snd_soc_of_parse_audio_routing(struct snd_soc_card *card,
+				   const char *propname);
 
 #include <sound/soc-dai.h>
 
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 4e8d762..a4592cb 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3392,6 +3392,63 @@ int snd_soc_of_parse_card_name(struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_GPL(snd_soc_of_parse_card_name);
 
+int snd_soc_of_parse_audio_routing(struct snd_soc_card *card,
+				   const char *propname)
+{
+	struct device_node *np = card->dev->of_node;
+	int num_routes;
+	struct snd_soc_dapm_route *routes;
+	int i, ret;
+
+	num_routes = of_property_count_strings(np, propname);
+	if (num_routes & 1) {
+		dev_err(card->dev,
+			"Property '%s's length is not even\n",
+			propname);
+		return -EINVAL;
+	}
+	num_routes /= 2;
+	if (!num_routes) {
+		dev_err(card->dev,
+			"Property '%s's length is zero\n",
+			propname);
+		return -EINVAL;
+	}
+
+	routes = devm_kzalloc(card->dev, num_routes * sizeof(*routes),
+			      GFP_KERNEL);
+	if (!routes) {
+		dev_err(card->dev,
+			"Could not allocate DAPM route table\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < num_routes; i++) {
+		ret = of_property_read_string_index(np, propname,
+			2 * i, &routes[i].sink);
+		if (ret) {
+			dev_err(card->dev,
+				"Property '%s' index %d could not be read: %d\n",
+				propname, 2 * i, ret);
+			return -EINVAL;
+		}
+		ret = of_property_read_string_index(np, propname,
+			(2 * i) + 1, &routes[i].source);
+		if (ret) {
+			dev_err(card->dev,
+				"Property '%s' index %d could not be read: %d\n",
+				propname, (2 * i) + 1, ret);
+			return -EINVAL;
+		}
+	}
+
+	card->num_dapm_routes = num_routes;
+	card->dapm_routes = routes;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_of_parse_audio_routing);
+
 static int __init snd_soc_init(void)
 {
 #ifdef CONFIG_DEBUG_FS
-- 
1.7.0.4
