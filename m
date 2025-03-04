Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD0A2780EA
	for <linux-tegra@vger.kernel.org>; Tue,  4 Mar 2025 21:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741122391; cv=none; b=jEcUuxmwOjVCJ0nP5hEpH8v8DdN3dkT/CutO+ucFIsGxeV0dH4pYwb+k+Jaq8f18SSrn70gwXS7XC1l9VtuNgqO+sXY5cLtwLy87/IETVYKeVCyI+dT+e73UiICHnRXMbPflkpB+NXA7uY5zVske82EkIt9Nv0LzPnzTyzGmKJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741122391; c=relaxed/simple;
	bh=e7EAZ+KmeNfJYACxac/4HIs+1oMWt3cBSpu13fis9p8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pFHFPZZiHsiZz5pwWB3y6/y5uAs+PI3L0OAq0/Zev80+s4zr6dw/hxomcvip2aloRwo9ImNZXS85l3K/BkZD8SkEojPFiXF9xSADvEsVQ3FZZYn87cwWeX29t68cEbEGm2wipJMU6Eh2Zc6EN7UhE8bq9ypU4m4OxaBc7kcWlGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cNjH/H4H; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cNjH/H4H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741122388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CFcCMfK9kRbxA/PdPW3zdXiOiPSBPDlYqROSR09dnjM=;
	b=cNjH/H4Ha1dQYtSw6n6xwF1GmfwaNdpd+aKxPwleDp+/1ff9po2Y/+DyKr9IvIVx4+5Opo
	CQt0PmpMDPWQLY2NNanPkERSJbSoXNHdz47SdwP3UM65Xtp3jjw1kgBs3z/1siXOKPcCgy
	FaJF8Mf7ykJFBHQ3Eq3zbezsaPQ+e2Q=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-171-72bfiqqMOMyR2qhrhalNTg-1; Tue,
 04 Mar 2025 16:06:25 -0500
X-MC-Unique: 72bfiqqMOMyR2qhrhalNTg-1
X-Mimecast-MFC-AGG-ID: 72bfiqqMOMyR2qhrhalNTg_1741122381
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5580D1944F05;
	Tue,  4 Mar 2025 21:06:20 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.107])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 53ECE1800361;
	Tue,  4 Mar 2025 21:06:12 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 04 Mar 2025 16:05:34 -0500
Subject: [PATCH v5 4/7] drm/sprd: move to devm_platform_ioremap_resource()
 usage
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-mem-fixes-v1-4-fb3dab8d901f@redhat.com>
References: <20250304-mem-fixes-v1-0-fb3dab8d901f@redhat.com>
In-Reply-To: <20250304-mem-fixes-v1-0-fb3dab8d901f@redhat.com>
To: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org, 
 Anusha Srivatsa <asrivats@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741122340; l=2864;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=e7EAZ+KmeNfJYACxac/4HIs+1oMWt3cBSpu13fis9p8=;
 b=ys/SsEsGmjzQgZea8LqbK2IhVs/FOKEF4L1GqDD5qjRUNKHNm91m1YLg4jFnTkR1dD3lLNNAL
 HGHnws6i/2dCqW2OhErTnr6CHplGcJYBRtOI1xOmBwTrTcoixbwqQZE
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Replace platform_get_resource + devm_ioremap
with just devm_platform_ioremap_resource()

Used Coccinelle to do this change. SmPl patch:
@rule_2@
identifier res;
expression ioremap;
identifier pdev;
@@
-struct resource *res;
...
-res = platform_get_resource(pdev,...);
<...
-if (!res) {
-...
-}
...>
-ioremap = devm_ioremap(...);
+ioremap = devm_platform_ioremap_resource(pdev,0);

v2: Address the return handling properly since
the new API returns error pointers and not NULL.

Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>(v1)
Reviewed-by: Maxime Ripard <mripard@kernel.org>(v1)
---
 drivers/gpu/drm/sprd/sprd_dpu.c | 13 +++----------
 drivers/gpu/drm/sprd/sprd_dsi.c | 13 +++----------
 2 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
index cb2816985305fd19eac27413c214681a5a1e9ffa..a3447622a33cd612e34be038e833222567bdcd2c 100644
--- a/drivers/gpu/drm/sprd/sprd_dpu.c
+++ b/drivers/gpu/drm/sprd/sprd_dpu.c
@@ -784,19 +784,12 @@ static int sprd_dpu_context_init(struct sprd_dpu *dpu,
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct dpu_context *ctx = &dpu->ctx;
-	struct resource *res;
 	int ret;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(dev, "failed to get I/O resource\n");
-		return -EINVAL;
-	}
-
-	ctx->base = devm_ioremap(dev, res->start, resource_size(res));
-	if (!ctx->base) {
+	ctx->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(ctx->base)) {
 		dev_err(dev, "failed to map dpu registers\n");
-		return -EFAULT;
+		return PTR_ERR(ctx->base);
 	}
 
 	ctx->irq = platform_get_irq(pdev, 0);
diff --git a/drivers/gpu/drm/sprd/sprd_dsi.c b/drivers/gpu/drm/sprd/sprd_dsi.c
index 8fc26479bb6bce0aa94914f49d0986a7e19326c1..23b0e1dc547a5023ee6ad7d5e1c49e2cec986bf0 100644
--- a/drivers/gpu/drm/sprd/sprd_dsi.c
+++ b/drivers/gpu/drm/sprd/sprd_dsi.c
@@ -901,18 +901,11 @@ static int sprd_dsi_context_init(struct sprd_dsi *dsi,
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct dsi_context *ctx = &dsi->ctx;
-	struct resource *res;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(dev, "failed to get I/O resource\n");
-		return -EINVAL;
-	}
-
-	ctx->base = devm_ioremap(dev, res->start, resource_size(res));
-	if (!ctx->base) {
+	ctx->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(ctx->base)) {
 		drm_err(dsi->drm, "failed to map dsi host registers\n");
-		return -ENXIO;
+		return PTR_ERR(ctx->base);
 	}
 
 	ctx->regmap = devm_regmap_init(dev, &regmap_tst_io, dsi, &byte_config);

-- 
2.48.1

