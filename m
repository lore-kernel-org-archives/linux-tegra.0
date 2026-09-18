Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72A94C10C9;
	Fri, 18 Sep 2026 10:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789728269; cv=none; b=pCQ88NRwz6a9KcGqRu+H4Q7L6dMpHZQTIpR3FSnydO8gSpM8K/TEXVD79KEfC3PR4Hsc6fNYNGw1IG4bnpHUtLjfeH1jG0OB3JAf+QN1vSR2eR8wp6K3mZf84Su9/u7BkgfYmUVlDRQKDU63Aqk1vUNaK+Ei4ESXRtXOTI8v++o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789728269; c=relaxed/simple;
	bh=ILvl/y5sag2JhhGEy9CngiSkng7+/GuEan+czF6epJE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=meTM6JZ9AwiKX4JjFdYXIaDr5F8jGuYCs/QD7RjYz1y8EK+T4oaS2kMOgQchSe1ZB0oGWBpVMielHOj5zwrypi8Mqi1CxJExXwx9NaO8zzE99SNJ3g/eJlxGncJ3bbIN/e3PQ4jXwSc1a1TiRvzEgmb9BDgZQl1NgkaNt4Kafog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iAVGcdDj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iAVGcdDj"
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 114004D3A;
	Fri, 18 Sep 2026 12:42:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789728156;
	bh=ILvl/y5sag2JhhGEy9CngiSkng7+/GuEan+czF6epJE=;
	h=From:Subject:Date:To:Cc:From;
	b=iAVGcdDjAmFpEsC9Td2frqmEvWpKTMW3EQaCb57qiLWT4gLDoCiNu0+TZM7NqQQHI
	 TzjeRyqjdYCFjbloJLdlVGFwt+tWvmao2xLzdNtxerqd8uetQMiAHpy4NWHucZ6N+K
	 OFiO0qaI2HrDAvx0Kzs3LWbKePWhuVp7pJHHKI8Y=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v6 0/6] dt-bindings: Orientation defines
Date: Fri, 18 Sep 2026 11:44:12 +0100
Message-Id: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPwVrWoC/3XP3wqDIBgF8FcJr+cwNf/sau8xdqFpJSMdGrIRv
 fssBt3U5fng/A7fDJKNziZwq2YQbXbJBV8Cu1SgHZTvLXSmZIARZoghAV/a+X5QIwyl5yc1lQL
 ESHUt6jSTDQel+o62c5+NfTxLHlyaQvxuKxmv1z+I2TGYMUSQ8poLbSXmmt6dsSoFr4OK5tqGE
 axuprslED2xaLEIYVIKYxg5tZrdkvXJo7kplq1VTSjBTApxYC3L8gN/cymVVwEAAA==
X-Change-ID: 20260608-kbingham-orientation-20afc0fb6957
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
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 David Heidelberg <david@ixit.cz>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789728257; l=4409;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=ILvl/y5sag2JhhGEy9CngiSkng7+/GuEan+czF6epJE=;
 b=3/FgQrQgkYY9+ZjpzZq1dETbFJvszDKs87yfCdXr2I0lYwhXFsJToiHbUXijlDMrTaFlD+xlf
 s5fOZcP1vEtBidRUHLxo4Vz0vOlwKNShbAwoZ8nArFmRvis50UNKWa4
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=

Add a new dt-bindings/media/video-interface-devices.h header that
initially supports the Orientation types and convert existing users
throughout the code base.

v3 collects tags, and fixes the typo, but drops all hunks that do not
apply on the media-next tree so that these changes can be merged. Once
the core feature is accepted a second sweep will convert remaining (new)
additions of the orientation field.

v2:
 - Now expands from the original v1 "dt-bindings: media: Add macros for
   video interface devices" to update
   Documentation/devicetree/bindings/media/video-interface-devices.yaml
   and extend to actually change all users to the new types.
 - Link to v2: https://lore.kernel.org/r/20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com

v3:
 - Fix the arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
   MEDIA_ORIENTATION_REAR to MEDIA_ORIENTATION_BACK
   - Though this patch is dropped from this series to post the main
     integration through the media tree.
 - Drop (temporarily) changes to:
    - arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
    - arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
    - arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso
    - arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso
 - Non applying changes will be re-posted after the core feature
   lands in linux-next, or after those changes appear in media-next.

-v4:
 - Rebased media-committers/next (v7.2-rc1)
 - Reintroduced updates to:
   - arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi
   - arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
   - arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso
   - arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso
 - Squash header introduction and bindings updates
 - Link to v4: https://lore.kernel.org/r/20260804-kbingham-orientation-v4-0-336998dd63b4@ideasonboard.com

-v5:
 - Definitions now accepted in linux-media, rebased to get conversions in.
 - Converts new himax,hm1246 binding
 - Link to v5: https://lore.kernel.org/r/20260918-kbingham-orientation-v5-0-e1a134326988@ideasonboard.com

-v6:
 - Keep himax,hm1246 example as MEDIA_ORIENTATION_EXTERNAL

---
Kieran Bingham (6):
      arm64: dts: freescale: Convert to new media orientation definitions
      arm64: dts: qcom: Convert to new media orientation definitions
      arm64: dts: renesas: Convert to new media orientation definitions
      arm64: dts: rockchip: Convert to new media orientation definitions
      ARM: tegra: Convert to new media orientation definitions
      dt-bindings: media: i2c: himax,hm1246: Use video-interface-devices

 Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml        | 3 ++-
 arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi     | 3 ++-
 arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi        | 3 ++-
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts                         | 4 +++-
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi                          | 3 ++-
 .../boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso    | 3 ++-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi                    | 3 ++-
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts                   | 3 ++-
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts           | 3 ++-
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi                   | 3 ++-
 .../boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso     | 3 ++-
 .../boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso     | 3 ++-
 .../boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso     | 3 ++-
 .../boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso     | 3 ++-
 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi                        | 3 ++-
 arch/arm64/boot/dts/rockchip/px30-ringneck-haikou-video-demo.dtso    | 3 ++-
 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts                | 5 +++--
 .../boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso      | 3 ++-
 .../boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso      | 3 ++-
 19 files changed, 40 insertions(+), 20 deletions(-)
---
base-commit: aedd77ea8168f00687c1248cdf115071e869cf93
change-id: 20260608-kbingham-orientation-20afc0fb6957

Best regards,
-- 
--
Kieran

