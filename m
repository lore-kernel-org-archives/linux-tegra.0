Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C2533C198;
	Sun, 28 Jun 2026 10:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782642156; cv=none; b=sigmOg2MrxNO6Jqx8oGZcEmj4/Rm5F9aWSxDMZtsF+uAeryECmENR8EZ8YFpC8pS+/ryhzZEPs4ubDv2rRpwR+x0P+yB43GYWysI6m+x+eDK/Ez9tb1uvPabQaRVtbEi+vjcRg6pRmbWb3el72BxmAk4MbxQyY9O9h+OlDO2cAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782642156; c=relaxed/simple;
	bh=7y9Ig967zjmx7XQcheiM9Gd7GovmRxC1ZDoPjmG+ZUg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=muESBoYYooIVWXO2vYkI4E0zHnyu+H/ufd1A6hbaMpWr/tlsJMMRgtIropMX6Kt79zSjJ46C6gTAkWzqWa9dUGEfb5gMjR8cMG4mWrX/bfJ4SxEHAakeKE5bgu1Lw3L2yqCCCoxyKPNWdNBJVfN15lxO8nhyIdCLP3Kubhowysc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=St+jCdld; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="St+jCdld"
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F04228FD;
	Sun, 28 Jun 2026 12:21:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782642100;
	bh=7y9Ig967zjmx7XQcheiM9Gd7GovmRxC1ZDoPjmG+ZUg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=St+jCdldAWgz2Z+6sSW/SWinkXWNEbDVDTAYnbA4JozdHm7rjhDMvont0j3M+ZPCw
	 7jQT/dHAM/ulG/i/Gp6EZJ5LTtcc50Qr8BB5US+InJy4Mu5cNMVlHfEK99+124ocZR
	 T0B601YysTTEjzfoyGE1WWzdf5XxrwjG0xwcLNK8=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Sun, 28 Jun 2026 11:22:16 +0100
Subject: [PATCH v3 1/7] dt-bindings: media: Add macros for video interface
 devices
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-kbingham-orientation-v3-1-4ed92968aff8@ideasonboard.com>
References: <20260628-kbingham-orientation-v3-0-4ed92968aff8@ideasonboard.com>
In-Reply-To: <20260628-kbingham-orientation-v3-0-4ed92968aff8@ideasonboard.com>
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
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782642139; l=1430;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=7y9Ig967zjmx7XQcheiM9Gd7GovmRxC1ZDoPjmG+ZUg=;
 b=eQufYsQDIGtL+4HnUz0+yV6rQWXuMVHG1sw6ASM4bQLiiVHx3ygfOddeKLBdzpKhWYfUqevIR
 KGgojjfzpPYDoL3BSW3532v34rpCKLCHiE8zVy5RTOHEc9P4DtWevvq
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=

Add a new dt-bindings/media/video-interface-devices.h header that
defines macros corresponding to the orientation enumeration types from
media/video-interface-devices.yaml.

This allows avoiding hardcoded constants in device tree sources.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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

