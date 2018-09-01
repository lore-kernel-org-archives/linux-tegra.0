From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 33/34] ARM: tegra: colibri_t30: annotate unused i2c busses
Date: Sat,  1 Sep 2018 10:12:47 +0200
Message-ID: <20180901081248.22639-34-marcel@ziswiler.com>
References: <20180901081248.22639-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180901081248.22639-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Both GEN2_I2C as well as CAM_I2C (I2C3) are unused in our design.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None

 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
index 9985d0a91f69..5965150ecdd2 100644
--- a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
+++ b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
@@ -70,6 +70,10 @@
 		};
 	};
 
+	/* GEN2_I2C: unused */
+
+	/* CAM_I2C (I2C3): unused */
+
 	/* DDC_CLOCK/DATA on X3 pin 15/16 (e.g. display EDID) */
 	i2c@7000c700 {
 		status = "okay";
-- 
2.14.4
