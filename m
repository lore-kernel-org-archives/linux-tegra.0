From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 1/2] ASoC: tegra: add Tegra114 support to the AHUB driver
Date: Thu, 21 Mar 2013 13:56:41 -0600
Message-ID: <1363895802-20484-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Tegra114's AHUB shares a design with Tegra30, with the followin changes:
* Supports more (10 vs. 4) bi-directional FIFO channels into RAM.
* Requires a separate block of registers to support the above.
* Supports more attached clients, i.e. new audio multiplexing and
  de-multiplexing modules.
* Is affected by more clocks due to the above.

This change fully defines the device tree binding changes required to
represent these changes, and minimally extends the driver to support
the new hardware, without exposing any of the new FIFO channels.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../bindings/sound/nvidia,tegra30-ahub.txt         |   26 ++++++--
 sound/soc/tegra/tegra30_ahub.c                     |   64 ++++++++++++++------
 sound/soc/tegra/tegra30_ahub.h                     |   16 +++++
 3 files changed, 84 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.txt
index 1ac7b16..0e5c12c 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.txt
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-ahub.txt
@@ -1,12 +1,22 @@
 NVIDIA Tegra30 AHUB (Audio Hub)
 
 Required properties:
-- compatible : "nvidia,tegra30-ahub"
+- compatible : "nvidia,tegra30-ahub", "nvidia,tegra114-ahub", etc.
 - reg : Should contain the register physical address and length for each of
-  the AHUB's APBIF registers and the AHUB's own registers.
+  the AHUB's register blocks.
+  - Tegra30 requires 2 entries, for the APBIF and AHUB/AUDIO register blocks.
+  - Tegra114 requires an additional entry, for the APBIF2 register block.
 - interrupts : Should contain AHUB interrupt
-- nvidia,dma-request-selector : The Tegra DMA controller's phandle and
-  request selector for the first APBIF channel.
+- nvidia,dma-request-selector : A list of the DMA channel specifiers. Each
+  entry contains the Tegra DMA controller's phandle and request selector.
+  If a single entry is present, the request selectors for the channels are
+  assumed to be contiguous, and increment from this value.
+  If multiple values are given, one value must be given per channel.
+- clocks : Must contain an entry for each required entry in clock-names.
+- clock-names : Must include the following entries:
+  - Tegra30: Requires d_audio, apbif, i2s0, i2s1, i2s2, i2s3, i2s4, dam0,
+    dam1, dam2, spdif_in.
+  - Tegra114: Additionally requires amx, adx.
 - ranges : The bus address mapping for the configlink register bus.
   Can be empty since the mapping is 1:1.
 - #address-cells : For the configlink bus. Should be <1>;
@@ -25,7 +35,13 @@ ahub@70080000 {
 	reg = <0x70080000 0x200 0x70080200 0x100>;
 	interrupts = < 0 103 0x04 >;
 	nvidia,dma-request-selector = <&apbdma 1>;
-
+	clocks = <&tegra_car 106>, <&tegra_car 107>, <&tegra_car 30>,
+		<&tegra_car 11>, <&tegra_car 18>, <&tegra_car 101>,
+		<&tegra_car 102>, <&tegra_car 108>, <&tegra_car 109>,
+		<&tegra_car 110>, <&tegra_car 162>;
+	clock-names = "d_audio", "apbif", "i2s0", "i2s1", "i2s2",
+		"i2s3", "i2s4", "dam0", "dam1", "dam2",
+		"spdif_in";
 	ranges;
 	#address-cells = <1>;
 	#size-cells = <1>;
diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index e5cfb4a..4405c3a 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -287,16 +287,27 @@ int tegra30_ahub_unset_rx_cif_source(enum tegra30_ahub_rxcif rxcif)
 }
 EXPORT_SYMBOL_GPL(tegra30_ahub_unset_rx_cif_source);
 
