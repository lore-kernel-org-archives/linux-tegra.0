From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 4/6] ASoC: Allow DAI links to be specified using device tree nodes
Date: Wed,  7 Dec 2011 15:13:47 -0700
Message-ID: <1323296033-28730-9-git-send-email-swarren@nvidia.com>
References: <1323296033-28730-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1323296033-28730-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

DAI link endpoints and platform (DMA) devices are currently specified
by name. When instantiating sound cards from device tree, it may be more
convenient to refer to these devices by phandle in the device tree, and
for code to describe DAI links using the "struct device_node *"
("of_node") those phandles map to.

This change adds new fields to snd_soc_dai_link which can "name" devices
using of_node, enhances soc_bind_dai_link() to allow binding based on
of_node, and enhances snd_soc_register_card() to ensure that illegal
combinations of name and of_node are not used.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v2: New patch implementing a new feature

 include/sound/soc.h  |    4 +++
 sound/soc/soc-core.c |   64 ++++++++++++++++++++++++++++++++++++++++++++-----
 2 files changed, 61 insertions(+), 7 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index d9aa66b..40c256e 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -231,6 +231,7 @@ enum snd_soc_bias_level {
 	SND_SOC_BIAS_ON = 3,
 };
 
+struct device_node;
 struct snd_jack;
 struct snd_soc_card;
 struct snd_soc_pcm_stream;
@@ -704,8 +705,11 @@ struct snd_soc_dai_link {
 	const char *name;			/* Codec name */
 	const char *stream_name;		/* Stream name */
 	const char *codec_name;		/* for multi-codec */
+	const struct device_node *codec_of_node;
 	const char *platform_name;	/* for multi-platform */
+	const struct device_node *platform_of_node;
 	const char *cpu_dai_name;
+	const struct device_node *cpu_dai_of_node;
 	const char *codec_dai_name;
 
 	unsigned int dai_fmt;           /* format to set on init */
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index d2f9df5..07e536f 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -764,8 +764,13 @@ static int soc_bind_dai_link(struct snd_soc_card *card, int num)
 	}
 	/* no, then find CPU DAI from registered DAIs*/
 	list_for_each_entry(cpu_dai, &dai_list, list) {
-		if (strcmp(cpu_dai->name, dai_link->cpu_dai_name))
-			continue;
+		if (dai_link->cpu_dai_of_node) {
+			if (cpu_dai->dev->of_node != dai_link->cpu_dai_of_node)
+				continue;
+		} else {
+			if (strcmp(cpu_dai->name, dai_link->cpu_dai_name))
+				continue;
+		}
 
 		rtd->cpu_dai = cpu_dai;
 		goto find_codec;
@@ -781,8 +786,13 @@ find_codec:
 
 	/* no, then find CODEC from registered CODECs*/
 	list_for_each_entry(codec, &codec_list, list) {
-		if (strcmp(codec->name, dai_link->codec_name))
-			continue;
+		if (dai_link->codec_of_node) {
+			if (codec->dev->of_node != dai_link->codec_of_node)
+				continue;
+		} else {
+			if (strcmp(codec->name, dai_link->codec_name))
+				continue;
+		}
 
 		rtd->codec = codec;
 
@@ -814,13 +824,19 @@ find_platform:
 
 	/* if there's no platform we match on the empty platform */
 	platform_name = dai_link->platform_name;
-	if (!platform_name)
+	if (!platform_name && !dai_link->platform_of_node)
 		platform_name = "snd-soc-dummy";
 
 	/* no, then find one from the set of registered platforms */
 	list_for_each_entry(platform, &platform_list, list) {
-		if (strcmp(platform->name, platform_name))
-			continue;
+		if (dai_link->platform_of_node) {
+			if (platform->dev->of_node !=
+			    dai_link->platform_of_node)
+				continue;
+		} else {
+			if (strcmp(platform->name, platform_name))
+				continue;
+		}
 
 		rtd->platform = platform;
 		goto out;
@@ -2909,6 +2925,40 @@ int snd_soc_register_card(struct snd_soc_card *card)
 		return -EINVAL;
 	}
 
+	for (i = 0; i < card->num_links; i++) {
+		struct snd_soc_dai_link *link = &card->dai_link[i];
+
+		/*
+		 * Codec must be specified by 1 of name or OF node,
+		 * not both or neither.
+		 */
+		if (!!link->codec_name == !!link->codec_of_node) {
+			dev_err(card->dev,
+				"Neither/both codec name/of_node are set\n");
+			return -EINVAL;
+		}
+
+		/*
+		 * Platform may be specified by either name or OF node, but
+		 * can be left unspecified, and a dummy platform will be used.
+		 */
+		if (link->platform_name && link->platform_of_node) {
+			dev_err(card->dev,
+				"Both platform name/of_node are set\n");
+			return -EINVAL;
+		}
+
+		/*
+		 * CPU DAI must be specified by 1 of name or OF node,
+		 * not both or neither.
+		 */
+		if (!!link->cpu_dai_name == !!link->cpu_dai_of_node) {
+			dev_err(card->dev,
+				"Neither/both cpu_dai name/of_node are set\n");
+			return -EINVAL;
+		}
+	}
+
 	dev_set_drvdata(card->dev, card);
 
 	snd_soc_initialize_card_lists(card);
-- 
1.7.0.4
