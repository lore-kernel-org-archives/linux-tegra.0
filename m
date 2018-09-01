From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 19/19] ARM: tegra: apalis-tk1: drop unused hdmi_ddc label
Date: Sat,  1 Sep 2018 15:05:04 +0200
Message-ID: <20180901130504.14318-20-marcel@ziswiler.com>
References: <20180901130504.14318-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180901130504.14318-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Drop unused hdmi_ddc label.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2:
- New patch.

 arch/arm/boot/dts/tegra124-apalis-eval.dts      | 2 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-apalis-eval.dts b/arch/arm/boot/dts/tegra124-apalis-eval.dts
index 0b4ac640e54f..eaee10ef6512 100644
--- a/arch/arm/boot/dts/tegra124-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra124-apalis-eval.dts
@@ -123,7 +123,7 @@
 	/*
 	 * GEN2_I2C: I2C2_SDA/SCL (DDC) on MXM3 pin 205/207 (e.g. display EDID)
 	 */
-	hdmi_ddc: i2c@7000c400 {
+	i2c@7000c400 {
 		status = "okay";
 	};
 
diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts b/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
index 799382d04bba..7961eb4bd803 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts
@@ -100,7 +100,7 @@
 	 * I2C4 (DDC): I2C4_SDA/SCL (DDC) on MXM3 pin 205/207
 	 * (e.g. display EDID)
 	 */
-	hdmi_ddc: i2c@7000c700 {
+	i2c@7000c700 {
 		status = "okay";
 	};
 
-- 
2.14.4
