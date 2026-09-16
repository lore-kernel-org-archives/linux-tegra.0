Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326235013C2;
	Wed, 16 Sep 2026 13:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789566375; cv=none; b=CzJIQ/1XfBlbBww9RHub9mHmbe9hHLnvU7rqEKVLz+F2nf7fRW7T1Q7DG4nJrMeGexY+QngO3UsZXwqRlwpwUVEgC8Ar0sNeTWCmt2ZV8RkdvA0QP/4nBkTc/86AuUOnIBE5XpaKhW/o69DdGYTRcmfjVPB5JA+K3+drW8QmQbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789566375; c=relaxed/simple;
	bh=lowFXRl4NuwAH0zVYf5fuhzFyt09+gJnt69COrToQZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nEG1Ur0HN6OwkFA7qMGBO7NguqDZsTFT/2YhyfnfheJb1ZofVyYbNfyGF8qmFztJfrk07hw6ieKFDN7OLAPkhl/aZMAp/LHRGb4xUzeME9schtpaE1hnBayldsVyJGQyb6E2ISPpiwRTBG7EuAU05Bu1rZdT7upt4MnU8YXItgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZPALrDjd; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZPALrDjd"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 786014E40747;
	Wed, 16 Sep 2026 13:46:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 47AEF60337;
	Wed, 16 Sep 2026 13:46:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F028A11C7B031;
	Wed, 16 Sep 2026 15:45:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789566358; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VGcTy6f0Ll8C9rnyFjUhYOXAZUo1mPpaSmiZJ/9wm2c=;
	b=ZPALrDjdz3TB141LdfvYONuMS9LDNcQYGrg3ty0iQvv7KwogBRI0eE7pVTXCe6Ixe+SL2D
	CXjLjjWG1o9Vc1yKPc30O3KleM6ArW51aNq/J9FXVIBJDwUkpVE8qVALVSbnuDHdLccss5
	j2CoC4X67Jitr5IlOzGHmeNdK9zINGThF/ZyVFBVVMpyP4bVAU2e1QVL0FNBD0fmNWoP4Q
	nZ8hK0LPfdV1A+6KjGAX6SyncA/GvCUMiVv8MEmnHhs6HlKvS9t7r6NJAOwqgJMBN5ZqpB
	x46HaF0f3PjSEuKtjUSLi3UKYzAUSdD5geWD9bEASgDaS1595E3yQRVAYgkaQw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 16 Sep 2026 15:45:26 +0200
Subject: [PATCH v3 02/19] drm: of: remove now unnecessary forward
 declarations
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-drm-bridge-every-panel-v3-2-83afb4f1a707@bootlin.com>
References: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com>
In-Reply-To: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
 Paul Kocialkowski <paulk@sys-base.io>, Linus Walleij <linusw@kernel.org>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Sean Paul <sean@poorly.run>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Albert Esteve <aesteve@redhat.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, asahi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

These forward declarations are now redundant after having moved
drm_of_find_panel_or_bridge():

 * struct drm_panel is not referenced in this file

 * struct drm_bridge is now referenced only inside an

      #if IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_DRM_PANEL_BRIDGE)

   block, and in this case struct drm_bridge is already declared thanks to
   these lines:

      #if IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_DRM_PANEL_BRIDGE)
      ...
      #include <drm/drm_bridge.h>
      #endif

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 include/drm/drm_of.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index 402f5db11e47..f6dad2c6e9b9 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -14,8 +14,6 @@ struct component_match;
 struct device;
 struct drm_device;
 struct drm_encoder;
-struct drm_panel;
-struct drm_bridge;
 struct device_node;
 struct mipi_dsi_device_info;
 struct mipi_dsi_host;

-- 
2.55.0

