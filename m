Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762903F4DFB;
	Fri, 26 Jun 2026 12:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782475700; cv=none; b=LX6mq81a2WZWITMy0zPgxeUUci0+X3eIwExH7PB5qDNePkz57bhmwBUp7NuvQN/sDELg+iO+FDE3mSTziRcNTMiK26LZByl5d/IFIL3+/aUzF7I3zymUTXnVUXca8JrP8PWjHq/wP59Bd/aW4oN4e/rNU7RuUfBMqxa+1DRdwuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782475700; c=relaxed/simple;
	bh=PB9YxYHHHDa6l4Ina14jx4/wZx2J8xLQNOqCltTeeww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QezoLPgpoXAkRNHVsJT11I8kNi2pHoHMIVWz/tm8GfgQWPshHzXccymhByzzWUwRxqnxOMfwanM0tUi0tb0VO1eYHENni7xCFWEV6G1rujjHQstLkm75pVDdxTMC3DE/33yp0k6lt+CCosX64FYhnQHX/vRm81InPmd5knZluSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZGVNFzFv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZGVNFzFv"
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4900E1CEF;
	Fri, 26 Jun 2026 14:07:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782475648;
	bh=PB9YxYHHHDa6l4Ina14jx4/wZx2J8xLQNOqCltTeeww=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZGVNFzFvxSwtAONX4j48RYUMN7o11jg+XXilq1QjDQ/8xlvXuqbFGTu7Yo3dtBk0R
	 95hOJd1FIJ7qp0YrDnDRTgwBvWRL2y7XGMaV6j9gf1QVT/kHBS2P4FsPE2E5etl6Xx
	 /7swDODs6kP6JNZ9+KrhTiDiXXn4Gag08gTIsSfk=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 26 Jun 2026 13:07:58 +0100
Subject: [PATCH v2 6/8] arm64: dts: qcom: Convert to new media orientation
 definitions
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-kbingham-orientation-v2-6-47178be927b4@ideasonboard.com>
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com>
In-Reply-To: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com>
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
 Richard Acayan <mailingradian@gmail.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux@ew.tq-group.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782475679; l=3050;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=PB9YxYHHHDa6l4Ina14jx4/wZx2J8xLQNOqCltTeeww=;
 b=omDJyr+cL2Qk2zq3pggIUJqkAAXLtTJU0fn7jwm5sk+FNC8ZoVSUgJjzug4B0fD7LcWxpqpGE
 c2m5inmr2LADU/SAlBwYyZ9S44n0zw/V2SHMaIg5B3NUqX+NDl08zRu
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=

The orientation property for video interface devices now has definitions
to prevent hardcoded integer values for the enum options.

Update the users throughout the qualcomm device trees to use the new
definitions.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts         | 3 ++-
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 3 ++-
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi         | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 04cb9230d29f..d79be22108c8 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -13,6 +13,7 @@
 #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
@@ -701,7 +702,7 @@ camera@10 {
 		pinctrl-0 = <&cam_mclk3_default>;
 		pinctrl-names = "default";
 
-		orientation = <0>; /* Front facing */
+		orientation = <MEDIA_ORIENTATION_FRONT>;
 		rotation = <270>;
 
 		port {
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index abd9c5a67b9f..543fc691fd3c 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -11,6 +11,7 @@
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "sc8280xp.dtsi"
@@ -682,7 +683,7 @@ camera@10 {
 
 		clocks = <&camcc CAMCC_MCLK3_CLK>;
 
-		orientation = <0>;	/* Front facing */
+		orientation = <MEDIA_ORIENTATION_FRONT>;
 
 		avdd-supply = <&vreg_l6q>;
 		dvdd-supply = <&vreg_l2q>;
diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index 0f57b915186b..375b3c0edea7 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include "sdm670.dtsi"
@@ -460,7 +461,7 @@ camera@1a {
 		pinctrl-names = "default";
 
 		rotation = <270>;
-		orientation = <0>;
+		orientation = <MEDIA_ORIENTATION_FRONT>;
 
 		port {
 			cam_front_endpoint: endpoint {

-- 
2.52.0

