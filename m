Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CB43F4830;
	Fri, 26 Jun 2026 12:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782475692; cv=none; b=uxlOpLuvtj42vHmS8GBxuc1TUg4QjaMHPXMR3Qr5bdRRogUlankuHrmoCvzlOBxeNkYCmgvsphmXPkpPicIymJ9q7IFV/MsJB4hWlzDeSP2PyDoNhRLGP/V1zOoRASlPvSDyIqXDkmrbXFsXc7fQx5p+5RdVH7jx0EAXzFkjwY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782475692; c=relaxed/simple;
	bh=GI0OsvgWsLUpxeXzRg6ASixJXHEZ/Y3TvGWSf93vUV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IKrYXr3r9sLZQtCrouhxG1iuQ1Qfr7AhpBWfAY8MpmtWn9vL7ULMqirSr2tGHUdyS4NOpGGUVPc93dSmM9ADtnL9jQ7sDCKsxT7HRd405KX28iCzytgn1gWbhbjebZFHk/FeIL4synb0bkOBfCh2oqcghAPTYEs70nguTiXg734=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PZ2p9Unr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PZ2p9Unr"
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37C43174;
	Fri, 26 Jun 2026 14:07:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782475641;
	bh=GI0OsvgWsLUpxeXzRg6ASixJXHEZ/Y3TvGWSf93vUV8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PZ2p9UnrlBaSJenZ5vxag+R2mqD/RJcYYUahYuW+ZMc8Ky4YHEh2BpfHJRrSMilU0
	 3io68XUdayiJfOw7H+cSD/dqced6nRo9wjYHSKE+HjgPvmHyRI3GRLWj4OwWMHexS4
	 JsQ5BL176aWz6tgTtZXeBA+VDG8LJJJBvOhc5vBE=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 26 Jun 2026 13:07:53 +0100
Subject: [PATCH v2 1/8] dt-bindings: media: Add macros for video interface
 devices
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-kbingham-orientation-v2-1-47178be927b4@ideasonboard.com>
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
 Conor Dooley <conor.dooley@microchip.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782475679; l=1323;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=GI0OsvgWsLUpxeXzRg6ASixJXHEZ/Y3TvGWSf93vUV8=;
 b=22v2XSR4+brmkePbu4pThG9OpBjUPIQrDSfCtf8UD+LAeRR4Kam87sv6T9voxy/f9IIXxWeXC
 MCO85UL5gLbCD+LrHig6hrAk1TX4FrlGCXB/EWC3+jobKyelDjccn6i
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=

Add a new dt-bindings/media/video-interface-devices.h header that
defines macros corresponding to the orientation enumeration types from
media/video-interface-devices.yaml.

This allows avoiding hardcoded constants in device tree sources.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 include/dt-bindings/media/video-interface-devices.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/dt-bindings/media/video-interface-devices.h b/include/dt-bindings/media/video-interface-devices.h
new file mode 100644
index 000000000000..d2340b457292
--- /dev/null
+++ b/include/dt-bindings/media/video-interface-devices.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (C) 2026 Kieran Bingham <kieran.bingham@ideasonboard.com>
+ */
+
+#ifndef __DT_BINDINGS_MEDIA_VIDEO_INTERFACE_DEVICES_H__
+#define __DT_BINDINGS_MEDIA_VIDEO_INTERFACE_DEVICES_H__
+
+#define MEDIA_ORIENTATION_FRONT		0
+#define MEDIA_ORIENTATION_BACK		1
+#define MEDIA_ORIENTATION_EXTERNAL	2
+
+#endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACE_DEVICES_H__ */

-- 
2.52.0

