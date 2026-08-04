Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D855F41E6C9;
	Tue,  4 Aug 2026 19:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785872637; cv=none; b=aLI8hS+AHzvUW+KQFsEkQcNMxKP3jEOHgV+3bCDmXCFAciakZEfW+76AmKF5BGxluCYzkue9kaf6gPwOUAE9jpv0LNJV2FJJ6alUF3QN42Eq9yk9HvZ4ybXBl4pfBB8bgSXEQceYjdfl/PwQ5VrTmzhuwcsqFo35XWLZ42mdUO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785872637; c=relaxed/simple;
	bh=HuS4+qi5c4IQX97JzTFUD5jBTCqgceGOAX/E5u/PVO8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bj5WhfTEfPLLuiywP5QsGjmoQ6QUp5ZEsAYbwLbWk990TRn3INGKYPQ9EJy8vcPqY6T8SvpPIhXMDX2QOopegLM517waCWipro7f7VzYpnV43fPhS9vLIZHcuSFlMYwab+f6DUONbyJ8wbrhOq+lgjO6Ix9U01t1AfUAJZ5Kl40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KN6LMu51; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KN6LMu51"
Received: from [192.168.0.240] (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C86D9258D;
	Tue,  4 Aug 2026 21:42:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785872556;
	bh=HuS4+qi5c4IQX97JzTFUD5jBTCqgceGOAX/E5u/PVO8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KN6LMu51jcTjrMPnH5l1CCSYiV7QQRJ8s0N6FXMeqVk/PGzBCDb/Guhv0udiRP2+C
	 uzNLp/i2hQgzX6VhEOxqoQBGnKloTPIQG/3FGsVwwiFzwCqtHkpzSWHfzAClXzkTqE
	 tRj+Jh7BrmvfqH0hhBO9A1DKBC3K4z3xcza4MbAg=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Tue, 04 Aug 2026 20:43:30 +0100
Subject: [PATCH v4 3/7] arm64: dts: freescale: Convert to new media
 orientation definitions
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-kbingham-orientation-v4-3-336998dd63b4@ideasonboard.com>
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
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 David Heidelberg <david@ixit.cz>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785872619; l=2424;
 i=kieran.bingham@ideasonboard.com; s=20260204; h=from:subject:message-id;
 bh=HuS4+qi5c4IQX97JzTFUD5jBTCqgceGOAX/E5u/PVO8=;
 b=jPm+VdAr2LX4uKlbCGOOt3PM4pLDOTA63HG3h4fdSqtnBYK/KqcPCAr/oWpWOzmFSDoEXJoKS
 BxNNiDeJTT3C4KfUxkhbzPCW44f81o2DriB72lzkUYmSIe4KQlWPCQ4
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=IOxS2C6nWHNjLfkDR71Iesk904i6wJDfEERqV7hDBdY=

The orientation property for video interface devices now has definitions
to prevent hardcoded integer values for the enum options.

Update the users throughout the freescale/NXP device trees to use the new
definitions.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 .../boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso      | 3 ++-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi                      | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso
index e5a2b3780215dfd5fbf4a26ce8dcd0ee72807008..7b44ae0f19b23ac856fbaeae439fe8d351896ae8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso
@@ -9,6 +9,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/media/video-interface-devices.h>
 
 #include "imx8mp-pinfunc.h"
 
@@ -47,7 +48,7 @@ camera@10 {
 		VANA-supply = <&reg_cam>;
 		VDIG-supply = <&reg_cam>;
 		VDDL-supply = <&reg_cam>;
-		orientation = <2>;
+		orientation = <MEDIA_ORIENTATION_EXTERNAL>;
 		rotation = <0>;
 
 		port {
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index f5d529c5baf3e6848372d9b712acf3664dd2206e..178cfad9348350111cbbd20e02ac082115ecca28 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -8,6 +8,7 @@
 #include "dt-bindings/input/input.h"
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include "dt-bindings/pwm/pwm.h"
 #include "dt-bindings/usb/pd.h"
 #include "imx8mq.dtsi"
@@ -1116,7 +1117,7 @@ camera_front: camera@20 {
 		vddd-supply = <&reg_vcam_1v2>;
 		vddio-supply = <&reg_csi_1v8>;
 		rotation = <90>;
-		orientation = <0>;
+		orientation = <MEDIA_ORIENTATION_FRONT>;
 
 		port {
 			camera1_ep: endpoint {

-- 
2.53.0

