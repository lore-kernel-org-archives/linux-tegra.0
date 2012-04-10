From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH V2 4/5] ARM: dt: tegra30.dtsi: Add audio-related nodes
Date: Tue, 10 Apr 2012 17:19:39 -0600
Message-ID: <1334099980-19527-4-git-send-email-swarren@wwwdotorg.org>
References: <1334099980-19527-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1334099980-19527-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add nodes for the Tegra30 AHUB and I2S controllers.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v2:
* Move I2S nodes inside AHUB node, since it's the bus that contains them.
* Correct APBIF reg size
* Add nvidia,ahub-cif-ids to I2S nodes
---
 arch/arm/boot/dts/tegra30.dtsi |   41 ++++++++++++++++++++++++++++++++++++++++
 1 files changed, 41 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 62a7b39..98c29d1 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -183,4 +183,45 @@
 		reg = < 0x70000868 0xd0     /* Pad control registers */
 			0x70003000 0x3e0 >; /* Mux registers */
 	};
+
+	ahub@70080000 {
+		compatible = "nvidia,tegra30-ahub";
+		reg = <0x70080000 0x200 0x70080200 0x100>;
+		interrupts = < 0 103 0x04 >;
+		nvidia,dma-request-selector = <&apbdma 1>;
+
+		ranges;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		tegra_i2s0: i2s@70080300 {
+			compatible = "nvidia,tegra30-i2s";
+			reg = <0x70080300 0x100>;
+			nvidia,ahub-cif-ids = <4 4>;
+		};
+
+		tegra_i2s1: i2s@70080400 {
+			compatible = "nvidia,tegra30-i2s";
+			reg = <0x70080400 0x100>;
+			nvidia,ahub-cif-ids = <5 5>;
+		};
+
+		tegra_i2s2: i2s@70080500 {
+			compatible = "nvidia,tegra30-i2s";
+			reg = <0x70080500 0x100>;
+			nvidia,ahub-cif-ids = <6 6>;
+		};
+
+		tegra_i2s3: i2s@70080600 {
+			compatible = "nvidia,tegra30-i2s";
+			reg = <0x70080600 0x100>;
+			nvidia,ahub-cif-ids = <7 7>;
+		};
+
+		tegra_i2s4: i2s@70080700 {
+			compatible = "nvidia,tegra30-i2s";
+			reg = <0x70080700 0x100>;
+			nvidia,ahub-cif-ids = <8 8>;
+		};
+	};
 };
-- 
1.7.0.4
