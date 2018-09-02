From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 04/37] ARM: tegra: colibri_t20: iris: annotate i2c busses
Date: Sun,  2 Sep 2018 12:08:33 +0200
Message-ID: <20180902100906.25792-5-marcel@ziswiler.com>
References: <20180902100906.25792-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180902100906.25792-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Annotate I2C busses: GEN2_I2C and CAM_I2C (I2C3) being unused and
DDC_CLOCK/DATA on X3 pin 15/16 e.g. used for display EDID.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2:
- Fix commit message which was mixed up between "[PATCH 03/31] ARM:
  tegra: colibri_t20: iris: annotate i2c busses" and "[PATCH 04/31] ARM:
  tegra: colibri_t20: iris: add missing aliases".

 arch/arm/boot/dts/tegra20-colibri-iris.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-colibri-iris.dts b/arch/arm/boot/dts/tegra20-colibri-iris.dts
index cbf1f4d76813..cc9e372a3b58 100644
--- a/arch/arm/boot/dts/tegra20-colibri-iris.dts
+++ b/arch/arm/boot/dts/tegra20-colibri-iris.dts
@@ -73,6 +73,11 @@
 		};
 	};
 
+	/* GEN2_I2C: unused */
+
+	/* CAM_I2C (I2C3): unused */
+
+	/* DDC_CLOCK/DATA on X3 pin 15/16 (e.g. display EDID) */
 	i2c_ddc: i2c@7000c400 {
 		status = "okay";
 	};
-- 
2.14.4
