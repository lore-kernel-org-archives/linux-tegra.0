Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABE12FDC5E;
	Sun, 28 Jun 2026 10:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782642164; cv=none; b=T1ub864nNqmUl543Vqf5vFjnUhl7IUUIi6T/er3UNpLs6Bwg3FHQYxVjbJfpnq79hurta0eGt4HXYswt82olq6C0fIm1WlyKX9Zttqq1WPizVYLx+UNK9onMSxZ9f+nvsn7xLBHiPWrG2jmaMVJgvg4lLPGL61nwmLKCFMBLxzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782642164; c=relaxed/simple;
	bh=UHzs5h1vqIyZpZgqg+2ewdEQWX0v5SbmO7TA7HMs/v4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L/e36hIVQCxTHhOE1mc/kVma0IhBb5z9U8wvPejhUGdcSjYUl6sQVktvaaGxSrgLBSuzUynfvmIo2toxh4xVKXNeqLRmNWs62ZKmI4wSqBvTCqMT7ca6FhjoySMPO7VyHpB6DNEexicGemaMs7C8VFKCvkoumQCblIaEsD5Kt0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ruc+K7Jg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ruc+K7Jg"
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9893E99F;
	Sun, 28 Jun 2026 12:21:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782642102;
	bh=UHzs5h1vqIyZpZgqg+2ewdEQWX0v5SbmO7TA7HMs/v4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ruc+K7Jg9vWakwg3Rfa0ZfI0F9W84leQdv1g+BftZ0q/TkLokW82sNL8E/Zopv47K
	 pWLAbBYZRSFqMCLlQT9Eg+Pth96lSJO/WTaqkWPKwGO+NVdB/3AtKXm81/U22D3gKh
	 pwMja/3YMNX0F4Y2n+WG2c1wZ/f7VEihocUYp2WQ=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Sun, 28 Jun 2026 11:22:17 +0100
Subject: [PATCH v3 2/7] media: dt-bindings: video-interface-devices: add
 video-interface-devices.h references
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-kbingham-orientation-v3-2-4ed92968aff8@ideasonboard.com>
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
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782642139; l=2444;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=UHzs5h1vqIyZpZgqg+2ewdEQWX0v5SbmO7TA7HMs/v4=;
 b=KT6apJA/GtGNIVhQ5eW/HBAjZTb30RnYg9LvUG9miUzlOCp29AZgehi/Vh38BX3/9VXkb6fgm
 viFFx3Wbqc9BGC65P1tWJOd+C0Fs37P8lc0ghGGDmGC2iE2wnGpnJMn
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=

Expand the documentation of the video-interface-devices orientation to
reference the include/dt-bindings/media/video-interface-devices.h header
which provides human readable defines for the orientation enum, to help
avoid hardcoding values in dts.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 .../bindings/media/video-interface-devices.yaml         | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/video-interface-devices.yaml b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
index a81d2a155fe6..c9c3f4f16719 100644
--- a/Documentation/devicetree/bindings/media/video-interface-devices.yaml
+++ b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
@@ -392,17 +392,22 @@ properties:
       The orientation of a device (typically an image sensor or a flash LED)
       describing its mounting position relative to the usage orientation of the
       system where the device is installed on.
+      See include/dt-bindings/media/video-interface-devices.h.
+
     $ref: /schemas/types.yaml#/definitions/uint32
     enum:
-        # Front. The device is mounted on the front facing side of the system. For
-        # mobile devices such as smartphones, tablets and laptops the front side
-        # is the user facing side.
+        # MEDIA_ORIENTATION_FRONT
+        # The device is mounted on the front facing side of the system. For
+        # mobile devices such as smartphones, tablets and laptops the front
+        # side is the user facing side.
       - 0
-        # Back. The device is mounted on the back side of the system, which is
+        # MEDIA_ORIENTATION_BACK
+        # The device is mounted on the back side of the system, which is
         # defined as the opposite side of the front facing one.
       - 1
-        # External. The device is not attached directly to the system but is
-        # attached in a way that allows it to move freely.
+        # MEDIA_ORIENTATION_EXTERNAL
+        # The device is not attached directly to the system but is attached in
+        # a way that allows it to move freely.
       - 2
 
 additionalProperties: true

-- 
2.52.0

