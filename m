From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 03/37] ARM: tegra: colibri_t20: iris: add missing aliases
Date: Sun,  2 Sep 2018 12:08:32 +0200
Message-ID: <20180902100906.25792-4-marcel@ziswiler.com>
References: <20180902100906.25792-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180902100906.25792-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Add rtc0 being the ultra low-power I2C one as found on the carrier board
and the 3rd UART being NVIDIA's UARTB.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2:
- Fix commit message which was mixed up between "[PATCH 03/31] ARM:
  tegra: colibri_t20: iris: annotate i2c busses" and "[PATCH 04/31] ARM:
  tegra: colibri_t20: iris: add missing aliases".

 arch/arm/boot/dts/tegra20-colibri-iris.dts | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-colibri-iris.dts b/arch/arm/boot/dts/tegra20-colibri-iris.dts
index b6d05da8c93c..cbf1f4d76813 100644
--- a/arch/arm/boot/dts/tegra20-colibri-iris.dts
+++ b/arch/arm/boot/dts/tegra20-colibri-iris.dts
@@ -8,10 +8,12 @@
 	compatible = "toradex,iris", "toradex,colibri_t20-512", "nvidia,tegra20";
 
 	aliases {
-		rtc0 = "/i2c@7000d000/tps6586x@34";
-		rtc1 = "/rtc@7000e000";
+		rtc0 = "/i2c@7000c000/rtc@68";
+		rtc1 = "/i2c@7000d000/tps6586x@34";
+		rtc2 = "/rtc@7000e000";
 		serial0 = &uarta;
 		serial1 = &uartd;
+		serial2 = &uartb;
 	};
 
 	chosen {
-- 
2.14.4
