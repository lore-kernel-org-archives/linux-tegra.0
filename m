From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 02/17] arm/dt: Tegra: Clean up I2S and DAS nodes
Date: Tue, 22 Nov 2011 18:21:10 -0700
Message-ID: <1322011285-4002-3-git-send-email-swarren@nvidia.com>
References: <1322011285-4002-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1322011285-4002-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ian Lartey <ian-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Dimitris Papastamos <dp-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The I2S and DAS nodes don't have children, and hence don't need to set
address/size cells. Also, adjust the dma-channel property name to match
the binding that will be implemented in the driver.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra20.dtsi |   10 ++--------
 1 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 795b921..6a17240 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -45,26 +45,20 @@
 	};
 
 	i2s@70002800 {
-		#address-cells = <1>;
-		#size-cells = <0>;
 		compatible = "nvidia,tegra20-i2s";
 		reg = <0x70002800 0x200>;
 		interrupts = < 45 >;
-		dma-channel = < 2 >;
+		nvidia,dma-channels = < 2 >;
 	};
 
 	i2s@70002a00 {
-		#address-cells = <1>;
-		#size-cells = <0>;
 		compatible = "nvidia,tegra20-i2s";
 		reg = <0x70002a00 0x200>;
 		interrupts = < 35 >;
-		dma-channel = < 1 >;
+		nvidia,dma-channels = < 1 >;
 	};
 
 	das@70000c00 {
-		#address-cells = <1>;
-		#size-cells = <0>;
 		compatible = "nvidia,tegra20-das";
 		reg = <0x70000c00 0x80>;
 	};
-- 
1.7.0.4
