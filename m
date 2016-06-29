From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/3] arm64: tegra: Correct Tegra210 XUSB mailbox interrupt
Date: Wed, 29 Jun 2016 12:07:33 +0100
Message-ID: <1467198453-23406-4-git-send-email-jonathanh@nvidia.com>
References: <1467198453-23406-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467198453-23406-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The XUSB mailbox interrupt for Tegra210 is 40 and not 49 which is for
the XUSB pad controller. For some Tegra210 boards, this is causing USB
connect and disconnect events to go undetected. Fix this by changing the
interrupt number for the XUSB mailbox to 40.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index efb0fd98b789..6bc60ea95d16 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -740,7 +740,7 @@
 		reg-names = "hcd", "fpci", "ipfs";
 
 		interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+			     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
 
 		clocks = <&tegra_car TEGRA210_CLK_XUSB_HOST>,
 			 <&tegra_car TEGRA210_CLK_XUSB_HOST_SRC>,
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
