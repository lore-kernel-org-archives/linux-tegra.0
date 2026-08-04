Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513633BCD3C;
	Tue,  4 Aug 2026 19:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785872629; cv=none; b=GeStt3tZr4wBOP7q4/nO7lWjiiGRnxi31WV7m/Mo1g2Hka+MVsoga/OcgruPmyoMAkyn5r/RzCE6laLML5KFuv/BL8mgnZJ3Q8dGcd0s2nMOQRgrNEA5eokbXUZJEjmvFL/E/rwV/qq98UsewKIUfOwYxD2IT0kCvjo0+s6TDpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785872629; c=relaxed/simple;
	bh=VpQc8qfp9veoR00W6ImThqn1v33YFOWVIw8lQ9hq2es=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=T2fGP7vaoRjgnHpNj5dlNXwNDbzO0+qVgFqo+m+y9UMBoNmUhFCJyzdz9oQYSWpqWH40QCD/TYHc7MsH296N5FI5kBD0vxjisYuJ+w51HwKrQwS8/qBFV2zz1crVK4sIuPnwOxrWgFSKQyAZk6Mb2I8QuJpr2+VXJQle9vi/CHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MKVMA+GJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MKVMA+GJ"
Received: from [192.168.0.240] (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D6291E2A;
	Tue,  4 Aug 2026 21:42:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785872551;
	bh=VpQc8qfp9veoR00W6ImThqn1v33YFOWVIw8lQ9hq2es=;
	h=From:Subject:Date:To:Cc:From;
	b=MKVMA+GJ07Jfu1h8DOsXnqE30i8Mbkv5+7ii3cohjJ/3ncETcrhWtwxFEVHirSBH7
	 MlKHkpXDHeq1kkXnx8lqPr+RI6NhqgrsNBt71W1xKREe3G49X3sKsqFmhYC0JyKMNp
	 mssr57BWKwJrieJ116EgQxLrgeUhYmMTxpBIXf4k=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v4 0/7] dt-bindings: Orientation defines
Date: Tue, 04 Aug 2026 20:43:27 +0100
Message-Id: <20260804-kbingham-orientation-v4-0-336998dd63b4@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBBFr0JmbU2d1BZceQ/DooUBJoaWtIRoS
 O9uJS5dvp+893dIFJkS3KodIm2cOPgC6lRBN1k/kuC+MKBELbWsxdOxHyc7i1A8v9q1CAKlHTo
 5ON1cDRR1iTTw68g+2sITpzXE9/Gy4Xf9BVH/D24opFDmYmpHDRqn7tyTTcG7YGN/7sIMbc75A
 73Xr1W/AAAA
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
 linux-tegra@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 David Heidelberg <david@ixit.cz>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785872619; l=4772;
 i=kieran.bingham@ideasonboard.com; s=20260204; h=from:subject:message-id;
 bh=VpQc8qfp9veoR00W6ImThqn1v33YFOWVIw8lQ9hq2es=;
 b=7SZI39Py8ffrjnJh1y+hbhPXUnOWY+ZaEQ9KftTGB56v0gDSekjQfN+0f3X93k5+YJyrHR9/v
 6RTih1fHC9hD9EvsNdHgSXZpfBshb35aOAVlwCQ6l78f3XdO0TqxsmD
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=IOxS2C6nWHNjLfkDR71Iesk904i6wJDfEERqV7hDBdY=

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

---
Kieran Bingham (7):
      dt-bindings: media: Add macros for video interface devices
      dt-bindings: media: i2c: Utilise video-interface-devices enums
      arm64: dts: freescale: Convert to new media orientation definitions
      arm64: dts: qcom: Convert to new media orientation definitions
      arm64: dts: renesas: Convert to new media orientation definitions
      arm64: dts: rockchip: Convert to new media orientation definitions
      ARM: tegra: Convert to new media orientation definitions

 .../devicetree/bindings/media/i2c/hynix,hi846.yaml      |  3 ++-
 .../devicetree/bindings/media/i2c/ovti,ov08d10.yaml     |  3 ++-
 .../devicetree/bindings/media/i2c/ovti,ov4689.yaml      |  3 ++-
 .../devicetree/bindings/media/i2c/ovti,ov5675.yaml      |  3 ++-
 .../devicetree/bindings/media/i2c/ovti,ov5693.yaml      |  3 ++-
 .../devicetree/bindings/media/i2c/ovti,ov64a40.yaml     |  3 ++-
 .../devicetree/bindings/media/i2c/sony,imx111.yaml      |  3 ++-
 .../devicetree/bindings/media/i2c/sony,imx355.yaml      |  3 ++-
 .../devicetree/bindings/media/i2c/sony,imx415.yaml      |  3 ++-
 .../devicetree/bindings/media/i2c/st,vd55g1.yaml        |  3 ++-
 .../devicetree/bindings/media/i2c/st,vd56g3.yaml        |  3 ++-
 .../devicetree/bindings/media/i2c/thine,thp7312.yaml    |  3 ++-
 .../bindings/media/video-interface-devices.yaml         | 17 +++++++++++------
 .../dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi  |  3 ++-
 .../dts/nvidia/tegra30-asus-transformer-common.dtsi     |  3 ++-
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts            |  4 +++-
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi             |  3 ++-
 .../imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso          |  3 ++-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi       |  3 ++-
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts      |  3 ++-
 .../boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  3 ++-
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi      |  3 ++-
 .../renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso |  3 ++-
 .../renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso |  3 ++-
 .../renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso |  3 ++-
 .../renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso |  3 ++-
 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi           |  3 ++-
 .../dts/rockchip/px30-ringneck-haikou-video-demo.dtso   |  3 ++-
 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts   |  5 +++--
 .../rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso  |  3 ++-
 .../rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso  |  3 ++-
 include/dt-bindings/media/video-interface-devices.h     | 13 +++++++++++++
 32 files changed, 86 insertions(+), 37 deletions(-)
---
base-commit: 31152f5b0f8719f92063b8c6196cd5e34106c73d
change-id: 20260608-kbingham-orientation-20afc0fb6957

Best regards,
-- 
Kieran Bingham <kieran.bingham@ideasonboard.com>

