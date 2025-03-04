Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546CA2376E6
	for <linux-tegra@vger.kernel.org>; Tue,  4 Mar 2025 21:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741122373; cv=none; b=gXfiwtbaZvZ6NNY2s7GmaPKzMTUqhuPT5sP6JyAyVlCstPY0gFwdXvcnmFsU/PWLnvn2iifdN7hmom5Nrz3xfcLc9/CExYDzs+uCCSyW/9w8GkfGo7t3lxmZ9oVyskrJ72273LB/cwH8FA3FivWPlxpPFShF+pESIMSvsTJC+C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741122373; c=relaxed/simple;
	bh=qdWoCRSaEyGwiB1pCeMHCVglO9KpvJz3OeotRemVCtM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=coMGRG7Kd0q5noH1sftrso/P6DZ2IjHlSA1CCZ/Nuk5UxWSS0kKoyY+I5ZuwrNyQQxO9ZSSjFg/F+DsGvIu07uR93GIZKwAY3VeJKIVytLAf1nwJh/Ni+uTzQubmAPc4ENP83qSbP5KyO92MwRGpSoO6D9BZPYrmMi0w8FNyjd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XR5BhovM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XR5BhovM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741122370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rEUADPvt5vUb0DPdb4ydVYz2t+TuARR2y9RFIuVvjk4=;
	b=XR5BhovMSy9+6AYAOzVIAZeQxXmTShosaBB7+H3LAtSS5NnfNQAP+rtKSNbMb7av09gQr9
	ryV2mO6G3nQiw6x6Q9uixSM7pWB3Kq1W1n2U+6CzJZnQU4gHw3b6SwIsX0F5vBglEj0Tim
	8vUcDHI09O1rAubyVSxpMsRHnhpgFMs=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-343-aD6fIKblM1CdoJFJ_B3qKg-1; Tue,
 04 Mar 2025 16:06:02 -0500
X-MC-Unique: aD6fIKblM1CdoJFJ_B3qKg-1
X-Mimecast-MFC-AGG-ID: aD6fIKblM1CdoJFJ_B3qKg_1741122358
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 551FA1800989;
	Tue,  4 Mar 2025 21:05:57 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.107])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6AFF81800361;
	Tue,  4 Mar 2025 21:05:49 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 04 Mar 2025 16:05:31 -0500
Subject: [PATCH v5 1/7] drm/fsl-dcu: move to
 devm_platform_ioremap_resource() usage
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-mem-fixes-v1-1-fb3dab8d901f@redhat.com>
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
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741122340; l=1621;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=qdWoCRSaEyGwiB1pCeMHCVglO9KpvJz3OeotRemVCtM=;
 b=XXW32Rtiy4P6fBUnnYgHXkX7nAGj1GjI07HhKOKSoEKm4jsLZoO7bPwhhWNtFaji8/Ow4zIKQ
 6AVOybQONpRBfLZVnq68Jsf/krtVTSz4PdAUmbzyTxKxsRlvlmRH7zz
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

Cc: Stefan Agner <stefan@agner.ch>
Cc: Alison Wang <alison.wang@nxp.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
index 03b076db9381a5db0bff6576cda2772495a61fed..3bbfc1b56a6557e2f54d2b7ed099531053871341 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -260,7 +260,6 @@ static int fsl_dcu_drm_probe(struct platform_device *pdev)
 	struct fsl_dcu_drm_device *fsl_dev;
 	struct drm_device *drm;
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	void __iomem *base;
 	struct clk *pix_clk_in;
 	char pix_clk_name[32];
@@ -278,8 +277,7 @@ static int fsl_dcu_drm_probe(struct platform_device *pdev)
 		return -ENODEV;
 	fsl_dev->soc = id->data;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base)) {
 		ret = PTR_ERR(base);
 		return ret;

-- 
2.48.1

