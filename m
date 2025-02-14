Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2758F42AB0
	for <linux-tegra@vger.kernel.org>; Fri, 14 Feb 2025 00:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739492489; cv=none; b=cBNaKHbrkArXMXYSlOG+K/avjMTOggxp/V1o8/RbI5YgIbG2iXSgVJnjVInCHxlZdrbuoZhtLXgLtUe0K1gYinV7/DL1RjlA/jV4LWYMuZ5eyRpiPXHZVLSRdRIlh6TnxUHNl6cDQn1l7YX3ziIpEmHIlJZSr9h6wp009aMq4t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739492489; c=relaxed/simple;
	bh=qNRQxkfMur7BPqwRSoUD0Y1xSb+mBLR8VcBDJdlCxGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C8XBw33CVPH418LZqOdte3xeQj5zKW2341nMdMG1fXBHrOmHr/0AWykfeac0XGn6SW3bf/AlXAo//CTfcT42C7O399+JN3k7bAsex9rkQq4pa+2YDCjsd9nftCIDdK6jePB7tdQfVcj9Gsd6i9T1V2zFQ7xQpXTRGRHiq6rd+GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HiQvoeVl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HiQvoeVl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739492487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zMrchSDjVXlMnzWa5wmPToNTzllJYTex21+BPUGzEBM=;
	b=HiQvoeVlwnYphOHYWWaJi3Yn/1U8aojB3tF76rVN9xAh4PYLbl8Rqb7H9+9oa6vSXvku8+
	nYiL2d06WP+q3P33Rx20l5d44jWsmA+iDhGRYC2iipWSQX1uf5/Ru+FLwmsnZ3d/46h5dL
	12XOqOuMdaaOfJqtR4kUKURvR61MA7Y=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-423-5kcDWJ7YMYaJ39yohxdKKw-1; Thu,
 13 Feb 2025 19:21:24 -0500
X-MC-Unique: 5kcDWJ7YMYaJ39yohxdKKw-1
X-Mimecast-MFC-AGG-ID: 5kcDWJ7YMYaJ39yohxdKKw
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6AB38180056F
	for <linux-tegra@vger.kernel.org>; Fri, 14 Feb 2025 00:21:23 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.199])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4D02619373C4;
	Fri, 14 Feb 2025 00:21:14 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 13 Feb 2025 19:19:24 -0500
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
Message-Id: <20250213-mem-cocci-v3-v1-11-93466d165349@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739492356; l=4256;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=qNRQxkfMur7BPqwRSoUD0Y1xSb+mBLR8VcBDJdlCxGw=;
 b=ijXOEGX0OJP9agRtmiVCHuzM1ADlEbiLLq8nwfqtGrIMhF6NnUgGf9xdYkRygezmigyj/NY28
 dpk6p9JnRIbCdyD82YA5mRuUqWeRxMu9++9Uw5H3KYi2vCPipmO/YvS
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

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

v3: Do not convert "hd" resource to follow the rest of the
refactor. (Maxime)

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 54 ++++++++++++++----------------------------
 1 file changed, 18 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 47d9ada98430634cfd8c1e21c2a4d00d501bab7e..aacc7a3aa007a66c22f68158377f025adcbb4df1 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2951,18 +2951,18 @@ static int vc5_hdmi_init_resources(struct drm_device *drm,
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
 
+	/* This is shared between both HDMI controllers. Cannot
+	 * claim for both instances. Lets not convert to using
+	 * devm_platform_ioremap_resource_byname() like
+	 * the rest
+	 */
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hd");
 	if (!res)
 		return -ENODEV;
@@ -2971,51 +2971,33 @@ static int vc5_hdmi_init_resources(struct drm_device *drm,
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

