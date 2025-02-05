Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFAA212B01
	for <linux-tegra@vger.kernel.org>; Wed,  5 Feb 2025 20:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738786288; cv=none; b=AXbgR5uNX/WyXOqHNbxkt5/fIgGi6AL8p0iiv2EEzy8+Y/veIbTccOPJJ5AFZqSVyOi0uvEu2e9GeYAyKx/lOeRtsInKP3R9ZsFgJ/CMKv6qmeHVgY90TVzG3w7LLfxvU7H5lcdkOu9hQJpBBvbe1h3ROLvWfFaTq2wuIR5vWDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738786288; c=relaxed/simple;
	bh=cGR+PxRoxuebICENqHulDwycMVIkKhLPFIEGSESALX8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tr70qXXguNuczCTwcg2ZatKPR94dn5mRKrJ1MSYoJAxP8O8Re0rRS68UrOJBbrWmCKS57jdbmxZDSQ4u42VRIzG7K9r/rpg32C/4rOZUchUNDw3ia7XG8BhS10VRodMYuUVC7oskS64qgBZIxBvxEeERtEspIYqOd3WBMwYZBHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=REKngc2T; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="REKngc2T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738786285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8SyjCwbf1S+bcTHNMqbzrT6yhS3x+rdZOVYONTdbbck=;
	b=REKngc2TzXy+9mENtNWxEIflFK2YqP0yIWa9LieKzsJVRZ7eBw5YFVqOyGxHAaeyd0D9hU
	s6Ac4r7hg/fNhL+e6hv9295IMUldDfrDz/0Pt4gTRcWVI17AZRKS5Lh5AlUF5WIj7uuvHt
	hE3ymfDq6RqWZ5mh7d0S5ty3mOIkwEE=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-80-AWQ7tzLjOAaXW9NmuB0QCg-1; Wed,
 05 Feb 2025 15:11:20 -0500
X-MC-Unique: AWQ7tzLjOAaXW9NmuB0QCg-1
X-Mimecast-MFC-AGG-ID: AWQ7tzLjOAaXW9NmuB0QCg
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 25FB81955BED;
	Wed,  5 Feb 2025 20:11:18 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.21])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 101D519560A3;
	Wed,  5 Feb 2025 20:11:07 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 05 Feb 2025 15:08:07 -0500
Subject: [PATCH 11/12] drm/vc4: move to devm_platform_ioremap_resource()
 usage
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250205-mem-cocci-newapi-v1-11-aebf2b0e2300@redhat.com>
References: <20250205-mem-cocci-newapi-v1-0-aebf2b0e2300@redhat.com>
In-Reply-To: <20250205-mem-cocci-newapi-v1-0-aebf2b0e2300@redhat.com>
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
 Fabio Estevam <festevam@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Orson Zhai <orsonzhai@gmail.com>, 
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
 linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, 
 linux-doc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738786137; l=4051;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=cGR+PxRoxuebICENqHulDwycMVIkKhLPFIEGSESALX8=;
 b=xxdVwBWLuMEiypVjDD+SjdlJr+E3FmnnKe4+6mwyq3Jsp3b2JeAXfuUeFeYrD9tkleRyn4M2I
 gZ+0ny1k2KkDDtUMVDgoa4/Gelwzs4xPuw9i9ORgjvf4Shdft9gP0bC
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Replace platform_get_resource_byname + devm_ioremap_resource
with just devm_platform_ioremap_resource()

Used Coccinelle to do this change. SmPl patch:
//rule s/(devm_)platform_get_resource_byname +
//(devm_)ioremap/devm_platform_ioremap_resource.
@rule_3@
identifier res;
expression ioremap;
identifier pdev;
constant mem;
expression name;
@@
-struct resource *res;
<+...
-res = platform_get_resource_byname(pdev,mem,name);
<...
-if (!res) {
-...
-}
...>
-ioremap = devm_ioremap(...);
+ioremap = devm_platform_ioremap_resource_byname(pdev,name);
...+>

v2: Change the SmPl patch to work on multiple occurences of
the pattern. This also fixes the compilation error.

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 55 +++++++++++-------------------------------
 1 file changed, 14 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 47d9ada98430634cfd8c1e21c2a4d00d501bab7e..066f1246dab420ee889845b0c573d80ce7c88595 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2951,71 +2951,44 @@ static int vc5_hdmi_init_resources(struct drm_device *drm,
 {
 	struct platform_device *pdev = vc4_hdmi->pdev;
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	int ret;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hdmi");
-	if (!res)
-		return -ENODEV;
-
-	vc4_hdmi->hdmicore_regs = devm_ioremap(dev, res->start,
-					       resource_size(res));
+	vc4_hdmi->hdmicore_regs = devm_platform_ioremap_resource_byname(pdev,
+									"hdmi");
 	if (!vc4_hdmi->hdmicore_regs)
 		return -ENOMEM;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hd");
-	if (!res)
-		return -ENODEV;
-
-	vc4_hdmi->hd_regs = devm_ioremap(dev, res->start, resource_size(res));
+	vc4_hdmi->hd_regs = devm_platform_ioremap_resource_byname(pdev, "hd");
 	if (!vc4_hdmi->hd_regs)
 		return -ENOMEM;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cec");
-	if (!res)
-		return -ENODEV;
-
-	vc4_hdmi->cec_regs = devm_ioremap(dev, res->start, resource_size(res));
+	vc4_hdmi->cec_regs = devm_platform_ioremap_resource_byname(pdev,
+								   "cec");
 	if (!vc4_hdmi->cec_regs)
 		return -ENOMEM;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "csc");
-	if (!res)
-		return -ENODEV;
-
-	vc4_hdmi->csc_regs = devm_ioremap(dev, res->start, resource_size(res));
+	vc4_hdmi->csc_regs = devm_platform_ioremap_resource_byname(pdev,
+								   "csc");
 	if (!vc4_hdmi->csc_regs)
 		return -ENOMEM;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dvp");
-	if (!res)
-		return -ENODEV;
-
-	vc4_hdmi->dvp_regs = devm_ioremap(dev, res->start, resource_size(res));
+	vc4_hdmi->dvp_regs = devm_platform_ioremap_resource_byname(pdev,
+								   "dvp");
 	if (!vc4_hdmi->dvp_regs)
 		return -ENOMEM;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "phy");
-	if (!res)
-		return -ENODEV;
+	vc4_hdmi->phy_regs = devm_platform_ioremap_resource_byname(pdev,
+								   "phy");
 
-	vc4_hdmi->phy_regs = devm_ioremap(dev, res->start, resource_size(res));
 	if (!vc4_hdmi->phy_regs)
 		return -ENOMEM;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "packet");
-	if (!res)
-		return -ENODEV;
-
-	vc4_hdmi->ram_regs = devm_ioremap(dev, res->start, resource_size(res));
+	vc4_hdmi->ram_regs = devm_platform_ioremap_resource_byname(pdev,
+								   "packet");
 	if (!vc4_hdmi->ram_regs)
 		return -ENOMEM;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "rm");
-	if (!res)
-		return -ENODEV;
-
-	vc4_hdmi->rm_regs = devm_ioremap(dev, res->start, resource_size(res));
+	vc4_hdmi->rm_regs = devm_platform_ioremap_resource_byname(pdev, "rm");
 	if (!vc4_hdmi->rm_regs)
 		return -ENOMEM;
 

-- 
2.47.0

