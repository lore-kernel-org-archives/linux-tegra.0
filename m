From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/9] arm64: tegra: Add CPU nodes for Tegra186
Date: Thu, 17 Nov 2016 18:11:24 +0100
Message-ID: <20161117171131.20062-2-thierry.reding@gmail.com>
References: <20161117171131.20062-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161117171131.20062-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Tegra186 has six CPUs: two CPUs are second generation Denver CPUs that
support ARMv8 and four CPUs are Cortex-A57 CPUs.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 41 ++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 6cb8ac918530..eadbfacd16c2 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -57,6 +57,47 @@
 		};
 	};
 
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			compatible = "nvidia,tegra186-denver", "arm,armv8";
+			device_type = "cpu";
+			reg = <0x000>;
+		};
+
+		cpu@1 {
+			compatible = "nvidia,tegra186-denver", "arm,armv8";
+			device_type = "cpu";
+			reg = <0x001>;
+		};
+
+		cpu@2 {
+			compatible = "arm,cortex-a57", "arm,armv8";
+			device_type = "cpu";
+			reg = <0x100>;
+		};
+
+		cpu@3 {
+			compatible = "arm,cortex-a57", "arm,armv8";
+			device_type = "cpu";
+			reg = <0x101>;
+		};
+
+		cpu@4 {
+			compatible = "arm,cortex-a57", "arm,armv8";
+			device_type = "cpu";
+			reg = <0x102>;
+		};
+
+		cpu@5 {
+			compatible = "arm,cortex-a57", "arm,armv8";
+			device_type = "cpu";
+			reg = <0x103>;
+		};
+	};
+
 	bpmp: bpmp {
 		compatible = "nvidia,tegra186-bpmp";
 		mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_DB
-- 
2.10.2
