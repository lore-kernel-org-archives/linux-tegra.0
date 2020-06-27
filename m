From: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 11/23] ASoC: simple-card: Loop over all children for 'mclk-fs'
Date: Sat, 27 Jun 2020 10:23:33 +0530
Message-ID: <1593233625-14961-12-git-send-email-spujar@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1593233625-14961-1-git-send-email-spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nwartikar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

CPU/Codec in DPCM DAI links are connected as CPU<->Dummy and Dummy<->Codec.
Though mostly CPU won't use/require 'mclk-fs' property, looping over
'np' (current child node in a DAI link) can help in cases where multiple
Codecs are defined. This further helps to get rid of 'codec' argument
from simple_dai_link_of_dpcm() function, which gets called for DPCM links.

Signed-off-by: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/generic/simple-card.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 39cdc71..02d6295 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -107,7 +107,9 @@ static void simple_parse_mclk_fs(struct device_node *top,
 	snprintf(prop, sizeof(prop), "%smclk-fs", prefix);
 	of_property_read_u32(node,	prop, &props->mclk_fs);
 	of_property_read_u32(cpu,	prop, &props->mclk_fs);
-	of_property_read_u32(codec,	prop, &props->mclk_fs);
+
+	if (cpu != codec)
+		of_property_read_u32(codec, prop, &props->mclk_fs);
 
 	of_node_put(node);
 }
@@ -220,7 +222,7 @@ static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 	}
 
 	simple_parse_convert(dev, np, &dai_props->adata);
-	simple_parse_mclk_fs(top, np, codec, dai_props, prefix);
+	simple_parse_mclk_fs(top, np, np, dai_props, prefix);
 
 	asoc_simple_canonicalize_platform(dai_link);
 
-- 
2.7.4
