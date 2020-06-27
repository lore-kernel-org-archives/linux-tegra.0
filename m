From: Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v4 15/23] ASoC: soc-core: Identify 'no_pcm' DAI links for DPCM
Date: Sat, 27 Jun 2020 10:23:37 +0530
Message-ID: <1593233625-14961-16-git-send-email-spujar@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, kuninori.morimoto.gx@renesas.com, robh+dt@kernel.org, lgirdwood@gmail.com
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, sharadg@nvidia.com, mkumard@nvidia.com, viswanathl@nvidia.com, rlokhande@nvidia.com, dramesh@nvidia.com, atalambedu@nvidia.com, nwartikar@nvidia.com, swarren@nvidia.com, nicoleotsuka@gmail.com, Sameer Pujar <spujar@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

PCM devices are created for dai links with 'no-pcm' flag as '0'.
Such DAI links have CPU component which implement pcm_construct()
and pcm_destruct() callbacks. Based on this, current patch exposes
a helper function to identify such components and populate 'no_pcm'
flag for DPCM DAI link.

This helps to have BE<->BE component links where PCM devices need
not be created for CPU components involved in the links.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 include/sound/soc.h             |  2 ++
 sound/soc/generic/simple-card.c |  3 +++
 sound/soc/soc-core.c            | 25 +++++++++++++++++++++++++
 3 files changed, 30 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 33acead..1e0376f 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -397,6 +397,7 @@ struct snd_soc_dai_driver;
 struct snd_soc_dai_link;
 struct snd_soc_component;
 struct snd_soc_component_driver;
+struct snd_soc_dai_link_component;
 struct soc_enum;
 struct snd_soc_jack;
 struct snd_soc_jack_zone;
@@ -437,6 +438,7 @@ int snd_soc_add_component(struct device *dev,
 		const struct snd_soc_component_driver *component_driver,
 		struct snd_soc_dai_driver *dai_drv,
 		int num_dai);
+bool soc_component_is_pcm(struct snd_soc_dai_link_component *dlc);
 int snd_soc_register_component(struct device *dev,
 			 const struct snd_soc_component_driver *component_driver,
 			 struct snd_soc_dai_driver *dai_drv, int num_dai);
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 62f2978..f19030b 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -188,6 +188,9 @@ static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 		if (ret)
 			goto out_put_node;
 
+		if (!soc_component_is_pcm(cpus))
+			dai_link->no_pcm = 1;
+
 		ret = asoc_simple_parse_clk_cpu(dev, np, dai_link, dai);
 		if (ret < 0)
 			goto out_put_node;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 9041a03..d2a47c3 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -259,6 +259,31 @@ static inline void snd_soc_debugfs_exit(void)
 
 #endif
 
+bool soc_component_is_pcm(struct snd_soc_dai_link_component *dlc)
+{
+	struct snd_soc_component *component;
+	struct snd_soc_dai *dai;
+
+	for_each_component(component) {
+		if (!component->driver)
+			continue;
+
+		for_each_component_dais(component, dai) {
+			if (!dai->name || !dlc->dai_name)
+				continue;
+
+			if (strcmp(dai->name, dlc->dai_name))
+				continue;
+
+			if (component->driver->pcm_construct)
+				return true;
+		}
+	}
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(soc_component_is_pcm);
+
 static int snd_soc_rtd_add_component(struct snd_soc_pcm_runtime *rtd,
 				     struct snd_soc_component *component)
 {
-- 
2.7.4
