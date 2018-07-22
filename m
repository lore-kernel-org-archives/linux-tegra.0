From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 22/28] ARM: tegra: apalis_t30: add i2c-thermtrip
Date: Sun, 22 Jul 2018 18:49:30 +0200
Message-ID: <20180722164936.20581-23-marcel@ziswiler.com>
References: <20180722164936.20581-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180722164936.20581-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Add i2c-thermtrip which would set the DEV_OFF bit in the DCDC control
register of the TPS65911 PMIC.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra30-apalis.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index 4e8ea1a8d9ec..f8caf3f07fff 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -1055,6 +1055,14 @@
 		nvidia,core-pwr-off-time = <0>;
 		nvidia,core-power-req-active-high;
 		nvidia,sys-clock-req-active-high;
+
+		/* Set DEV_OFF bit in DCDC control register of TPS65911 PMIC */
+		i2c-thermtrip {
+			nvidia,i2c-controller-id = <4>;
+			nvidia,bus-addr = <0x2d>;
+			nvidia,reg-addr = <0x3e>;
+			nvidia,reg-data = <0x1>;
+		};
 	};
 
 	ahub@70080000 {
-- 
2.14.4
