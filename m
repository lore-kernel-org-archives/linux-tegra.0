From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] ASoC: core: Fix deferral of machine drivers
Date: Tue, 8 Jan 2019 17:28:14 +0000
Message-ID: <1546968494-22993-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Marcel Ziswiler <marcel@ziswiler.com>, Matthias Reichl <hias@horus.com>, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Commit daecf46ee0e5 ("ASoC: soc-core: use snd_soc_dai_link_component for
platform") added a new member to the snd_soc_dai_link structure for
storing a pointer for a platform link component. The pointer for this
platform link component was allocated, if not already populated by the
machine driver, using devm_kzalloc() such that the memory would be
automatically freed on error or removal of the soundcard. However, this
introduced a new problem, because if the probing of the soundcard is
deferred, then although the memory allocated for the platform link
component is freed, if the snd_soc_dai_link structure is declared
statically by the machine driver, then the pointer in the DAI link
structure will never be clearer. This means that when the soundcard is
probed again, memory for the platform link component will not be
allocated again because the address of the pointer was not cleared
and this causes sound core to access memory that is no longer valid.

In most cases this causes the following error condition to be triggered
and causes probing the soundcard to fail.

 tegra-snd-sgtl5000 sound: ASoC: Both platform name/of_node are set for
  sgtl5000

Unfortunately, because this platform link component is allocated before
the DAI links are added to the soundcard, there is no easy way to clear
this pointer on teardown if an error occurs.

The pointer for this platform link component was added for future
proofing and communalising the structures for storing various data.
Although a machine driver maybe used by more than one platform and so
this platform data may vary from platform to platform, there is only
ever a single instance for a given platform. Therefore, rather than
dynamically allocate the platform link component structure, make it a
static member of the snd_soc_dai_link to fix the problem.

It should be noted that if the platform_name of platform_of_node members
of the snd_soc_dai_link structure are populated, these will always be
used regardless of if the new platform.name or platform.of_node members
are populated.

Fixes: daecf46ee0e5 ("ASoC: soc-core: use snd_soc_dai_link_component for platform")

Reported-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 include/sound/simple_card_utils.h     |  2 +-
 include/sound/soc.h                   |  2 +-
 sound/soc/generic/audio-graph-card.c  |  4 +++-
 sound/soc/generic/simple-card-utils.c |  4 ++--
 sound/soc/generic/simple-card.c       |  6 ++++--
 sound/soc/soc-core.c                  | 18 +++++++-----------
 6 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 6d69ed2bd7b1..6d5842c3c09f 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -75,7 +75,7 @@ void asoc_simple_card_clk_disable(struct asoc_simple_dai *dai);
 				   &dai_link->codec_dai_name,			\
 				   list_name, cells_name, NULL)
 #define asoc_simple_card_parse_platform(node, dai_link, list_name, cells_name)	\
