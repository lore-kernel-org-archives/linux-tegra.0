From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 7/8] arm/dt: tegra: Add labels for I2S controllers
Date: Wed,  7 Dec 2011 15:13:52 -0700
Message-ID: <1323296033-28730-14-git-send-email-swarren@nvidia.com>
References: <1323296033-28730-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1323296033-28730-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This will allow the sound node to refer to the I2S controllers by name
when creating phandles.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra20.dtsi |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 7b44807..4af5cd2 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -65,14 +65,14 @@
 		interrupts = < 0 53 0x04 >;
 	};
 
-	i2s@70002800 {
+	tegra_i2s1: i2s@70002800 {
 		compatible = "nvidia,tegra20-i2s";
 		reg = <0x70002800 0x200>;
 		interrupts = < 0 13 0x04 >;
 		nvidia,dma-request-selector = < &apbdma 2 >;
 	};
 
-	i2s@70002a00 {
+	tegra_i2s2: i2s@70002a00 {
 		compatible = "nvidia,tegra20-i2s";
 		reg = <0x70002a00 0x200>;
 		interrupts = < 0 3 0x04 >;
-- 
1.7.0.4
