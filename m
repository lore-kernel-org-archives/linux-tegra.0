Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B204C9E04;
	Fri, 18 Sep 2026 10:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725959; cv=none; b=phIVRgFXve3kEpYDOK8VC0+lHswsmmiy3K5r3Y2utk89S+xwcwe2Xcl3JdUIDSgqnQEK8uairduf/4myjZGrwdNyUsoXUzbTVxJMOIVA6n8ROEaF9JBNOAEAOOTKpfQxrpi80O+jQdm2WqlcrPFxaqWFCNhKl3lu4n4HroZlhYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725959; c=relaxed/simple;
	bh=JM1OrO7785S1RFd9EW2UIqiD6tchSt3vlHgsKZaPz5o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qgm+DP1lhec/TaVvh3c8sHLNgHnSVpkWb5SSU/XeWOkKiglYinTRtpiZ2DeGJV35uJhzJnZjxzeHl4RdN5QK27+9VRJ80FXqpxQoADrsUKBtxySoYOR6FjpFl/kvzN7dxu8huc/kHRns1h0AS09bxWqx5eADNQ7lq0qYN24BpY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PQwVLs7v; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PQwVLs7v"
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 68A71C23;
	Fri, 18 Sep 2026 12:03:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789725835;
	bh=JM1OrO7785S1RFd9EW2UIqiD6tchSt3vlHgsKZaPz5o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PQwVLs7vx39xaQiIPLkJp8il73rv7hiuEHWwGdgjxRUK7Xnskvpeu0jhdKQhktqgQ
	 hlJXLbAdBt05etpcvUkECF8JRpXC4PJgG12ra3/hrk0cO7BIPyBd32pZXHPm98Nhj0
	 o0ZVfdVeiCErRXNF87d2rh0klFZXrjG18TQcuUW4=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 18 Sep 2026 11:05:23 +0100
Subject: [PATCH v5 2/6] arm64: dts: qcom: Convert to new media orientation
 definitions
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-kbingham-orientation-v5-2-e1a134326988@ideasonboard.com>
References: <20260918-kbingham-orientation-v5-0-e1a134326988@ideasonboard.com>
In-Reply-To: <20260918-kbingham-orientation-v5-0-e1a134326988@ideasonboard.com>
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
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789725933; l=3298;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=Y0ji9WJtRwlRDZpyYXEqKYUbnsF0IWYDo6VO2YsmO5g=;
 b=OnakVHGcHnqPNfA0zqjPKUV/7x02W8uT4auRgAFBbcObdFIoAM3Hj9RSZYpwr4rK+dEORuUYR
 PNF51GJekgKB+sIRFmfz/zp4xKJOwRqJNzv+9nTsVLG7bLmmumc73TJ
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The orientation property for video interface devices now has definitions
to prevent hardcoded integer values for the enum options.

Update the users throughout the qualcomm device trees to use the new
definitions.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts         | 3 ++-
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 3 ++-
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi         | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index f41ad446a39e..e2b7f1bd05ab 100644
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
index 218573a97785..3b5f6a29e969 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -11,6 +11,7 @@
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "sc8280xp.dtsi"
@@ -683,7 +684,7 @@ camera@10 {
 
 		clocks = <&camcc CAMCC_MCLK3_CLK>;
 
-		orientation = <0>;	/* Front facing */
+		orientation = <MEDIA_ORIENTATION_FRONT>;
 
 		avdd-supply = <&vreg_l6q>;
 		dvdd-supply = <&vreg_l2q>;
diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index b4854801a5f5..7880d85b52fe 100644
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

