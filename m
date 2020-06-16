From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 51/73] arm64: tegra: Remove undocumented battery-name property
Date: Tue, 16 Jun 2020 15:52:16 +0200
Message-ID: <20200616135238.3001888-52-thierry.reding@gmail.com>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200616135238.3001888-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

battery-name is not a documented property, so drop it to avoid
validation failures.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts | 1 -
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts  | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
index bba8a4b82b0b..bb45ca6a5cf2 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
@@ -781,7 +781,6 @@ TEGRA_GPIO(J, 0)
 				battery: smart-battery {
 					compatible = "sbs,sbs-battery";
 					reg = <0xb>;
-					battery-name = "battery";
 					sbs,i2c-retry-count = <2>;
 					sbs,poll-retry-count = <10>;
 				/*	power-supplies = <&charger>; */
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index d32053934f3c..9f630ecc06bc 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1330,7 +1330,6 @@ ec_i2c_0: i2c-tunnel {
 				battery: bq27742@55 {
 					compatible = "ti,bq27742";
 					reg = <0x55>;
-					battery-name = "battery";
 				};
 			};
 		};
-- 
2.24.1
