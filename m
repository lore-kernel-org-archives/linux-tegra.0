From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 03/10] ASoC: audio-graph: Support Codec with multiple endpoints
Date: Sun, 19 Jul 2020 10:40:10 +0530
Message-ID: <1595135417-16589-4-git-send-email-spujar@nvidia.com>
References: <1595135417-16589-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1595135417-16589-1-git-send-email-spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nwartikar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

If a Codec port has multiple endpoints, only first endpoint gets parsed
and remaining are ignored. This can be fixed by removing 'dup_codec' flag
passed to graph_dai_link_of_dpcm() and thus it loops over all endpoints
of Codec. Similarly graph_count_dpcm() is updated as well.

Signed-off-by: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/generic/audio-graph-card.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 1e20562..b1903f9 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -201,8 +201,7 @@ static void graph_parse_mclk_fs(struct device_node *top,
 static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 				  struct device_node *cpu_ep,
 				  struct device_node *codec_ep,
-				  struct link_info *li,
-				  int dup_codec)
+				  struct link_info *li)
 {
 	struct device *dev = simple_priv_to_dev(priv);
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
@@ -217,10 +216,6 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 	struct snd_soc_dai_link_component *codecs = dai_link->codecs;
 	int ret;
 
-	/* Do it all CPU endpoint, and 1st Codec endpoint */
-	if (!li->cpu && dup_codec)
-		return 0;
-
 	port	= of_get_parent(ep);
 	ports	= of_get_parent(port);
 	node	= of_graph_get_port_parent(ep);
@@ -415,7 +410,7 @@ static int graph_for_each_link(struct asoc_simple_priv *priv,
 			int (*func_dpcm)(struct asoc_simple_priv *priv,
 					 struct device_node *cpu_ep,
 					 struct device_node *codec_ep,
-					 struct link_info *li, int dup_codec))
+					 struct link_info *li))
 {
 	struct of_phandle_iterator it;
 	struct device *dev = simple_priv_to_dev(priv);
@@ -424,7 +419,6 @@ static int graph_for_each_link(struct asoc_simple_priv *priv,
 	struct device_node *cpu_ep;
 	struct device_node *codec_ep;
 	struct device_node *codec_port;
-	struct device_node *codec_port_old = NULL;
 	struct asoc_simple_data adata;
 	uintptr_t dpcm_selectable = (uintptr_t)of_device_get_match_data(dev);
 	int rc, ret;
@@ -457,8 +451,7 @@ static int graph_for_each_link(struct asoc_simple_priv *priv,
 			if (dpcm_selectable &&
 			    ((of_get_child_count(codec_port) > 1) ||
 			     adata.convert_rate || adata.convert_channels))
-				ret = func_dpcm(priv, cpu_ep, codec_ep, li,
-						(codec_port_old == codec_port));
+				ret = func_dpcm(priv, cpu_ep, codec_ep, li);
 			/* else normal sound */
 			else
 				ret = func_noml(priv, cpu_ep, codec_ep, li);
@@ -468,8 +461,6 @@ static int graph_for_each_link(struct asoc_simple_priv *priv,
 
 			if (ret < 0)
 				return ret;
-
-			codec_port_old = codec_port;
 		}
 	}
 
@@ -532,19 +523,18 @@ static int graph_count_noml(struct asoc_simple_priv *priv,
 static int graph_count_dpcm(struct asoc_simple_priv *priv,
 			    struct device_node *cpu_ep,
 			    struct device_node *codec_ep,
-			    struct link_info *li,
-			    int dup_codec)
+			    struct link_info *li)
 {
 	struct device *dev = simple_priv_to_dev(priv);
 
+	/* CPU */
 	li->link++; /* 1xCPU-dummy */
 	li->dais++; /* 1xCPU */
 
-	if (!dup_codec) {
-		li->link++; /* 1xdummy-Codec */
-		li->conf++; /* 1xdummy-Codec */
-		li->dais++; /* 1xCodec */
-	}
+	/* Codec */
+	li->link++; /* 1xdummy-Codec */
+	li->conf++; /* 1xdummy-Codec */
+	li->dais++; /* 1xCodec */
 
 	dev_dbg(dev, "Count As DPCM\n");
 
-- 
2.7.4
