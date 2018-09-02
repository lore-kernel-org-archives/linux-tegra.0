From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 23/37] ARM: tegra: colibri_t20: add i2c-thermtrip
Date: Sun,  2 Sep 2018 12:08:52 +0200
Message-ID: <20180902100906.25792-24-marcel@ziswiler.com>
References: <20180902100906.25792-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180902100906.25792-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Add i2c-thermtrip which would set the SLEEP MODE bit in the SUPPLYENE
register of the TPS658643 PMIC.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None

 arch/arm/boot/dts/tegra20-colibri.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-colibri.dtsi b/arch/arm/boot/dts/tegra20-colibri.dtsi
index 477d67ff74c6..9ec56f49c30c 100644
--- a/arch/arm/boot/dts/tegra20-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri.dtsi
@@ -598,6 +598,14 @@
 		nvidia,core-pwr-good-time = <3845 3845>;
 		nvidia,core-pwr-off-time = <3875>;
 		nvidia,sys-clock-req-active-high;
+
+		/* Set SLEEP MODE bit in SUPPLYENE register of TPS658643 PMIC */
+		i2c-thermtrip {
+			nvidia,i2c-controller-id = <3>;
+			nvidia,bus-addr = <0x34>;
+			nvidia,reg-addr = <0x14>;
+			nvidia,reg-data = <0x8>;
+		};
 	};
 
 	memory-controller@7000f400 {
-- 
2.14.4
