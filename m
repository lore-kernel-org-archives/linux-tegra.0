From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 07/34] ARM: tegra: colibri_t30: move dr_mode property from phy to controller
Date: Sat,  1 Sep 2018 10:12:21 +0200
Message-ID: <20180901081248.22639-8-marcel@ziswiler.com>
References: <20180901081248.22639-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180901081248.22639-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Move dr_mode property from USB PHY node to controller.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None

 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
index ff321964d225..709ff95a1614 100644
--- a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
+++ b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
@@ -105,11 +105,11 @@
 	/* EHCI instance 0: USB1_DP/N -> USBC_P/N */
 	usb@7d000000 {
 		status = "okay";
+		dr_mode = "otg";
 	};
 
 	usb-phy@7d000000 {
 		status = "okay";
-		dr_mode = "otg";
 		vbus-supply = <&reg_usbc_vbus>;
 	};
 
-- 
2.14.4
