From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 08/10] ASoC: audio-graph: Add support for component chaining
Date: Sun, 19 Jul 2020 10:40:15 +0530
Message-ID: <1595135417-16589-9-git-send-email-spujar@nvidia.com>
References: <1595135417-16589-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1595135417-16589-1-git-send-email-spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nwartikar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The audio-graph driver supports both normal and DPCM DAI links. The
sound cards requiring DPCM DAI link support, use DPCM_SELECTABLE flag
and DAI links are treated as DPCM links depending on the number of
child nodes in a given DAI link.

There is another requirement where multiple ASoC components need to
be connected together in a chained fashion in a component model. This
patch sets 'component_chaining' flag for such sound cards where FE<->BE
and multiple BE<->BE component connections are required. Hence support
for such sound cards is added under 'audio-graph-cc-card' compatible.
All DAI links under this are treated as DPCM links.

Signed-off-by: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/generic/audio-graph-card.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 82d8c740..ccfcf5f 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -20,10 +20,13 @@
 #include <linux/string.h>
 #include <sound/simple_card_utils.h>
 
-#define DPCM_SELECTABLE 1
-
 #define PREFIX	"audio-graph-card,"
 
+struct asoc_simple_soc_data {
+	unsigned int dpcm_selectable:1;
+	unsigned int component_chaining:1;
+};
+
 static int graph_outdrv_event(struct snd_soc_dapm_widget *w,
 			      struct snd_kcontrol *kcontrol,
 			      int event)
@@ -449,7 +452,7 @@ static int graph_for_each_link(struct asoc_simple_priv *priv,
 	struct device_node *codec_ep;
 	struct device_node *codec_port;
 	struct asoc_simple_data adata;
-	uintptr_t dpcm_selectable = (uintptr_t)of_device_get_match_data(dev);
+	const struct asoc_simple_soc_data *data = of_device_get_match_data(dev);
 	int rc, ret;
 
 	/* loop for all listed CPU port */
@@ -476,10 +479,12 @@ static int graph_for_each_link(struct asoc_simple_priv *priv,
 			 * It is DPCM
 			 * if Codec port has many endpoints,
 			 * or has convert-xxx property
+			 * or component chaining is used
 			 */
-			if (dpcm_selectable &&
+			if (data && data->dpcm_selectable &&
 			    ((of_get_child_count(codec_port) > 1) ||
-			     adata.convert_rate || adata.convert_channels))
+			     adata.convert_rate || adata.convert_channels ||
+			     data->component_chaining))
 				ret = func_dpcm(priv, cpu_ep, codec_ep, li);
 			/* else normal sound */
 			else
@@ -650,6 +655,7 @@ static int graph_probe(struct platform_device *pdev)
 {
 	struct asoc_simple_priv *priv;
 	struct device *dev = &pdev->dev;
+	const struct asoc_simple_soc_data *data = of_device_get_match_data(dev);
 	struct snd_soc_card *card;
 	struct link_info li;
 	int ret;
@@ -666,6 +672,9 @@ static int graph_probe(struct platform_device *pdev)
 	card->num_dapm_widgets	= ARRAY_SIZE(graph_dapm_widgets);
 	card->probe		= graph_card_probe;
 
+	if (data)
+		card->component_chaining = data->component_chaining;
+
 	memset(&li, 0, sizeof(li));
 	graph_get_dais_count(priv, &li);
 	if (!li.link || !li.dais)
@@ -711,10 +720,19 @@ static int graph_remove(struct platform_device *pdev)
 	return asoc_simple_clean_reference(card);
 }
 
+static const struct asoc_simple_soc_data scu_card_data = {
+	.dpcm_selectable = 1,
+};
+
+static const struct asoc_simple_soc_data cc_card_data = {
+	.dpcm_selectable = 1,
+	.component_chaining = 1,
+};
+
 static const struct of_device_id graph_of_match[] = {
 	{ .compatible = "audio-graph-card", },
-	{ .compatible = "audio-graph-scu-card",
-	  .data = (void *)DPCM_SELECTABLE },
+	{ .compatible = "audio-graph-scu-card", .data = &scu_card_data, },
+	{ .compatible = "audio-graph-cc-card", .data = &cc_card_data, },
 	{},
 };
 MODULE_DEVICE_TABLE(of, graph_of_match);
-- 
2.7.4
