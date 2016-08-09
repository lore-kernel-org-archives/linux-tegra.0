From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/7] arm64: tegra: Add ACONNECT, ADMA and AGIC nodes Tegra210 Smaug
Date: Tue, 9 Aug 2016 16:21:19 +0100
Message-ID: <1470756082-19099-5-git-send-email-jonathanh@nvidia.com>
References: <1470756082-19099-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1470756082-19099-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Populate the ACONNECT, ADMA and AGIC nodes for Tegra210 Smaug which
are used for audio use-cases.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 431266a48e9c..2d50a889ddff 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1574,6 +1574,18 @@
 		status = "okay";
 	};
 
+	aconnect@702c0000 {
+		status = "okay";
+
+		dma@702e2000 {
+			status = "okay";
+		};
+
+		agic@702f9000 {
+			status = "okay";
+		};
+	};
+
 	clocks {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
2.1.4
