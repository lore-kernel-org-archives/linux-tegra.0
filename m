From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 10/23] ASoC: simple-card: Wrong daifmt for CPU end of DPCM DAI link
Date: Sat, 27 Jun 2020 10:23:32 +0530
Message-ID: <1593233625-14961-11-git-send-email-spujar@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1593233625-14961-1-git-send-email-spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nwartikar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Consider following DPCM DAI link for example:

 simple-audio-card,dai-link@xxx {
     format = "i2s";
     bitclock-master=<&cpu1>;
     frame-master=<&cpu1>;

     cpu1: cpu@0 {
         ...
     };

     codec@0 {
         ...
     };

     ...
 };

In above case CPU is expected to be configured as a master and Codec as
a slave device. But both CPU/Codec are being configured as slave devices.
This happens because asoc_simple_parse_daifmt() uses Codec reference and
sets up the 'dai_link->dai_fmt' accordingly while parsing both CPU and
Codec. Though populating 'non_legacy_dai_naming' flag as true for CPU
component can address above issue in simple cases, but with multiple
CPU/Codecs with DPCM DAI link it becomes tricky because right now the
first Codec in the DAI link is used as reference.

This is fixed by passing current DAI link child node reference to
asoc_simple_parse_daifmt(). It parses a CPU/Codec node independently and
sets daifmt as per 'bitcloclk/frame-master' property.

Signed-off-by: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/generic/simple-card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 0f443c0..39cdc71 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -228,7 +228,7 @@ static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 	if (ret)
 		goto out_put_node;
 
-	ret = asoc_simple_parse_daifmt(dev, node, codec,
+	ret = asoc_simple_parse_daifmt(dev, node, np,
 				       prefix, &dai_link->dai_fmt);
 	if (ret < 0)
 		goto out_put_node;
-- 
2.7.4
