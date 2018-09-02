From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 33/37] ARM: tegra: colibri_t20: iris: drop unused i2c_ddc label
Date: Sun,  2 Sep 2018 12:09:02 +0200
Message-ID: <20180902100906.25792-34-marcel@ziswiler.com>
References: <20180902100906.25792-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180902100906.25792-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Drop unused i2c_ddc label.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None

 arch/arm/boot/dts/tegra20-colibri-iris.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20-colibri-iris.dts b/arch/arm/boot/dts/tegra20-colibri-iris.dts
index b16e04dfa31f..00fd2603d780 100644
--- a/arch/arm/boot/dts/tegra20-colibri-iris.dts
+++ b/arch/arm/boot/dts/tegra20-colibri-iris.dts
@@ -139,7 +139,7 @@
 	/* CAM_I2C (I2C3): unused */
 
 	/* DDC_CLOCK/DATA on X3 pin 15/16 (e.g. display EDID) */
-	i2c_ddc: i2c@7000c400 {
+	i2c@7000c400 {
 		status = "okay";
 	};
 
-- 
2.14.4
