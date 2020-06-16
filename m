From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 62/73] arm64: tegra: Use standard EEPROM properties
Date: Tue, 16 Jun 2020 15:52:27 +0200
Message-ID: <20200616135238.3001888-63-thierry.reding@gmail.com>
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

The address-bits and page-size properties that are currently used are
not valid properties according to the bindings. Use the address-width
and pagesize properties instead.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 4 ++--
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi     | 4 ++--
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     | 4 ++--
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 4 ++--
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 8 ++++----
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index 4a7a022acabb..a70fd4e86840 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -222,8 +222,8 @@ eeprom@57 {
 			reg = <0x57>;
 
 			vcc-supply = <&vdd_1v8>;
-			address-bits = <8>;
-			page-size = <8>;
+			address-width = <8>;
+			pagesize = <8>;
 			size = <256>;
 			read-only;
 		};
diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
index b5568b9ff181..654c55ed048b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
@@ -174,8 +174,8 @@ eeprom@50 {
 			reg = <0x50>;
 
 			vcc-supply = <&vdd_1v8>;
-			address-bits = <8>;
-			page-size = <8>;
+			address-width = <8>;
+			pagesize = <8>;
 			size = <256>;
 			read-only;
 		};
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
index d818fac3070c..6a4b50aaa25d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
@@ -274,8 +274,8 @@ eeprom@50 {
 			reg = <0x50>;
 
 			vcc-supply = <&vdd_1v8>;
-			address-bits = <8>;
-			page-size = <8>;
+			address-width = <8>;
+			pagesize = <8>;
 			size = <256>;
 			read-only;
 		};
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
index eb46f745d75f..0c0d51c23975 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
@@ -84,8 +84,8 @@ eeprom@57 {
 			reg = <0x57>;
 
 			vcc-supply = <&vdd_1v8>;
-			address-bits = <8>;
-			page-size = <8>;
+			address-width = <8>;
+			pagesize = <8>;
 			size = <256>;
 			read-only;
 		};
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index ac17f5485bf8..beec6aab2157 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -116,8 +116,8 @@ eeprom@50 {
 			reg = <0x50>;
 
 			vcc-supply = <&vdd_1v8>;
-			address-bits = <8>;
-			page-size = <8>;
+			address-width = <8>;
+			pagesize = <8>;
 			size = <256>;
 			read-only;
 		};
@@ -127,8 +127,8 @@ eeprom@57 {
 			reg = <0x57>;
 
 			vcc-supply = <&vdd_1v8>;
-			address-bits = <8>;
-			page-size = <8>;
+			address-width = <8>;
+			pagesize = <8>;
 			size = <256>;
 			read-only;
 		};
-- 
2.24.1
