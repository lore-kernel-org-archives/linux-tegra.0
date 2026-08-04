Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27B64963CA;
	Tue,  4 Aug 2026 19:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785872644; cv=none; b=iwwlxfVJgnknMmLsY3oS6Ta6MbuVpDXisJEMM9B10Sk+tfwcFF43Zl9wOgs7pH9WaiRG8HHH3iGGrHwa8vlQzvLrfcM8WHKpPW0SUhrD0KiTy8MxIjEvqrJQCkLXOVp7qqdzQxz8V95NQzw8nFXXybfmuaGCDuL9HGkGNvDz/Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785872644; c=relaxed/simple;
	bh=/DTTa6Wr0oCNuDStD/EyLpixX6mASYgPQGD4KVtSq6w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ucg4sCWXF39TVs/ue9UskBKeJpyCXr5vsqHiKbt1przfpzHGPfHdVWbgSF+RzAr/B3cl3JLQi+rVoDwgdavLfSvIL9+nH6n8mf5y5jd57h6eOujAjPZAs4DY7vcuMp8khld+Wfg2M4wqxWTGG5Kub/lqYMRSJR/hhIp5P3jDNNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aWLRD0N/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aWLRD0N/"
Received: from [192.168.0.240] (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F9732879;
	Tue,  4 Aug 2026 21:42:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785872557;
	bh=/DTTa6Wr0oCNuDStD/EyLpixX6mASYgPQGD4KVtSq6w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aWLRD0N/t9Jbr95qDy6HEtFy8kwcRlypFW3dnYs3vjbyKYBbXndLnWC94R1Av4BUn
	 LwekhHWtoprezJmqV0lQyHsxFZkgKFURIM4yVdqwsjmFu/7FXYX9i+IzUq6KrnLjYX
	 9m/nIMqaQmBDKiYNYHTMDLBhyqek8fUFkjvS/Rrg=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Tue, 04 Aug 2026 20:43:31 +0100
Subject: [PATCH v4 4/7] arm64: dts: qcom: Convert to new media orientation
 definitions
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-kbingham-orientation-v4-4-336998dd63b4@ideasonboard.com>
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
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 David Heidelberg <david@ixit.cz>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785872619; l=3458;
 i=kieran.bingham@ideasonboard.com; s=20260204; h=from:subject:message-id;
 bh=/DTTa6Wr0oCNuDStD/EyLpixX6mASYgPQGD4KVtSq6w=;
 b=p+Ah8TtOUqx6tj4IpvG1yvATt/F3yV7HHNMZ896Jwovb1fofFJnTslS3jbt2ooOz32eAyS+yO
 meTSOMhTw31CHUqtbhjhUQ80aYLHKHFmIS97PazviBaGz696ezjAJZo
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=IOxS2C6nWHNjLfkDR71Iesk904i6wJDfEERqV7hDBdY=

The orientation property for video interface devices now has definitions
to prevent hardcoded integer values for the enum options.

Update the users throughout the qualcomm device trees to use the new
definitions.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts         | 3 ++-
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 3 ++-
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi         | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 04cb9230d29fd1d2551d3ed2160e48de74a36354..d79be22108c85c21608cc682c5158133dc2fcad5 100644
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
index abd9c5a67b9ffe7b1209b1375f3522ff95d03b18..543fc691fd3c008382b321103df85974322aff35 100644
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
index 0f57b915186b7f28e669ccef91348db81d1b2e2f..375b3c0edea70a712b688e0430dadee69468487e 100644
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
2.53.0

