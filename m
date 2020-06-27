From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 13/23] ASoC: simple-card: DPCM DAI link direction as per DAI capability
Date: Sat, 27 Jun 2020 10:23:35 +0530
Message-ID: <1593233625-14961-14-git-send-email-spujar@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1593233625-14961-1-git-send-email-spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nwartikar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The soc_new_pcm() fails for DAI link having DAI which supports a
single stream direction of either PLAYBACK or CAPTURE. For example
it fails for Microphone which can support CAPTURE stream only. This
happens because simple-card driver by default populates both stream
directions.

This can be fixed by populating directions based on DAI capability.
For 'CPU<->Dummy' DAI links CPU is used to setup the direction and
similarly Codec is used for 'Dummy<->Codec' DAI links.

Signed-off-by: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/generic/simple-card.c | 27 +++++++++++++++++++++++++--
 sound/soc/soc-dai.c             |  1 +
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 15c4388..62f2978 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -114,6 +114,23 @@ static void simple_parse_mclk_fs(struct device_node *top,
 	of_node_put(node);
 }
 
+static int simple_parse_dpcm_dir(const struct snd_soc_dai_link_component *dlc,
+				 struct snd_soc_dai_link *dai_link)
+{
+	struct snd_soc_dai *dai = snd_soc_find_dai(dlc);
+
+	if (!dai)
+		return -EINVAL;
+
+	dai_link->dpcm_playback =
+		snd_soc_dai_stream_valid(dai, SNDRV_PCM_STREAM_PLAYBACK);
+
+	dai_link->dpcm_capture =
+		snd_soc_dai_stream_valid(dai, SNDRV_PCM_STREAM_CAPTURE);
+
+	return 0;
+}
+
 static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 				   struct device_node *np,
 				   struct link_info *li,
@@ -183,6 +200,10 @@ static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 			goto out_put_node;
 
 		asoc_simple_canonicalize_cpu(dai_link, is_single_links);
+
+		ret = simple_parse_dpcm_dir(cpus, dai_link);
+		if (ret < 0)
+			goto out_put_node;
 	} else {
 		struct snd_soc_codec_conf *cconf;
 
@@ -223,6 +244,10 @@ static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 					     "prefix");
 		snd_soc_of_parse_node_prefix(np, cconf, codecs->of_node,
 					     "prefix");
+
+		ret = simple_parse_dpcm_dir(codecs, dai_link);
+		if (ret < 0)
+			goto out_put_node;
 	}
 
 	simple_parse_convert(dev, np, &dai_props->adata);
@@ -239,8 +264,6 @@ static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 	if (ret < 0)
 		goto out_put_node;
 
-	dai_link->dpcm_playback		= 1;
-	dai_link->dpcm_capture		= 1;
 	dai_link->ops			= &simple_ops;
 	dai_link->init			= asoc_simple_dai_init;
 
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index b05e18b..bd4465f 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -390,6 +390,7 @@ bool snd_soc_dai_stream_valid(struct snd_soc_dai *dai, int dir)
 	/* If the codec specifies any channels at all, it supports the stream */
 	return stream->channels_min;
 }
+EXPORT_SYMBOL_GPL(snd_soc_dai_stream_valid);
 
 void snd_soc_dai_action(struct snd_soc_dai *dai,
 			int stream, int action)
-- 
2.7.4
