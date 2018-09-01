From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 20/34] ARM: tegra: colibri_t30: remove unused nvidia,is-wired property
Date: Sat,  1 Sep 2018 10:12:34 +0200
Message-ID: <20180901081248.22639-21-marcel@ziswiler.com>
References: <20180901081248.22639-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180901081248.22639-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Remove unused nvidia,is-wired property.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None

 arch/arm/boot/dts/tegra30-colibri.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index 0d8b0f319c6f..eb36ae3038a7 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -949,7 +949,6 @@
 
 	usb-phy@7d004000 {
 		status = "okay";
-		nvidia,is-wired = <1>;
 		vbus-supply = <&reg_lan_v_bus>;
 	};
 
-- 
2.14.4
