Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BE24B44AB;
	Fri, 18 Sep 2026 10:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789728278; cv=none; b=L8aoMaX9UBAKyLHWSGN0jYiMRGwI29CF0uB6kzjYiwEaMTiU0v6povlRHXzlTwBd8/sVd8w90O7zsrsZFz/C5VWuXnL7C5FBJp1xLdfBVrwStwYqtrDuI+DXPkcXOJkKSPAw20g6YUPXnNhJjkjZMQKeBSiWvV0EUhZdXd2fPK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789728278; c=relaxed/simple;
	bh=rPhDyRAyM+tHXzJqze1j8KQwtrWV4VN15vjw7lB5SDI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=icsYobTlZ6ci8r1ieMs2T2TYRe4IoAd8aK3sNfqx9ZyUU/tKA86MKFgmZJOzeEpkkg53MDPs1tT8ur4XzelTJ+kaApTeVbqZC/gYKVFQviJyKbMnpfG5OA3TaFlGQmnCwQGSJlJKo4Btw/HXC2er2vzFHjalrma4mxSAnPvQuZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NIvjGm/v; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NIvjGm/v"
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 351414D8A;
	Fri, 18 Sep 2026 12:42:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789728162;
	bh=rPhDyRAyM+tHXzJqze1j8KQwtrWV4VN15vjw7lB5SDI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NIvjGm/v0m0rkx9tJlBRPQXG5EzRV7YsG3PlCkPf3iAPapDPu7/jY5H5vcpXwuq3L
	 qlp9HLJLZMqIkXTLwzcWB+KXUFDqeG8RzeWS7QlLqKcoEWcyKta4X1UF3xos2R9KZH
	 nuClpvYb0D08sGDWCJj6CRfEPbBiCP/Atniig2iI=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 18 Sep 2026 11:44:16 +0100
Subject: [PATCH v6 4/6] arm64: dts: rockchip: Convert to new media
 orientation definitions
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-kbingham-orientation-v6-4-5e8b1f01be29@ideasonboard.com>
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
In-Reply-To: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>, 
 Matthias Fend <matthias.fend@emfend.at>, 
 Mikhail Rudenko <mike.rudenko@gmail.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Paul Elder <paul.elder@ideasonboard.com>, 
 Martin Kepplinger <martin.kepplinger@puri.sm>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 Tommaso Merciai <tomm.merciai@gmail.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, 
 Richard Acayan <mailingradian@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux@ew.tq-group.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789728257; l=6027;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=t+YL6VuOhlrxKcsaeiaGweU0fG6f+wWBYt5eGPrwB4Q=;
 b=x+HhsnrB2XSGmkBiSN+/7bYUBzTRfwkxN3EbJ2xh2Ki/SWadBG0cRbZ2KqxNIgi4WTARG+CNg
 Nhs3Z+pedF5BUesPFBkJHKT9oox+4jeOLhNxtmubU5N+RYaQ7ckIfW0
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The orientation property for video interface devices now has definitions
to prevent hardcoded integer values for the enum options.

Update the users throughout the rockchip device trees to use the new
definitions.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de> # PP-1516 and
Reviewed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

---
v5:
 - Fix conflicts in rk3588-rock-5b-plus-radxa-cam4k
---
 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi                        | 3 ++-
 arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso    | 3 ++-
 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts                | 5 +++--
 .../boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso      | 3 ++-
 .../boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso      | 3 ++-
 5 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi b/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi
index 02200de695d3..3ae65dbcfffe 100644
--- a/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi
@@ -6,6 +6,7 @@
 /dts-v1/;
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include "px30.dtsi"
 
@@ -413,7 +414,7 @@ camera@36 {
 		dvdd-supply = <&vcc_cam_dvdd>;
 		dovdd-supply = <&vcc_cam_dovdd>;
 		lens-focus = <&focus>;
-		orientation = <0>;
+		orientation = <MEDIA_ORIENTATION_FRONT>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&cif_clkout_m0 &cam_pwdn>;
 		reset-gpios = <&gpio2 RK_PB0 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso b/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso
index d0725595ade0..1813f06bbff5 100644
--- a/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso
+++ b/arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso
@@ -16,6 +16,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 
 &{/} {
@@ -185,7 +186,7 @@ camera@36 {
 		dvdd-supply = <&cam_dvdd_1v2>;
 		dovdd-supply = <&cam_dovdd_1v8>;
 		lens-focus = <&focus>;
-		orientation = <0>;
+		orientation = <MEDIA_ORIENTATION_FRONT>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&cif_clkout_m0>;
 		reset-gpios = <&pca9670 6 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index d46cdfe3f784..1a36d54ddfa2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -13,6 +13,7 @@
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include "rk3399-s.dtsi"
 
 / {
@@ -455,7 +456,7 @@ wcam: camera@1a {
 		reg = <0x1a>;
 		clocks = <&cru SCLK_CIF_OUT>; /* MIPI_MCLK0, derived from CIF_CLKO */
 		lens-focus = <&wcam_lens>;
-		orientation = <1>; /* V4L2_CAMERA_ORIENTATION_BACK */
+		orientation = <MEDIA_ORIENTATION_BACK>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&camera_rst_l>;
 		reset-gpios = <&gpio1 RK_PA0 GPIO_ACTIVE_LOW>;
@@ -487,7 +488,7 @@ ucam: camera@36 {
 		clocks = <&cru SCLK_CIF_OUT>; /* MIPI_MCLK1, derived from CIF_CLK0 */
 		clock-names = "xvclk";
 		dovdd-supply = <&vcc1v8_dvp>;
-		orientation = <0>; /* V4L2_CAMERA_ORIENTATION_FRONT */
+		orientation = <MEDIA_ORIENTATION_FRONT>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&camera2_rst_l &dvp_pdn0_h>;
 		powerdown-gpios = <&gpio2 RK_PB4 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso
index 5c7fb960b099..5420ec3fe2ed 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso
@@ -10,6 +10,7 @@
 #include <dt-bindings/clock/rockchip,rk3588-cru.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 
 &{/} {
@@ -51,7 +52,7 @@ imx415: camera-sensor@1a {
 		avdd-supply = <&savdd_cam0>;
 		clocks = <&cru CLK_MIPI_CAMARAOUT_M3>;
 		dvdd-supply = <&sdvdd_cam0>;
-		orientation = <2>; /* External */
+		orientation = <MEDIA_ORIENTATION_EXTERNAL>;
 		ovdd-supply = <&siovdd_cam0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&cam0_rstn &mipim0_camera3_clk>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso
index 1ee9036b9095..8ef764aab73a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso
@@ -10,6 +10,7 @@
 #include <dt-bindings/clock/rockchip,rk3588-cru.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 
 &{/} {
@@ -51,7 +52,7 @@ cam1_imx415: camera-sensor@1a {
 		avdd-supply = <&savdd_cam1>;
 		clocks = <&cru CLK_MIPI_CAMARAOUT_M4>;
 		dvdd-supply = <&sdvdd_cam1>;
-		orientation = <2>; /* External */
+		orientation = <MEDIA_ORIENTATION_EXTERNAL>;
 		ovdd-supply = <&siovdd_cam1>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&cam1_rstn &mipim0_camera4_clk>;

-- 
2.52.0

