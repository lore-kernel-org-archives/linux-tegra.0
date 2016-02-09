From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2] ARM64: tegra: Add stdout-path for various boards
Date: Tue, 9 Feb 2016 13:52:00 +0000
Message-ID: <1455025920-21875-2-git-send-email-jonathanh@nvidia.com>
References: <1455025920-21875-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455025920-21875-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

For Tegra boards, the device-tree alias serial0 is used for the console
and so add the stdout-path information so that the console no longer
needs to be passed via the kernel boot parameters.

For tegra132-norrin the alias serial0 is not defined and so add this.

This has been tested on tegra132-norrin and tegra210-p2371-0000.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts | 5 ++++-
 arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi | 4 ++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
index 62f33fc84e3e..3c0b4d7bfa6f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
@@ -10,9 +10,12 @@
 	aliases {
 		rtc0 = "/i2c@0,7000d000/as3722@40";
 		rtc1 = "/rtc@0,7000e000";
+		serial0 = &uarta;
 	};
 
-	chosen { };
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
 
 	memory {
 		device_type = "memory";
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi
index ece0dec61fae..73ba58260817 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2530.dtsi
@@ -9,6 +9,10 @@
 		serial0 = &uarta;
 	};
 
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	memory {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0xc0000000>;
-- 
2.1.4