-static const char * const configlink_clocks[] = {
-	"i2s0",
-	"i2s1",
-	"i2s2",
-	"i2s3",
-	"i2s4",
-	"dam0",
-	"dam1",
-	"dam2",
-	"spdif_in",
+#define CLK_LIST_MASK_TEGRA30	BIT(0)
+#define CLK_LIST_MASK_TEGRA114	BIT(1)
+
+#define CLK_LIST_MASK_TEGRA30_OR_LATER \
+		(CLK_LIST_MASK_TEGRA30 | CLK_LIST_MASK_TEGRA114)
+
+static const struct {
+	const char *clk_name;
+	u32 clk_list_mask;
+} configlink_clocks[] = {
+	{ "i2s0", CLK_LIST_MASK_TEGRA30_OR_LATER },
+	{ "i2s1", CLK_LIST_MASK_TEGRA30_OR_LATER },
+	{ "i2s2", CLK_LIST_MASK_TEGRA30_OR_LATER },
+	{ "i2s3", CLK_LIST_MASK_TEGRA30_OR_LATER },
+	{ "i2s4", CLK_LIST_MASK_TEGRA30_OR_LATER },
+	{ "dam0", CLK_LIST_MASK_TEGRA30_OR_LATER },
+	{ "dam1", CLK_LIST_MASK_TEGRA30_OR_LATER },
+	{ "dam2", CLK_LIST_MASK_TEGRA30_OR_LATER },
+	{ "spdif_in", CLK_LIST_MASK_TEGRA30_OR_LATER },
+	{ "amx", CLK_LIST_MASK_TEGRA114 },
+	{ "adx", CLK_LIST_MASK_TEGRA114 },
 };
 
 #define LAST_REG(name) \
@@ -424,8 +435,24 @@ static const struct regmap_config tegra30_ahub_ahub_regmap_config = {
 	.cache_type = REGCACHE_RBTREE,
 };
 
+static struct tegra30_ahub_soc_data soc_data_tegra30 = {
+	.clk_list_mask = CLK_LIST_MASK_TEGRA30,
+};
+
+static struct tegra30_ahub_soc_data soc_data_tegra114 = {
+	.clk_list_mask = CLK_LIST_MASK_TEGRA114,
+};
+
+static const struct of_device_id tegra30_ahub_of_match[] = {
+	{ .compatible = "nvidia,tegra114-ahub", .data = &soc_data_tegra114 },
+	{ .compatible = "nvidia,tegra30-ahub",  .data = &soc_data_tegra30 },
+	{},
+};
+
 static int tegra30_ahub_probe(struct platform_device *pdev)
 {
+	const struct of_device_id *match;
+	const struct tegra30_ahub_soc_data *soc_data;
 	struct clk *clk;
 	int i;
 	struct resource *res0, *res1, *region;
@@ -436,16 +463,24 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 	if (ahub)
 		return -ENODEV;
 
+	match = of_match_device(tegra30_ahub_of_match, &pdev->dev);
+	if (!match)
+		return -EINVAL;
+	soc_data = match->data;
+
 	/*
 	 * The AHUB hosts a register bus: the "configlink". For this to
 	 * operate correctly, all devices on this bus must be out of reset.
 	 * Ensure that here.
 	 */
 	for (i = 0; i < ARRAY_SIZE(configlink_clocks); i++) {
-		clk = clk_get(&pdev->dev, configlink_clocks[i]);
+		if (!(configlink_clocks[i].clk_list_mask &
+					soc_data->clk_list_mask))
+			continue;
+		clk = clk_get(&pdev->dev, configlink_clocks[i].clk_name);
 		if (IS_ERR(clk)) {
 			dev_err(&pdev->dev, "Can't get clock %s\n",
-				configlink_clocks[i]);
+				configlink_clocks[i].clk_name);
 			ret = PTR_ERR(clk);
 			goto err;
 		}
@@ -592,11 +627,6 @@ static int tegra30_ahub_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id tegra30_ahub_of_match[] = {
-	{ .compatible = "nvidia,tegra30-ahub", },
-	{},
-};
-
 static const struct dev_pm_ops tegra30_ahub_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra30_ahub_runtime_suspend,
 			   tegra30_ahub_runtime_resume, NULL)
diff --git a/sound/soc/tegra/tegra30_ahub.h b/sound/soc/tegra/tegra30_ahub.h
index e690e2e..7189be9 100644
--- a/sound/soc/tegra/tegra30_ahub.h
+++ b/sound/soc/tegra/tegra30_ahub.h
@@ -468,7 +468,23 @@ extern int tegra30_ahub_set_rx_cif_source(enum tegra30_ahub_rxcif rxcif,
 					  enum tegra30_ahub_txcif txcif);
 extern int tegra30_ahub_unset_rx_cif_source(enum tegra30_ahub_rxcif rxcif);
 
+struct tegra30_ahub_soc_data {
+	u32 clk_list_mask;
+	/*
+	 * FIXME: There are many more differences in HW, such as:
+	 * - More APBIF channels.
+	 * - Extra separate chunks of register address space to represent
+	 *   the extra APBIF channels.
+	 * - More units connected to the AHUB, so that tegra30_ahub_[rt]xcif
+	 *   need expansion, coupled with there being more defined bits in
+	 *   the AHUB routing registers.
+	 * However, the driver doesn't support those new features yet, so we
+	 * don't represent them here yet.
+	 */
+};
+
 struct tegra30_ahub {
+	const struct tegra30_ahub_soc_data *soc_data;
 	struct device *dev;
 	struct clk *clk_d_audio;
 	struct clk *clk_apbif;
-- 
1.7.10.4
