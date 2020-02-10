From: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [Patch V5 20/21] arm64: tegra: update OTG port entries for jetson-nano
Date: Mon, 10 Feb 2020 13:41:46 +0530
Message-ID: <1581322307-11140-21-git-send-email-nkristam@nvidia.com>
References: <1581322307-11140-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1581322307-11140-1-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add usb-role-switch entry to peripheral usb port and add corresponding
connector details.

Signed-off-by: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
V5:
 - New patch in the series.
---
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 9101d3a..b75f69d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -505,7 +505,17 @@
 		ports {
 			usb2-0 {
 				status = "okay";
-				mode = "otg";
+				mode = "peripheral";
+
+				usb-role-switch;
+				connector {
+					compatible = "usb-b-connector",
+						     "gpio-usb-b-connector";
+					label = "micro-USB";
+					type = "micro";
+					vbus-gpio = <&gpio TEGRA_GPIO(CC, 4)
+						     GPIO_ACTIVE_LOW>;
+				};
 			};
 
 			usb2-1 {
-- 
2.7.4
