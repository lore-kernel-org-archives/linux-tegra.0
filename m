From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 5/8] arm/dt: tegra: Clean up I2S and DAS nodes
Date: Wed,  7 Dec 2011 15:13:48 -0700
Message-ID: <1323296033-28730-10-git-send-email-swarren@nvidia.com>
References: <1323296033-28730-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1323296033-28730-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The I2S and DAS nodes don't have children, and hence don't need to set
address/size cells.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra20.dtsi |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 189c31e..a805ba7 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -66,8 +66,6 @@
 	};
 
 	i2s@70002800 {
-		#address-cells = <1>;
-		#size-cells = <0>;
 		compatible = "nvidia,tegra20-i2s";
 		reg = <0x70002800 0x200>;
 		interrupts = < 0 13 0x04 >;
@@ -75,8 +73,6 @@
 	};
 
 	i2s@70002a00 {
-		#address-cells = <1>;
-		#size-cells = <0>;
 		compatible = "nvidia,tegra20-i2s";
 		reg = <0x70002a00 0x200>;
 		interrupts = < 0 3 0x04 >;
@@ -84,8 +80,6 @@
 	};
 
 	das@70000c00 {
-		#address-cells = <1>;
-		#size-cells = <0>;
 		compatible = "nvidia,tegra20-das";
 		reg = <0x70000c00 0x80>;
 	};
-- 
1.7.0.4