-	asoc_simple_card_parse_dai(node, dai_link->platform,					\
+	asoc_simple_card_parse_dai(node, &dai_link->platform,			\
 		&dai_link->platform_of_node,					\
 		NULL, list_name, cells_name, NULL)
 int asoc_simple_card_parse_dai(struct device_node *node,
diff --git a/include/sound/soc.h b/include/sound/soc.h
index 8ec1de856ee7..8b7ffc60006a 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -925,7 +925,7 @@ struct snd_soc_dai_link {
 	 */
 	const char *platform_name;
 	struct device_node *platform_of_node;
-	struct snd_soc_dai_link_component *platform;
+	struct snd_soc_dai_link_component platform;
 
 	int id;	/* optional ID for machine driver link identification */
 
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 3ec96cdc683b..e961d45ce141 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -687,7 +687,9 @@ static int graph_probe(struct platform_device *pdev)
 	for (i = 0; i < li.link; i++) {
 		dai_link[i].codecs	= &dai_props[i].codecs;
 		dai_link[i].num_codecs	= 1;
-		dai_link[i].platform	= &dai_props[i].platform;
+		dai_link[i].platform.name = dai_props[i].platform.name;
+		dai_link[i].platform.of_node = dai_props[i].platform.of_node;
+		dai_link[i].platform.dai_name = dai_props[i].platform.dai_name;
 	}
 
 	priv->pa_gpio = devm_gpiod_get_optional(dev, "pa", GPIOD_OUT_LOW);
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 336895f7fd1e..74910c7841ec 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -397,8 +397,8 @@ EXPORT_SYMBOL_GPL(asoc_simple_card_init_dai);
 int asoc_simple_card_canonicalize_dailink(struct snd_soc_dai_link *dai_link)
 {
 	/* Assumes platform == cpu */
-	if (!dai_link->platform->of_node)
-		dai_link->platform->of_node = dai_link->cpu_of_node;
+	if (!dai_link->platform.of_node)
+		dai_link->platform.of_node = dai_link->cpu_of_node;
 
 	return 0;
 
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 479de236e694..b6402e09bba2 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -732,7 +732,9 @@ static int simple_probe(struct platform_device *pdev)
 	for (i = 0; i < li.link; i++) {
 		dai_link[i].codecs	= &dai_props[i].codecs;
 		dai_link[i].num_codecs	= 1;
-		dai_link[i].platform	= &dai_props[i].platform;
+		dai_link[i].platform.name = dai_props[i].platform.name;
+		dai_link[i].platform.of_node = dai_props[i].platform.of_node;
+		dai_link[i].platform.dai_name = dai_props[i].platform.dai_name;
 	}
 
 	priv->dai_props		= dai_props;
@@ -782,7 +784,7 @@ static int simple_probe(struct platform_device *pdev)
 		codecs->name		= cinfo->codec;
 		codecs->dai_name	= cinfo->codec_dai.name;
 
-		platform		= dai_link->platform;
+		platform		= &dai_link->platform;
 		platform->name		= cinfo->platform;
 
 		card->name		= (cinfo->card) ? cinfo->card : cinfo->name;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 0462b3ec977a..466099995e44 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -915,7 +915,7 @@ static int soc_bind_dai_link(struct snd_soc_card *card,
 
 	/* find one from the set of registered platforms */
 	for_each_component(component) {
-		if (!snd_soc_is_matching_component(dai_link->platform,
+		if (!snd_soc_is_matching_component(&dai_link->platform,
 						   component))
 			continue;
 
@@ -1026,7 +1026,7 @@ static void soc_remove_dai_links(struct snd_soc_card *card)
 static int snd_soc_init_platform(struct snd_soc_card *card,
 				 struct snd_soc_dai_link *dai_link)
 {
-	struct snd_soc_dai_link_component *platform = dai_link->platform;
+	struct snd_soc_dai_link_component *platform = &dai_link->platform;
 
 	/*
 	 * FIXME
@@ -1034,14 +1034,10 @@ static int snd_soc_init_platform(struct snd_soc_card *card,
 	 * this function should be removed in the future
 	 */
 	/* convert Legacy platform link */
-	if (!platform) {
-		platform = devm_kzalloc(card->dev,
-				sizeof(struct snd_soc_dai_link_component),
-				GFP_KERNEL);
-		if (!platform)
-			return -ENOMEM;
+	if (dai_link->platform_name || dai_link->platform_of_node) {
+		dev_dbg(card->dev,
+			"ASoC: Defaulting to legacy platform data!\n");
 
-		dai_link->platform	= platform;
 		platform->name		= dai_link->platform_name;
 		platform->of_node	= dai_link->platform_of_node;
 		platform->dai_name	= NULL;
@@ -1123,7 +1119,7 @@ static int soc_init_dai_link(struct snd_soc_card *card,
 	 * Platform may be specified by either name or OF node, but
 	 * can be left unspecified, and a dummy platform will be used.
 	 */
-	if (link->platform->name && link->platform->of_node) {
+	if (link->platform.name && link->platform.of_node) {
 		dev_err(card->dev,
 			"ASoC: Both platform name/of_node are set for %s\n",
 			link->name);
@@ -1921,7 +1917,7 @@ static void soc_check_tplg_fes(struct snd_soc_card *card)
 				dev_err(card->dev, "init platform error");
 				continue;
 			}
-			dai_link->platform->name = component->name;
+			dai_link->platform.name = component->name;
 
 			/* convert non BE into BE */
 			dai_link->no_pcm = 1;
-- 
2.7.4
