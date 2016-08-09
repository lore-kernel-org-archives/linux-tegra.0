From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 5/7] arm64: tegra: Enable DPAUX for Tegra210 Smaug
Date: Tue, 9 Aug 2016 16:21:20 +0100
Message-ID: <1470756082-19099-6-git-send-email-jonathanh@nvidia.com>
References: <1470756082-19099-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1470756082-19099-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The Tegra210 Smaug uses I2C6 for interfacing to various audio chips.
I2C6 shares pads with the DPAUX interface and to allow I2C6 to request
the pads owned by DPAUX, the DPAUX device needs to be enabled. Enable
DPAUX for Tegra210 Smaug.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 2d50a889ddff..2c4672527d75 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -27,6 +27,12 @@
 		reg = <0x0 0x80000000 0x0 0xc0000000>;
 	};
 
+	host1x@50000000 {
+		dpaux: dpaux@545c0000 {
+			status = "okay";
+		};
+	};
+
 	pinmux: pinmux@700008d4 {
 		pinctrl-names = "boot";
 		pinctrl-0 = <&state_boot>;
-- 
2.1.4
