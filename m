From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ASoC: tegra: update module reset list for Tegra124
Date: Wed,  4 Dec 2013 15:25:13 -0700
Message-ID: <1386195913-24213-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Tegra124 adds a number of extra modules into the configlink bus, which
must be taken out of reset before the bus is used. Update the AHUB
driver to know about these extra modules (the AHUB HW module hosts the
configlink bus).

Based-on-work-by: Arun Shamanna Lakshmi <aruns-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Based-on-work-by: Songhee Baek <sbaek-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
This patch depends on "ASoC: tegra: use reset framework" to compile,
which is ack'd and slated to go through a (large) topic branch in the
Tegra tree. So, we can either:

a) Merge that Tegra topic branch into the ASoC tree, then apply this.
   Note that I haven't created the topic branch yet, since I'm still
   waiting for DMA dependencies to be applied.

b) Apply this change to the Tegra tree too. This change isn't directly
   related to the changes in the Tegra tree; it just makes use of the new
   reset controller feature that's introduced there.

 .../bindings/sound/nvidia,tegra30-ahub.txt           |  9 +++++++++
 sound/soc/tegra/tegra30_ahub.c                       | 20 ++++++++++++++++----
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.txt
index 32de7ec789aa..946e2ac46091 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.txt
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.txt
@@ -30,6 +30,15 @@ Required properties:
   Tegra114 and later additionally require:
   - amx
   - adx
+  Tegra124 and later additionally require:
+  - amx1
+  - adx1
+  - afc0
+  - afc1
+  - afc2
+  - afc3
+  - afc4
+  - afc5
 - ranges : The bus address mapping for the configlink register bus.
   Can be empty since the mapping is 1:1.
 - dmas : Must contain an entry for each entry in clock-names.
diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index 342cd4fff0a5..d6f4c9940e0c 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -335,9 +335,13 @@ EXPORT_SYMBOL_GPL(tegra30_ahub_unset_rx_cif_source);
 
 #define MOD_LIST_MASK_TEGRA30	BIT(0)
 #define MOD_LIST_MASK_TEGRA114	BIT(1)
+#define MOD_LIST_MASK_TEGRA124	BIT(2)
 
 #define MOD_LIST_MASK_TEGRA30_OR_LATER \
-		(MOD_LIST_MASK_TEGRA30 | MOD_LIST_MASK_TEGRA114)
+		(MOD_LIST_MASK_TEGRA30 | MOD_LIST_MASK_TEGRA114 | \
+			MOD_LIST_MASK_TEGRA124)
+#define MOD_LIST_MASK_TEGRA114_OR_LATER \
+		(MOD_LIST_MASK_TEGRA114 | MOD_LIST_MASK_TEGRA124)
 
 static const struct {
 	const char *rst_name;
@@ -352,8 +356,16 @@ static const struct {
 	{ "dam1", MOD_LIST_MASK_TEGRA30_OR_LATER },
 	{ "dam2", MOD_LIST_MASK_TEGRA30_OR_LATER },
 	{ "spdif", MOD_LIST_MASK_TEGRA30_OR_LATER },
-	{ "amx", MOD_LIST_MASK_TEGRA114 },
-	{ "adx", MOD_LIST_MASK_TEGRA114 },
+	{ "amx", MOD_LIST_MASK_TEGRA114_OR_LATER },
+	{ "adx", MOD_LIST_MASK_TEGRA114_OR_LATER },
+	{ "amx1", MOD_LIST_MASK_TEGRA124 },
+	{ "adx1", MOD_LIST_MASK_TEGRA124 },
+	{ "afc0", MOD_LIST_MASK_TEGRA124 },
+	{ "afc1", MOD_LIST_MASK_TEGRA124 },
+	{ "afc2", MOD_LIST_MASK_TEGRA124 },
+	{ "afc3", MOD_LIST_MASK_TEGRA124 },
+	{ "afc4", MOD_LIST_MASK_TEGRA124 },
+	{ "afc5", MOD_LIST_MASK_TEGRA124 },
 };
 
 #define LAST_REG(name) \
@@ -492,7 +504,7 @@ static struct tegra30_ahub_soc_data soc_data_tegra114 = {
 };
 
 static struct tegra30_ahub_soc_data soc_data_tegra124 = {
-	.mod_list_mask = MOD_LIST_MASK_TEGRA114,
+	.mod_list_mask = MOD_LIST_MASK_TEGRA124,
 	.set_audio_cif = tegra124_ahub_set_cif,
 };
 
-- 
1.8.1.5
