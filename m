Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6CB4C10C9;
	Fri, 18 Sep 2026 10:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789728282; cv=none; b=RRBZb9JcrPEA2HuS41tA27uT51qCg5PkuYnCuqzVXaSS6UMJPzMfUCM0G+quw1qlV6or3fMSx+hhrLj3g4DZZaBUtl3KjuMvzBICsuvoszfGIuUixRr13djMdrWH/ANnbYj0nZtTd2bASswM6GVvNBl3XmCvjMSktTAeVrejzZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789728282; c=relaxed/simple;
	bh=LOdjOuiDa5EMlmABS/nhDQm3v5RQfRvKfR3wfM/bt0Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fScrdemKTRTvTFBsEhLoqvHtT+oEEpFvYsJlcnnESk1HJHH8a1/2D8anTq8DkjOt9MurGvZSERUAjresTISblBfQbqMbI+AL4q5F0o5lCt0H/yXxZuT+gIr17eI4Z1A47ZW4XfhnXLFfx+uNZSh4ax5TpCOawA7aWd6UOxCwgL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=C+j1tgFb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="C+j1tgFb"
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B43264F03;
	Fri, 18 Sep 2026 12:42:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789728164;
	bh=LOdjOuiDa5EMlmABS/nhDQm3v5RQfRvKfR3wfM/bt0Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=C+j1tgFbiXlv9Jwu1lodC3tdEbD//oroYu6nu92Lwqbe6epnQYAu2aOYC6ZKxmXgi
	 /u1Fy8Z1BK0Eo1FuGLLMBKfJ0N0t7PQHdEgzLu0XR8WAb09zywuC0P5yFCx95ra/vZ
	 4X3dF0/oHtpv5C1+GeEN8L6pHaWeDt5xfwYpyu/4=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 18 Sep 2026 11:44:17 +0100
Subject: [PATCH v6 5/6] ARM: tegra: Convert to new media orientation
 definitions
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-kbingham-orientation-v6-5-5e8b1f01be29@ideasonboard.com>
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
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789728257; l=4149;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=Wjt5veqgt2cH3AYWBoFwcgxVrdtQEOScHWgKInDvv9w=;
 b=cjXp//9cyWoQkn+W/rTfgcsA7BFQKIKpPDJ7Jo1vuJ6qPjQ6ve9/V7yGLiKepMcNr8SYMwC+S
 /Fe/qkfbu+XDVlCcPuxFNt0xAvuPzqzw+kF6X0me4tx8NoGv9M1rf9h
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The orientation property for video interface devices now has definitions
to prevent hardcoded integer values for the enum options.

Update the users throughout the nvidia device trees to use the new
definitions.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
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
index 892d718294dd..a7fdd194300c 100644
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
index bf1c3a31d406..76286e15684c 100644
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
index 896639599c12..28680063bcc0 100644
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
index 60e8a19aa70e..77cab695d3da 100644
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
2.52.0

