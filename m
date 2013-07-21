From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: [PATCH 1/4] ASOC: tegra: move AC97 clock defines to the controller node
Date: Sun, 21 Jul 2013 23:28:49 +0200
Message-ID: <1374442132-24040-2-git-send-email-dev@lynxeye.de>
References: <1374442132-24040-1-git-send-email-dev@lynxeye.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374442132-24040-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Different from other Tegra sound controllers drivers, the AC97
controller driver uses the tegra asoc utils directly to request the
needed clocks, as they are needed at AC97 init time. Move the DT clock
defines to the right place.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
CC: <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>
CC: <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/tegra20-colibri-512.dtsi | 5 -----
 arch/arm/boot/dts/tegra20.dtsi             | 6 +++++-
 sound/soc/tegra/tegra20_ac97.c             | 2 +-
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-colibri-512.dtsi b/arch/arm/boot/dts/tegra20-colibri-512.dtsi
index 2fcb3f2..fbb52e0 100644
--- a/arch/arm/boot/dts/tegra20-colibri-512.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri-512.dtsi
@@ -491,11 +491,6 @@
 			"Mic", "MIC1";
 
 		nvidia,ac97-controller = <&ac97>;
-
-		clocks = <&tegra_car TEGRA20_CLK_PLL_A>,
-			 <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
-			 <&tegra_car TEGRA20_CLK_CDEV1>;
-		clock-names = "pll_a", "pll_a_out0", "mclk";
 	};
 
 	regulators {
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 9653fd8..ad13f57 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -223,7 +223,11 @@
 		reg = <0x70002000 0x200>;
 		interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
 		nvidia,dma-request-selector = <&apbdma 12>;
-		clocks = <&tegra_car TEGRA20_CLK_AC97>;
+		clocks = <&tegra_car TEGRA20_CLK_PLL_A>,
+			 <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
+			 <&tegra_car TEGRA20_CLK_CDEV1>,
+			 <&tegra_car TEGRA20_CLK_AC97>;
+		clock-names = "pll_a", "pll_a_out0", "mclk", "ac97";
 		status = "disabled";
 	};
 
diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index 6c48662..6bbffd1 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -326,7 +326,7 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 	}
 	dev_set_drvdata(&pdev->dev, ac97);
 
-	ac97->clk_ac97 = devm_clk_get(&pdev->dev, NULL);
+	ac97->clk_ac97 = devm_clk_get(&pdev->dev, "ac97");
 	if (IS_ERR(ac97->clk_ac97)) {
 		dev_err(&pdev->dev, "Can't retrieve ac97 clock\n");
 		ret = PTR_ERR(ac97->clk_ac97);
-- 
1.8.3.1
