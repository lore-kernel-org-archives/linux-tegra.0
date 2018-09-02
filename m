From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 01/37] ARM: tegra: colibri_t20: move aliases from module to carrier board
Date: Sun,  2 Sep 2018 12:08:30 +0200
Message-ID: <20180902100906.25792-2-marcel@ziswiler.com>
References: <20180902100906.25792-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180902100906.25792-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Move RTC aliases from module to carrier board to be more in-line with
all our other device trees.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None

 arch/arm/boot/dts/tegra20-colibri-iris.dts | 2 ++
 arch/arm/boot/dts/tegra20-colibri.dtsi     | 5 -----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-colibri-iris.dts b/arch/arm/boot/dts/tegra20-colibri-iris.dts
index 57f16c0e9917..496b96e229d2 100644
--- a/arch/arm/boot/dts/tegra20-colibri-iris.dts
+++ b/arch/arm/boot/dts/tegra20-colibri-iris.dts
@@ -8,6 +8,8 @@
 	compatible = "toradex,iris", "toradex,colibri_t20-512", "nvidia,tegra20";
 
 	aliases {
+		rtc0 = "/i2c@7000d000/tps6586x@34";
+		rtc1 = "/rtc@7000e000";
 		serial0 = &uarta;
 		serial1 = &uartd;
 	};
diff --git a/arch/arm/boot/dts/tegra20-colibri.dtsi b/arch/arm/boot/dts/tegra20-colibri.dtsi
index fa1af2dc276c..e34ab4a76158 100644
--- a/arch/arm/boot/dts/tegra20-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri.dtsi
@@ -5,11 +5,6 @@
 	model = "Toradex Colibri T20 256/512 MB";
 	compatible = "toradex,colibri_t20-512", "nvidia,tegra20";
 
-	aliases {
-		rtc0 = "/i2c@7000d000/tps6586x@34";
-		rtc1 = "/rtc@7000e000";
-	};
-
 	memory@0 {
 		/*
 		 * Set memory to 256 MB to be safe as this could be used on
-- 
2.14.4
