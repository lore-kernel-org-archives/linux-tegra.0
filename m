From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 12/23] ASoC: simple-card: Support DPCM DAI link with multiple Codecs
Date: Sat, 27 Jun 2020 10:23:34 +0530
Message-ID: <1593233625-14961-13-git-send-email-spujar@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1593233625-14961-1-git-send-email-spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nwartikar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The simple-card driver supports multiple CPU and single Codec entries
for DPCM DAI links. In some cases it is required to have multiple
CPU/Codecs. Currently parsing logic for DPCM link loops over all
children of DAI link but assumes that there is a single Codec entry.
When DAI link has multiple Codecs it considers only the first Codec
entry and remaining Codecs are wrongly treated as CPU. This happens
because first Codec is used as reference for parsing all other child
nodes.

This is fixed by using string comparisons of child node names instead
of node pointer reference in simple_dai_link_of_dpcm(). So All CPU
get parsed in first run and all Codecs in subsequent run. After this
simple_dai_link_of_dpcm() does not required 'codec' argument and hence
is removed.

Signed-off-by: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/generic/simple-card.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 02d6295..15c4388 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -116,7 +116,6 @@ static void simple_parse_mclk_fs(struct device_node *top,
 
 static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 				   struct device_node *np,
-				   struct device_node *codec,
 				   struct link_info *li,
 				   bool is_top)
 {
@@ -137,8 +136,13 @@ static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 	 * Codec |return|Pass
 	 * np
 	 */
-	if (li->cpu == (np == codec))
-		return 0;
+	if (li->cpu) {
+		if (!strcmp(np->name, "codec"))
+			return 0;
+	} else {
+		if (!strcmp(np->name, "cpu"))
+			return 0;
+	}
 
 	dev_dbg(dev, "link_of DPCM (%pOF)\n", np);
 
@@ -354,7 +358,6 @@ static int simple_for_each_link(struct asoc_simple_priv *priv,
 					 struct link_info *li, bool is_top),
 			int (*func_dpcm)(struct asoc_simple_priv *priv,
 					 struct device_node *np,
-					 struct device_node *codec,
 					 struct link_info *li, bool is_top))
 {
 	struct device *dev = simple_priv_to_dev(priv);
@@ -407,7 +410,7 @@ static int simple_for_each_link(struct asoc_simple_priv *priv,
 			if (dpcm_selectable &&
 			    (num > 2 ||
 			     adata.convert_rate || adata.convert_channels))
-				ret = func_dpcm(priv, np, codec, li, is_top);
+				ret = func_dpcm(priv, np, li, is_top);
 			/* else normal sound */
 			else
 				ret = func_noml(priv, np, codec, li, is_top);
@@ -527,12 +530,11 @@ static int simple_count_noml(struct asoc_simple_priv *priv,
 
 static int simple_count_dpcm(struct asoc_simple_priv *priv,
 			     struct device_node *np,
-			     struct device_node *codec,
 			     struct link_info *li, bool is_top)
 {
 	li->dais++; /* CPU or Codec */
 	li->link++; /* CPU-dummy or dummy-Codec */
-	if (np == codec)
+	if (!strcmp(np->name, "codec"))
 		li->conf++;
 
 	return 0;
-- 
2.7.4
