From: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 2/2] ARM: tegra: Enable the mic-detect gpio on Acer Chromebook 13
Date: Thu,  2 Oct 2014 09:43:32 -0700
Message-ID: <1412268212-3458-1-git-send-email-dgreid@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Enables the gpio-base mic detection on the Acer Chromebook 13.  This
gpio is set by the jack-detection chip when it notices either of the
TRRS type headsets with a microphone.

Signed-off-by: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 arch/arm/boot/dts/tegra124-nyan-big.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124-nyan-big.dts b/arch/arm/boot/dts/tegra124-nyan-big.dts
index 7d0784c..1c68ff9 100644
--- a/arch/arm/boot/dts/tegra124-nyan-big.dts
+++ b/arch/arm/boot/dts/tegra124-nyan-big.dts
@@ -1130,6 +1130,8 @@
 		clock-names = "pll_a", "pll_a_out0", "mclk";
 
 		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(I, 7) GPIO_ACTIVE_HIGH>;
+		nvidia,mic-det-gpios =
+				<&gpio TEGRA_GPIO(R, 7) GPIO_ACTIVE_HIGH>;
 	};
 };
 
-- 
2.1.2.330.g565301e
