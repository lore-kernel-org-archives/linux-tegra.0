From: Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v4 18/23] ASoC: simple-card: Add support for component chaining
Date: Sat, 27 Jun 2020 10:23:40 +0530
Message-ID: <1593233625-14961-19-git-send-email-spujar@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, kuninori.morimoto.gx@renesas.com, robh+dt@kernel.org, lgirdwood@gmail.com
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, sharadg@nvidia.com, mkumard@nvidia.com, viswanathl@nvidia.com, rlokhande@nvidia.com, dramesh@nvidia.com, atalambedu@nvidia.com, nwartikar@nvidia.com, swarren@nvidia.com, nicoleotsuka@gmail.com, Sameer Pujar <spujar@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The simple-card driver supports both normal and DPCM DAI links. The
sound cards requiring DPCM DAI link support use DPCM_SELECTABLE flag
and DAI links are treated as DPCM links depending on the number of
child nodes in a given DAI link.

There is another requirement where multiple ASoC components need to
be connected together in a chained fashion in a component model. This
patch sets 'component_chaining' flag for such sound cards where FE<->BE
and multiple BE<->BE component connections is required. Hence support
for such sound cards is added under 'simple-cc-audio-card' compatible.
All DAI links under this are treated as DPCM links and links can have
empty Codec list since components are chainied via router controls.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 include/sound/simple_card.h     |  5 +++++
 sound/soc/generic/simple-card.c | 35 ++++++++++++++++++++++++++++-------
 2 files changed, 33 insertions(+), 7 deletions(-)

diff --git a/include/sound/simple_card.h b/include/sound/simple_card.h
index d264e54..79019d0 100644
--- a/include/sound/simple_card.h
+++ b/include/sound/simple_card.h
@@ -23,4 +23,9 @@ struct asoc_simple_card_info {
 	struct asoc_simple_dai codec_dai;
 };
 
+struct asoc_simple_soc_data {
+	bool dpcm_selectable;
+	bool component_chaining;
+};
+
 #endif /* __SIMPLE_CARD_H */
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index f19030b..758c612 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -16,8 +16,6 @@
 #include <sound/soc-dai.h>
 #include <sound/soc.h>
 
-#define DPCM_SELECTABLE 1
-
 #define DAI	"sound-dai"
 #define CELL	"#sound-dai-cells"
 #define PREFIX	"simple-audio-card,"
@@ -386,10 +384,11 @@ static int simple_for_each_link(struct asoc_simple_priv *priv,
 					 struct device_node *np,
 					 struct link_info *li, bool is_top))
 {
+	struct snd_soc_card *card = simple_priv_to_card(priv);
 	struct device *dev = simple_priv_to_dev(priv);
 	struct device_node *top = dev->of_node;
 	struct device_node *node;
-	uintptr_t dpcm_selectable = (uintptr_t)of_device_get_match_data(dev);
+	const struct asoc_simple_soc_data *data = of_device_get_match_data(dev);
 	bool is_top = 0;
 	int ret = 0;
 
@@ -411,10 +410,13 @@ static int simple_for_each_link(struct asoc_simple_priv *priv,
 		/* get codec */
 		codec = of_get_child_by_name(node, is_top ?
 					     PREFIX "codec" : "codec");
-		if (!codec) {
+
+		/* Codec list can be empty for component<->component chain */
+		if (!codec && !card->component_chaining) {
 			ret = -ENODEV;
 			goto error;
 		}
+
 		/* get platform */
 		plat = of_get_child_by_name(node, is_top ?
 					    PREFIX "plat" : "plat");
@@ -432,9 +434,10 @@ static int simple_for_each_link(struct asoc_simple_priv *priv,
 			 * It is DPCM
 			 * if it has many CPUs,
 			 * or has convert-xxx property
+			 * or if component_chaining is used
 			 */
-			if (dpcm_selectable &&
-			    (num > 2 ||
+			if (data && data->dpcm_selectable &&
+			    (num > 2 || data->component_chaining ||
 			     adata.convert_rate || adata.convert_channels))
 				ret = func_dpcm(priv, np, li, is_top);
 			/* else normal sound */
@@ -654,6 +657,7 @@ static int asoc_simple_probe(struct platform_device *pdev)
 	struct asoc_simple_priv *priv;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
+	const struct asoc_simple_soc_data *data;
 	struct snd_soc_card *card;
 	struct link_info li;
 	int ret;
@@ -668,6 +672,11 @@ static int asoc_simple_probe(struct platform_device *pdev)
 	card->dev		= dev;
 	card->probe		= simple_soc_probe;
 
+	data = of_device_get_match_data(dev);
+
+	if (data)
+		card->component_chaining = data->component_chaining;
+
 	memset(&li, 0, sizeof(li));
 	simple_get_dais_count(priv, &li);
 	if (!li.link || !li.dais)
@@ -757,10 +766,22 @@ static int asoc_simple_remove(struct platform_device *pdev)
 	return asoc_simple_clean_reference(card);
 }
 
+static const struct asoc_simple_soc_data scu_card_data = {
+	.dpcm_selectable = true,
+};
+
+/* Component chaining with DPCM */
+static const struct asoc_simple_soc_data cc_card_data = {
+	.dpcm_selectable = true,
+	.component_chaining = true,
+};
+
 static const struct of_device_id simple_of_match[] = {
 	{ .compatible = "simple-audio-card", },
 	{ .compatible = "simple-scu-audio-card",
-	  .data = (void *)DPCM_SELECTABLE },
+	  .data = &scu_card_data },
+	{ .compatible = "simple-cc-audio-card",
+	  .data = &cc_card_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, simple_of_match);
-- 
2.7.4
