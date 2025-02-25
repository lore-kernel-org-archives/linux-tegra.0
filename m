Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E2E21421A
	for <linux-tegra@vger.kernel.org>; Tue, 25 Feb 2025 22:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740522119; cv=none; b=FOMVQHBqDrXHvXeEiyJLEsYpU/Kb8X4dAhCC7O9hdODQGzWeg1XhNJU5ehBr/Z0BEN5f8CIaWghsbI0SerC+Vu3NWRCMMj0unKFkFsnJC3VvrnU8eNGcYYQ2Jp2Rgflhq6Aqr5G89gzvJmBZ5956HSIjSYlZt3TGDyK7VqWhWzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740522119; c=relaxed/simple;
	bh=+h+zwJrqhz4KcKBFOtg5ltWWvHHlCjpJOJiBG2cNAao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HEME5FEp2gaJiiTxI5JjD4jDGD2V6qAZIW1v0A2x7xRpHVS5/quLf+igmQ2OJYaLF+W8TIoE+zC5SzO27wITOMYs99MMdPF3pZQGfoJpIkdsWQ8RJe0DP3OVGAYVOGWAiXC2uXKGHxuKGhwoNGmA2O57nMmKgCZl60xqdEsL+WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZN2mdgAF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZN2mdgAF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740522116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kpyWlOaModCxFl+Tqqpp85hFGJYXyqIGL3Cy6JBVo+g=;
	b=ZN2mdgAFQoD67l6qgmbWZpsu6CwZ02Gryw5BLoKUt1Qp3ytyBJRjl1KCdwXSNjBa1wMPH2
	7KobnBD5gtgkLEZIkTvD9YL/kChCpD9WLAtK4R7QQ6CdsR3b8R4hPhPCBLlOOv+/61/Tjt
	L1idUWMkQDq/XPus2E3/S1zrrK/1+8A=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-588-e2kiOPWbO2KHndIn8cGFRQ-1; Tue,
 25 Feb 2025 17:21:55 -0500
X-MC-Unique: e2kiOPWbO2KHndIn8cGFRQ-1
X-Mimecast-MFC-AGG-ID: e2kiOPWbO2KHndIn8cGFRQ_1740522114
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4418919039C1
	for <linux-tegra@vger.kernel.org>; Tue, 25 Feb 2025 22:21:54 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.79])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 07B12180035F;
	Tue, 25 Feb 2025 22:21:44 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 25 Feb 2025 17:20:46 -0500
Subject: [PATCH RESEND 05/12] drm/mxsfb: move to
 devm_platform_ioremap_resource() usage
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-memory-drm-misc-next-v1-5-9d0e8761107a@redhat.com>
References: <20250225-memory-drm-misc-next-v1-0-9d0e8761107a@redhat.com>
In-Reply-To: <20250225-memory-drm-misc-next-v1-0-9d0e8761107a@redhat.com>
To: Joel Stanley <joel@jms.id.au>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Alexey Brodkin <abrodkin@synopsys.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, 
 linux-doc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740522045; l=2524;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=+h+zwJrqhz4KcKBFOtg5ltWWvHHlCjpJOJiBG2cNAao=;
 b=k+LJjuc8ROIZ94VcX2vJBYoSZVLRroxcG4/mX7Ow5YRn2etCmM+Q7u1YmoWhA+q5GPKLk/sq8
 Mmua5UaO4QXCZYG7SAUnmnYGEXvMwqhAWGkBzsIQqT0LS2AQdLILv0U
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Replace platform_get_resource + devm_ioremap_resource
with just devm_platform_ioremap_resource()

Used Coccinelle to do this change. SmPl patch:
@rule_1@
identifier res;
expression ioremap_res;
identifier pdev;
@@
-struct resource *res;
...
-res = platform_get_resource(pdev,...);
-ioremap_res = devm_ioremap_resource(...);
+ioremap_res = devm_platform_ioremap_resource(pdev,0);

Cc: Marek Vasut <marex@denx.de>
Cc: Stefan Agner <stefan@agner.ch>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/mxsfb/lcdif_drv.c | 4 +---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index 8ee00f59ca821cea8e823e7100fb4d7534283994..fcb2a7517377e9a5bbd2997c578c579b1b079f92 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -134,7 +134,6 @@ static int lcdif_load(struct drm_device *drm)
 {
 	struct platform_device *pdev = to_platform_device(drm->dev);
 	struct lcdif_drm_private *lcdif;
-	struct resource *res;
 	int ret;
 
 	lcdif = devm_kzalloc(&pdev->dev, sizeof(*lcdif), GFP_KERNEL);
@@ -144,8 +143,7 @@ static int lcdif_load(struct drm_device *drm)
 	lcdif->drm = drm;
 	drm->dev_private = lcdif;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	lcdif->base = devm_ioremap_resource(drm->dev, res);
+	lcdif->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(lcdif->base))
 		return PTR_ERR(lcdif->base);
 
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 59020862cf65e5cc488903f1263ed16dfbce06f9..377d4c4c9979ad9538cfec5464827a82936f811b 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -215,7 +215,6 @@ static int mxsfb_load(struct drm_device *drm,
 {
 	struct platform_device *pdev = to_platform_device(drm->dev);
 	struct mxsfb_drm_private *mxsfb;
-	struct resource *res;
 	int ret;
 
 	mxsfb = devm_kzalloc(&pdev->dev, sizeof(*mxsfb), GFP_KERNEL);
@@ -226,8 +225,7 @@ static int mxsfb_load(struct drm_device *drm,
 	drm->dev_private = mxsfb;
 	mxsfb->devdata = devdata;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mxsfb->base = devm_ioremap_resource(drm->dev, res);
+	mxsfb->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mxsfb->base))
 		return PTR_ERR(mxsfb->base);
 

-- 
2.48.1

