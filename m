From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 5/9] ARM: tegra: apalis_t30/tk1: annotate power I2C being on-module
Date: Tue, 16 Oct 2018 12:47:26 +0200
Message-ID: <20181016104730.4598-6-marcel@ziswiler.com>
References: <20181016104730.4598-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181016104730.4598-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

The power I2C bus aka PWR_I2C which connects to the audio codec, PMIC,
temperature sensor and touch screen controller is really on-module only.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None
Changes in v1: None

 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi | 5 ++++-
 arch/arm/boot/dts/tegra124-apalis.dtsi      | 5 ++++-
 arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi  | 2 +-
 arch/arm/boot/dts/tegra30-apalis.dtsi       | 2 +-
 4 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
index e532b564e4c9..0d095729b46b 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
@@ -1552,7 +1552,10 @@
 		clock-frequency = <10000>;
 	};
 
-	/* PWR_I2C: power I2C to audio codec, PMIC and temperature sensor */
+	/*
+	 * PWR_I2C: power I2C to audio codec, PMIC and temperature sensor
+	 * (On-module)
+	 */
 	i2c@7000d000 {
 		status = "okay";
 		clock-frequency = <400000>;
diff --git a/arch/arm/boot/dts/tegra124-apalis.dtsi b/arch/arm/boot/dts/tegra124-apalis.dtsi
index 3cab9bda918f..13127415d86b 100644
--- a/arch/arm/boot/dts/tegra124-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis.dtsi
@@ -1582,7 +1582,10 @@
 		clock-frequency = <10000>;
 	};
 
-	/* PWR_I2C: power I2C to audio codec, PMIC and temperature sensor */
+	/*
+	 * PWR_I2C: power I2C to audio codec, PMIC and temperature sensor
+	 * (On-module)
+	 */
 	i2c@7000d000 {
 		status = "okay";
 		clock-frequency = <400000>;
diff --git a/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi b/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
index 02f8126481a2..bc714032d771 100644
--- a/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
@@ -845,7 +845,7 @@
 
 	/*
 	 * PWR_I2C: power I2C to audio codec, PMIC, temperature sensor and
-	 * touch screen controller
+	 * touch screen controller (On-module)
 	 */
 	i2c@7000d000 {
 		status = "okay";
diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index 7f112f192fe9..4b6a8ecaac76 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -836,7 +836,7 @@
 
 	/*
 	 * PWR_I2C: power I2C to audio codec, PMIC, temperature sensor and
-	 * touch screen controller
+	 * touch screen controller (On-module)
 	 */
 	i2c@7000d000 {
 		status = "okay";
-- 
2.14.4
