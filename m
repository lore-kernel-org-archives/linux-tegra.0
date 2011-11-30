From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V3] ASoC: Tegra I2S: Add device tree binding
Date: Tue, 29 Nov 2011 18:36:48 -0700
Message-ID: <1322617008-32055-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v3: Fix compile warning; s/&of_dma/of_dma/.
v2:
* Modified binding to include the DMA controller's phandle. This value
  isn't used by the driver, but is useful to correctly represent the HW.
* Renamed dma-channel property to dma-request-selector to better match
  what it describes. Added missing "nvidia," prefix to it.

 .../devicetree/bindings/sound/tegra20-i2s.txt      |   17 ++++++++++++
 sound/soc/tegra/tegra_i2s.c                        |   27 ++++++++++++++++---
 2 files changed, 39 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/tegra20-i2s.txt

diff --git a/Documentation/devicetree/bindings/sound/tegra20-i2s.txt b/Documentation/devicetree/bindings/sound/tegra20-i2s.txt
new file mode 100644
index 0000000..0df2b5c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/tegra20-i2s.txt
@@ -0,0 +1,17 @@
+NVIDIA Tegra 20 I2S controller
+
+Required properties:
+- compatible : "nvidia,tegra20-i2s"
+- reg : Should contain I2S registers location and length
+- interrupts : Should contain I2S interrupt
+- nvidia,dma-request-selector : The Tegra DMA controller's phandle and
+  request selector for this I2S controller
+
+Example:
+
+i2s@70002800 {
+	compatible = "nvidia,tegra20-i2s";
+	reg = <0x70002800 0x200>;
+	interrupts = < 45 >;
+	nvidia,dma-request-selector = < &apbdma 2 >;
+};
diff --git a/sound/soc/tegra/tegra_i2s.c b/sound/soc/tegra/tegra_i2s.c
index ca4d0c0..33509de 100644
--- a/sound/soc/tegra/tegra_i2s.c
+++ b/sound/soc/tegra/tegra_i2s.c
@@ -36,6 +36,7 @@
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/io.h>
+#include <linux/of.h>
 #include <mach/iomap.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
@@ -331,6 +332,8 @@ static __devinit int tegra_i2s_platform_probe(struct platform_device *pdev)
 {
 	struct tegra_i2s * i2s;
 	struct resource *mem, *memregion, *dmareq;
+	u32 of_dma[2];
+	u32 dma_ch;
 	int ret;
 
 	i2s = devm_kzalloc(&pdev->dev, sizeof(struct tegra_i2s), GFP_KERNEL);
@@ -360,9 +363,16 @@ static __devinit int tegra_i2s_platform_probe(struct platform_device *pdev)
 
 	dmareq = platform_get_resource(pdev, IORESOURCE_DMA, 0);
 	if (!dmareq) {
-		dev_err(&pdev->dev, "No DMA resource\n");
-		ret = -ENODEV;
-		goto err_clk_put;
+		if (of_property_read_u32_array(pdev->dev.of_node,
+					"nvidia,dma-request-selector",
+					of_dma, 2) < 0) {
+			dev_err(&pdev->dev, "No DMA resource\n");
+			ret = -ENODEV;
+			goto err_clk_put;
+		}
+		dma_ch = of_dma[1];
+	} else {
+		dma_ch = dmareq->start;
 	}
 
 	memregion = devm_request_mem_region(&pdev->dev, mem->start,
@@ -383,12 +393,12 @@ static __devinit int tegra_i2s_platform_probe(struct platform_device *pdev)
 	i2s->capture_dma_data.addr = mem->start + TEGRA_I2S_FIFO2;
 	i2s->capture_dma_data.wrap = 4;
 	i2s->capture_dma_data.width = 32;
-	i2s->capture_dma_data.req_sel = dmareq->start;
+	i2s->capture_dma_data.req_sel = dma_ch;
 
 	i2s->playback_dma_data.addr = mem->start + TEGRA_I2S_FIFO1;
 	i2s->playback_dma_data.wrap = 4;
 	i2s->playback_dma_data.width = 32;
-	i2s->playback_dma_data.req_sel = dmareq->start;
+	i2s->playback_dma_data.req_sel = dma_ch;
 
 	i2s->reg_ctrl = TEGRA_I2S_CTRL_FIFO_FORMAT_PACKED;
 
@@ -422,10 +432,16 @@ static int __devexit tegra_i2s_platform_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id tegra_i2s_of_match[] __devinitconst = {
+	{ .compatible = "nvidia,tegra20-i2s", },
+	{},
+};
+
 static struct platform_driver tegra_i2s_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.owner = THIS_MODULE,
+		.of_match_table = tegra_i2s_of_match,
 	},
 	.probe = tegra_i2s_platform_probe,
 	.remove = __devexit_p(tegra_i2s_platform_remove),
@@ -436,3 +452,4 @@ MODULE_AUTHOR("Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
 MODULE_DESCRIPTION("Tegra I2S ASoC driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:" DRV_NAME);
+MODULE_DEVICE_TABLE(of, tegra_i2s_of_match);
-- 
1.7.0.4
