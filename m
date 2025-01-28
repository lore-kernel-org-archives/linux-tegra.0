Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D715199249
	for <linux-tegra@vger.kernel.org>; Tue, 28 Jan 2025 22:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738103499; cv=none; b=c1APG6ClBbVkJXt9QywRngoqUxURC2RBphBUrkrwH2GSSaGjQtM6WPwOLmkKk1Hepi0udqGqlttyI1WmPSXzGe12ER1X5IncObrVmwbcORpZYUYjSjO2196YOIPNAaR8JmJqG3g7O0qBVxs1q1UA1uAAuYG/4wd2PlEsbz0e5nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738103499; c=relaxed/simple;
	bh=f2q+dLROh+nmfHqYKZQjWCkJEGeXIqlbeRtQt42VgCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I5A9E1Zb3tlbdkcDFVg1OzAZmVQxgfSfXdyNRR8oMmEXV8TMn7TGwDKkQoNrVdUYb048Cx2/cJfmkMFC4IbPu4TxXhbP9i2inaaLKSqaHZ7zgZQa9g34fqfoXXCYgXuQGVw7JIwfChyheo4tpxeZ24fPjwxLA3DgDdFE22hSyUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e6cLxary; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e6cLxary"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738103496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uBHgf3oei/qHmIZpbMF9VehDvC+EICOlxAHVG2vbAos=;
	b=e6cLxary3LmPELiidJDu936tY7Asw86RtSXBdcputel4PR8BkonncACtnspXbhFs2VDI/I
	nzADaqEg0wD3Z3AlVXsJz36haEw3F19mSGvMkI3vQq41YaiFUhl/s6F7NR/0mhYkikS7GJ
	jXJ3wRORvUhCM12N/XLiTPOwYHGfxUE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-384-PSgzdCgqN2iD9eSPpWO9tA-1; Tue,
 28 Jan 2025 17:31:33 -0500
X-MC-Unique: PSgzdCgqN2iD9eSPpWO9tA-1
X-Mimecast-MFC-AGG-ID: PSgzdCgqN2iD9eSPpWO9tA
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3F49D18009C9;
	Tue, 28 Jan 2025 22:31:31 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.231])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 67E34180035E;
	Tue, 28 Jan 2025 22:31:19 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 28 Jan 2025 17:29:29 -0500
Subject: [PATCH 05/14] drm/meson: move to devm_platform_ioremap_resource()
 usage
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250128-cocci-memory-api-v1-5-0d1609a29587@redhat.com>
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
In-Reply-To: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
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
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
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
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, 
 linux-doc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738103410; l=1714;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=f2q+dLROh+nmfHqYKZQjWCkJEGeXIqlbeRtQt42VgCQ=;
 b=lhClH7lzArBOUdWbc4Q4UnvQ1RCQ19pVNRVv63WKBHzCVgJMxuArGJpHa8TYtAgCNIzt7DlYr
 NxuKblbIiv5BF/Ek4dNs87o4KLEP61IBFsptwDPsRW00XhC+FVopP4m
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Replace platform_get_resource_byname + devm_ioremap
with just devm_platform_ioremap_resource()

Used Coccinelle to do this change. SmPl patch:
@rule_3@
identifier res;
expression ioremap;
identifier pdev;
constant mem;
expression name;
@@
-struct resource *res;
...
-res = platform_get_resource_byname(pdev,mem,name);
<...
-if (!res) {
-...
-}
...>
-ioremap = devm_ioremap(...);
+ioremap = devm_platform_ioremap_resource_byname(pdev,name);

Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/meson/meson_drv.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 81d2ee37e7732dca89d02347b9c972300b38771a..6c805805b7a7f675f8bb03944318972eb4df864e 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -184,7 +184,6 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	const struct meson_drm_match_data *match;
 	struct meson_drm *priv;
 	struct drm_device *drm;
-	struct resource *res;
 	void __iomem *regs;
 	int ret, i;
 
@@ -220,14 +219,8 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	}
 
 	priv->io_base = regs;
-
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hhi");
-	if (!res) {
-		ret = -EINVAL;
-		goto free_drm;
-	}
 	/* Simply ioremap since it may be a shared register zone */
-	regs = devm_ioremap(dev, res->start, resource_size(res));
+	regs = devm_platform_ioremap_resource_byname(pdev, "hhi");
 	if (!regs) {
 		ret = -EADDRNOTAVAIL;
 		goto free_drm;

-- 
2.47.0

