From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/3] arm64: tegra: Populate VBUS for USB3 on Jetson TX2
Date: Sun, 12 Jul 2020 11:25:06 +0100
Message-ID: <20200712102506.23686-4-jonathanh@nvidia.com>
References: <20200712102506.23686-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200712102506.23686-1-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The VBUS for USB3 connector on the Jetson TX2 is connected to the
vdd_usb1 supply and although this is populated for the USB2 port
on the USB3 connector it is not populated for the USB3 port and
causes the following warning to be seen on boot ...

 usb3-0: supply vbus not found, using dummy regulator

Fix this by also adding the VBUS supply to the USB3 port.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index a70fd4e86840..802b8c52489a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -194,6 +194,7 @@
 
 			usb3-0 {
 				nvidia,usb2-companion = <1>;
+				vbus-supply = <&vdd_usb1>;
 				status = "okay";
 			};
 		};
-- 
2.17.1
