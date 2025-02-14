Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B0B134AC
	for <linux-tegra@vger.kernel.org>; Fri, 14 Feb 2025 00:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739492460; cv=none; b=S+TXBeOtj7843h8dQ3NgwydOR9SySoPvPjr0pYsgJ0+81IgHc1gpMv6pliazSqgxJWjN0F8s8LxWTIyECm4k36Xsg8NgB2pexNy3qwOEs1GKC7eQZhoWaarAlVets4Aq07/ebeGJ8PY8q0zX59WHkdZ661lbMEdcUB1id+13tzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739492460; c=relaxed/simple;
	bh=i8LWrfxom0nQSC05REsfBXvlA+tOy6QpDxqqftn+kA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RpcW4pVNMIX/2FFGkn3KGM1DCTTpYFgqsB23xWFCfDC5Tbi5mn9cIZqhQQvcRNLcqceFZhjEN8sLVIcUAI0z3hYXcSajJFyAqkCWicdxEXfgZB6v2LMoLFaYI1ukz49A93ZF4t9XDNHquZNeLifp7Ep9W/CL7e3Htezrbqi2URk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V2GhOgUm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V2GhOgUm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739492456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vpuRtzEq0QQBKTFe7oiNde6xdrTLT6xb1c3fW35+XOM=;
	b=V2GhOgUmAzWpaTgG7pXYClKZl4Eu3IfaOKL190xg6vZvGxo2IR1E9vGF4lRBhZ+8O87E4l
	5bJ1dVhlmyH5aycyHu9VDHyBNza3Va+U9F7CS0X8ZVF+xe3Rptl7VOdq5bAOyDp2+9aMhw
	z7DqCRC+f0fl1fudMYPRZ3Ow8Xaezx8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-478-XsIYuABdMtKDo2wuxX2XZg-1; Thu,
 13 Feb 2025 19:20:55 -0500
X-MC-Unique: XsIYuABdMtKDo2wuxX2XZg-1
X-Mimecast-MFC-AGG-ID: XsIYuABdMtKDo2wuxX2XZg
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A78D51800876
	for <linux-tegra@vger.kernel.org>; Fri, 14 Feb 2025 00:20:54 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.199])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 65EF8191D7C8;
	Fri, 14 Feb 2025 00:20:45 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 13 Feb 2025 19:19:21 -0500
Subject: [PATCH 08/12] drm/stm: move to devm_platform_ioremap_resource()
 usage
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-mem-cocci-v3-v1-8-93466d165349@redhat.com>
References: <20250213-mem-cocci-v3-v1-0-93466d165349@redhat.com>
In-Reply-To: <20250213-mem-cocci-v3-v1-0-93466d165349@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739492356; l=1617;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=i8LWrfxom0nQSC05REsfBXvlA+tOy6QpDxqqftn+kA0=;
 b=ODnHfrPCdxaG+cvlimJF1bdgqI5DCS6OaKBsHAK5YPWr4Mpni0r1miA8pb0l5FvqKULISA+19
 cfaUlB7iF9zDhK/+tlgHhQD7bnbWSZd0UKCrc2LMMV6SZmEUSfLoFcf
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

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

Cc: Yannick Fertre <yannick.fertre@foss.st.com>
Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Cc: Philippe Cornu <philippe.cornu@foss.st.com>
Acked-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/stm/ltdc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 54a73753eff98902012c6012914fa8c6482affbd..ba315c66a04d72758b9d3cfcd842432877f66d3a 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -1900,7 +1900,6 @@ int ltdc_load(struct drm_device *ddev)
 	struct drm_panel *panel;
 	struct drm_crtc *crtc;
 	struct reset_control *rstc;
-	struct resource *res;
 	int irq, i, nb_endpoints;
 	int ret = -ENODEV;
 
@@ -1966,8 +1965,7 @@ int ltdc_load(struct drm_device *ddev)
 		reset_control_deassert(rstc);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ldev->regs = devm_ioremap_resource(dev, res);
+	ldev->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ldev->regs)) {
 		DRM_ERROR("Unable to get ltdc registers\n");
 		ret = PTR_ERR(ldev->regs);

-- 
2.47.0

