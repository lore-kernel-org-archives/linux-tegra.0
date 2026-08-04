Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B816413D62;
	Tue,  4 Aug 2026 19:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785872647; cv=none; b=YhwjqfizCYiorTb7NI5Qa5UZlKUhcVHySPnOOTxs2xd1n8aJ1NfWld0adIlvEZwN2KuIoIIZxyL3Fe1lDNclrL1H19IY1SN2/sYrQPBtSwIoCRUAqWiPXuvOPbhW+TmUwwvNrNu3BynbAHJOlcZ63AqIFaPBmlOAV83Kx6hOdys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785872647; c=relaxed/simple;
	bh=2roZo+O9bfs5wZlzfHNuSLLrkhZGgewmjPJGmYrBLQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EO0B5iwS1NwcCM0dvix3Eoc+HRvD7QzQ9hOKbgURx6UXGattqYVMHmbOLHjA81H6zsK4zIK4Qg8T3AAPsG/hiaD2kokpiVU3RqiiSenPHngPSCujUjZHmESUu+RbUG1ocjnUYKmVu1sqidE9pmg1nqInug/uOUEs4iqrT94Kqvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SypZ/tnY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SypZ/tnY"
Received: from [192.168.0.240] (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50F6435D3;
	Tue,  4 Aug 2026 21:42:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785872562;
	bh=2roZo+O9bfs5wZlzfHNuSLLrkhZGgewmjPJGmYrBLQQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SypZ/tnYmbmu60E75c5h9lWc+VFo0GGga35RYTuYVtWqKli0OFFMjM4ic4/7WwlJy
	 tb4A63WnBm93R8JToyuWk7C3ddj548UeEDQHFYzsglHx//eoiVY8EujwxdeY0hjPWm
	 uNP4+Ekj5Xvp9xkPGeD3lbotXlRoEl0GyKeK7n0M=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Tue, 04 Aug 2026 20:43:34 +0100
Subject: [PATCH v4 7/7] ARM: tegra: Convert to new media orientation
 definitions
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-kbingham-orientation-v4-7-336998dd63b4@ideasonboard.com>
References: <20260804-kbingham-orientation-v4-0-336998dd63b4@ideasonboard.com>
In-Reply-To: <20260804-kbingham-orientation-v4-0-336998dd63b4@ideasonboard.com>
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
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785872619; l=4365;
 i=kieran.bingham@ideasonboard.com; s=20260204; h=from:subject:message-id;
 bh=2roZo+O9bfs5wZlzfHNuSLLrkhZGgewmjPJGmYrBLQQ=;
 b=gTMLXiSXouOoSUS3up6VvewOqXEBidSSHEnOFsVDz0zJLC5W9GJm3Qbh0rvX6jfGMPOJ88GfQ
 9CUVycukXTfC+X9JVbgIj+SzOhpZoU3W6T4duCH4nYOZVuKp3fypOq/
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=IOxS2C6nWHNjLfkDR71Iesk904i6wJDfEERqV7hDBdY=

The orientation property for video interface devices now has definitions
to prevent hardcoded integer values for the enum options.

Update the users throughout the nvidia device trees to use the new
definitions.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
v2:
 - Fix MEDIA_ORIENTATION_REAR to MEDIA_ORIENTATION_BACK
---
 arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi | 3 ++-
 arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi    | 3 ++-
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts                     | 4 +++-
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi                      | 3 ++-
 4 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi
index 892d718294dd105fcfbf290c38de74fc3f93ed6b..a7fdd194300c035317ae237dec7d45533246a3cd 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi
@@ -3,6 +3,7 @@
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/power/summit,smb347-charger.h>
 #include <dt-bindings/thermal/thermal.h>
 
@@ -991,7 +992,7 @@ front-camera@48 {
 			vdd-supply = <&vddio_cam>;
 			vaa-supply = <&avdd_cam1>;
 
-			orientation = <0>; /* Front camera */
+			orientation = <MEDIA_ORIENTATION_FRONT>;
 
 			assigned-clocks = <&tegra_car TEGRA30_CLK_VI_SENSOR>,
 					  <&tegra_car TEGRA30_CLK_CSUS>;
diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi b/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
index bf1c3a31d406240f62ca13ed351c5ba3a42c83ec..76286e15684c289e648cf75c207cd454176b4689 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
@@ -3,6 +3,7 @@
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/thermal/thermal.h>
 
 #include "tegra30.dtsi"
@@ -1262,7 +1263,7 @@ front-camera@48 {
 			vdd-supply = <&vdd_1v8_cam>;
 			vaa-supply = <&avdd_2v85_fcam>;
 
-			orientation = <0>; /* Front camera */
+			orientation = <MEDIA_ORIENTATION_FRONT>;
 
 			assigned-clocks = <&tegra_car TEGRA30_CLK_VI_SENSOR>,
 					  <&tegra_car TEGRA30_CLK_CSUS>;
diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
index 896639599c12600a1225610af0ec78f5286a8000..28680063bcc05bb2c1c69effe9ad7235c81c536a 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 
+#include <dt-bindings/media/video-interface-devices.h>
+
 #include "tegra30-lg-x3.dtsi"
 
 / {
@@ -132,7 +134,7 @@ front-camera@48 {
 			vdd-supply = <&vt_1v8_front>;
 			vaa-supply = <&vt_2v8_front>;
 
-			orientation = <0>; /* Front camera */
+			orientation = <MEDIA_ORIENTATION_FRONT>;
 
 			assigned-clocks = <&tegra_car TEGRA30_CLK_VI_SENSOR>,
 					  <&tegra_car TEGRA30_CLK_CSUS>;
diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
index 60e8a19aa70ecadb7d7a0d251ee3b12cf9ca01dc..77cab695d3da94ab5b8c46698fd6e94e03430bf0 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/mfd/max77620.h>
 #include <dt-bindings/thermal/thermal.h>
 
@@ -1216,7 +1217,7 @@ rear-camera@10 {
 			dvdd-supply = <&vdd_1v2_rear>;
 			avdd-supply = <&vdd_2v7_rear>;
 
-			orientation = <1>; /* Rear camera */
+			orientation = <MEDIA_ORIENTATION_BACK>;
 			rotation = <90>;
 
 			nvmem = <&m24c08>;

-- 
2.53.0

