From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 10/34] ARM: tegra: apalis_t30: drop unused cami2c label
Date: Fri, 31 Aug 2018 18:37:52 +0200
Message-ID: <20180831163817.23970-11-marcel@ziswiler.com>
References: <20180831163817.23970-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831163817.23970-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Drop unused cami2c label.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None

 arch/arm/boot/dts/tegra30-apalis-eval.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30-apalis-eval.dts b/arch/arm/boot/dts/tegra30-apalis-eval.dts
index cd4e45759ac8..3f15f327f293 100644
--- a/arch/arm/boot/dts/tegra30-apalis-eval.dts
+++ b/arch/arm/boot/dts/tegra30-apalis-eval.dts
@@ -95,7 +95,7 @@
 	 * CAM_I2C: I2C3_SDA/SCL on MXM3 pin 201/203 (e.g. camera sensor on
 	 * carrier board)
 	 */
-	cami2c: i2c@7000c500 {
+	i2c@7000c500 {
 		status = "okay";
 		clock-frequency = <400000>;
 	};
-- 
2.14.4
