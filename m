From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 3/6] ASoC: Refactor some conditions and loop in soc_bind_dai_link()
Date: Wed,  7 Dec 2011 13:58:27 -0700
Message-ID: <1323291510-22338-3-git-send-email-swarren@nvidia.com>
References: <1323291510-22338-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1323291510-22338-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Transform some loops from:

for_each(x) {
    if (f(x)) {
        work_on(x);
    }
}

to new structure:

for_each(x) {
    if (!f(x))
        continue;

    work_on(x);
}

This will allow future modification of f(x) with less impact to the code.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v2: New patch

 sound/soc/soc-core.c |   52 ++++++++++++++++++++++++++++---------------------
 1 files changed, 30 insertions(+), 22 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index f60e04f..d2f9df5 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -764,10 +764,11 @@ static int soc_bind_dai_link(struct snd_soc_card *card, int num)
 	}
 	/* no, then find CPU DAI from registered DAIs*/
 	list_for_each_entry(cpu_dai, &dai_list, list) {
-		if (!strcmp(cpu_dai->name, dai_link->cpu_dai_name)) {
-			rtd->cpu_dai = cpu_dai;
-			goto find_codec;
-		}
+		if (strcmp(cpu_dai->name, dai_link->cpu_dai_name))
+			continue;
+
+		rtd->cpu_dai = cpu_dai;
+		goto find_codec;
 	}
 	dev_dbg(card->dev, "CPU DAI %s not registered\n",
 			dai_link->cpu_dai_name);
@@ -780,22 +781,28 @@ find_codec:
 
 	/* no, then find CODEC from registered CODECs*/
 	list_for_each_entry(codec, &codec_list, list) {
-		if (!strcmp(codec->name, dai_link->codec_name)) {
-			rtd->codec = codec;
-
-			/* CODEC found, so find CODEC DAI from registered DAIs from this CODEC*/
-			list_for_each_entry(codec_dai, &dai_list, list) {
-				if (codec->dev == codec_dai->dev &&
-						!strcmp(codec_dai->name, dai_link->codec_dai_name)) {
-					rtd->codec_dai = codec_dai;
-					goto find_platform;
-				}
-			}
-			dev_dbg(card->dev, "CODEC DAI %s not registered\n",
-					dai_link->codec_dai_name);
+		if (strcmp(codec->name, dai_link->codec_name))
+			continue;
+
+		rtd->codec = codec;
 
-			goto find_platform;
+		/*
+		 * CODEC found, so find CODEC DAI from registered DAIs from
+		 * this CODEC
+		 */
+		list_for_each_entry(codec_dai, &dai_list, list) {
+			if (codec->dev == codec_dai->dev &&
+				!strcmp(codec_dai->name,
+					dai_link->codec_dai_name)) {
+
+				rtd->codec_dai = codec_dai;
+				goto find_platform;
+			}
 		}
+		dev_dbg(card->dev, "CODEC DAI %s not registered\n",
+				dai_link->codec_dai_name);
+
+		goto find_platform;
 	}
 	dev_dbg(card->dev, "CODEC %s not registered\n",
 			dai_link->codec_name);
@@ -812,10 +819,11 @@ find_platform:
 
 	/* no, then find one from the set of registered platforms */
 	list_for_each_entry(platform, &platform_list, list) {
-		if (!strcmp(platform->name, platform_name)) {
-			rtd->platform = platform;
-			goto out;
-		}
+		if (strcmp(platform->name, platform_name))
+			continue;
+
+		rtd->platform = platform;
+		goto out;
 	}
 
 	dev_dbg(card->dev, "platform %s not registered\n",
-- 
1.7.0.4
