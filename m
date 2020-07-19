From: Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH 01/10] ASoC: soc-core: Fix component name_prefix parsing
Date: Sun, 19 Jul 2020 10:40:08 +0530
Message-ID: <1595135417-16589-2-git-send-email-spujar@nvidia.com>
References: <1595135417-16589-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1595135417-16589-1-git-send-email-spujar@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, kuninori.morimoto.gx@renesas.com, robh+dt@kernel.org, lgirdwood@gmail.com
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, sharadg@nvidia.com, mkumard@nvidia.com, viswanathl@nvidia.com, rlokhande@nvidia.com, dramesh@nvidia.com, atalambedu@nvidia.com, nwartikar@nvidia.com, swarren@nvidia.com, nicoleotsuka@gmail.com, Sameer Pujar <spujar@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The "prefix" can be defined in DAI link node or it can be specified as
part of the component node itself. Currently "sound-name-prefix" defined
in a component is not taking effect. Actually the property is not getting
parsed. It can be fixed by parsing "sound-name-prefix" property whenever
"prefix" is missing in DAI link Codec node.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/soc-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 7c58e45..a4efcbe 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1110,7 +1110,8 @@ static void soc_set_name_prefix(struct snd_soc_card *card,
 	for (i = 0; i < card->num_configs; i++) {
 		struct snd_soc_codec_conf *map = &card->codec_conf[i];
 
-		if (snd_soc_is_matching_component(&map->dlc, component)) {
+		if (snd_soc_is_matching_component(&map->dlc, component) &&
+		    map->name_prefix) {
 			component->name_prefix = map->name_prefix;
 			return;
 		}
-- 
2.7.4
