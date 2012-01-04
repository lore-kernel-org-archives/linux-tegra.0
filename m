From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/6] ARM: dt: tegra30.dtsi: Reformat gpio's interrupts property
Date: Wed,  4 Jan 2012 11:39:35 -0700
Message-ID: <1325702378-20863-3-git-send-email-swarren@nvidia.com>
References: <1325702378-20863-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1325702378-20863-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The new content matches tegra20.dtsi, and is < 80 columns.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra30.dtsi |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index ee7db98..e5d1406 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -55,7 +55,13 @@
 	gpio: gpio@6000d000 {
 		compatible = "nvidia,tegra30-gpio", "nvidia,tegra20-gpio";
 		reg = < 0x6000d000 0x1000 >;
-		interrupts = < 0 32 0x04 0 33 0x04 0 34 0x04 0 35 0x04 0 55 0x04 0 87 0x04 0 89 0x04 >;
+		interrupts = < 0 32 0x04
+			       0 33 0x04
+			       0 34 0x04
+			       0 35 0x04
+			       0 55 0x04
+			       0 87 0x04
+			       0 89 0x04 >;
 		#gpio-cells = <2>;
 		gpio-controller;
 	};
-- 
1.7.0.4
