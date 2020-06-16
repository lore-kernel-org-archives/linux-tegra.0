From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 71/73] arm64: tegra: Sort nodes by unit-address on Jetson Nano
Date: Tue, 16 Jun 2020 15:52:36 +0200
Message-ID: <20200616135238.3001888-72-thierry.reding@gmail.com>
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

Move the usb@700d0000 node to the correct place in the device tree,
ordered by unit-address.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../boot/dts/nvidia/tegra210-p3450-0000.dts      | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index beec6aab2157..4eb51e5eef3a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -545,14 +545,6 @@ mmc@700b0000 {
 		vmmc-supply = <&vdd_3v3_sd>;
 	};
 
-	usb@700d0000 {
-		status = "okay";
-		phys = <&micro_b>;
-		phy-names = "usb2-0";
-		avddio-usb-supply = <&vdd_3v3_sys>;
-		hvdd-usb-supply = <&vdd_1v8>;
-	};
-
 	mmc@700b0400 {
 		status = "okay";
 		bus-width = <4>;
@@ -566,6 +558,14 @@ mmc@700b0400 {
 		wakeup-source;
 	};
 
+	usb@700d0000 {
+		status = "okay";
+		phys = <&micro_b>;
+		phy-names = "usb2-0";
+		avddio-usb-supply = <&vdd_3v3_sys>;
+		hvdd-usb-supply = <&vdd_1v8>;
+	};
+
 	clk32k_in: clock@0 {
 		compatible = "fixed-clock";
 		clock-frequency = <32768>;
-- 
2.24.1
