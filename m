Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702B920CCD8
	for <linux-tegra@vger.kernel.org>; Wed,  5 Feb 2025 20:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738786162; cv=none; b=KfL42XGHpwfrNsUm7SZoLI7QBmr/0i1uE88QjfDmNFdai/X52mSg2advfk/bnrlBP9KoHD2DWKK53kDoUn7g30ukbxbhzcrQxM1X7M1xVSb9/jUJco33ly87yY5ZEl0mVaGlI8Mdcf4QJTLREw31+j2MsuXb5nqPyJz/frESf9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738786162; c=relaxed/simple;
	bh=JBXfstQaIVwQ4CElA5zFAPJmVat5vbPS8gLTRdPLuUI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Bw3TUYZuZwD+NRk9Fo7inig2anh3sxUjNyQVMt7wd/reFQdZRUU/w70l7GkzXLgF5MszyCD3bk4j7MBL9iMA4Jh2YzagesnytPWBlqE4TFZYx9WUMDjPAR9SAudo2dBccPd7wS4Cij7oqDKuP0p+ZDbb1darbjkQaLUAzOXJPCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KFk1mgUr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KFk1mgUr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738786159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FtyHp14quoZKfSwCwvs1IfBWioeKvvPDS6kPB6/O+SI=;
	b=KFk1mgUrQglSiWZ8mAQFtNQ2Ka2G/2oq4sqi+8L/68Nq/nUj4RC78DlJukeD9Q4PCja9HX
	VM5YoLqJKcd8tEYJncLgMV3zmkpYM5LI9kTmp86uzjmBMXiKFEl/bu55vxOnAkWyw/tvIe
	ROj/exyyiJrDY9TUGy1afk6UR1XXSLM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-145-CsqTGR8cMOug0ye_zH6buw-1; Wed,
 05 Feb 2025 15:09:14 -0500
X-MC-Unique: CsqTGR8cMOug0ye_zH6buw-1
X-Mimecast-MFC-AGG-ID: CsqTGR8cMOug0ye_zH6buw
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1B8A31800264;
	Wed,  5 Feb 2025 20:09:13 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.21])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 957B919560A3;
	Wed,  5 Feb 2025 20:08:57 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Subject: [PATCH 00/12] drm: Move to using devm_platform_ioremap_resource
Date: Wed, 05 Feb 2025 15:07:56 -0500
Message-Id: <20250205-mem-cocci-newapi-v1-0-aebf2b0e2300@redhat.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABzFo2cC/x3MQQqAIBBA0avErBtQSYmuEi1Sp5pFKgoVSHdPW
 r7F/xUKZaYCU1ch08WFY2iQfQfuWMNOyL4ZlFBaKKHxpBNddI4x0L0mRuPtYEcpjTcELUuZNn7
 +5by87we0aAeTYgAAAA==
X-Change-ID: 20250205-mem-cocci-newapi-6db4b8116d6e
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
 linux-doc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738786137; l=4887;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=JBXfstQaIVwQ4CElA5zFAPJmVat5vbPS8gLTRdPLuUI=;
 b=kB2Ax15EIn2x59280nG+iYRJh3A8F3lI/vAFp/1S4keeM/8lC4ZnJc86pKPdqRuC7++JEqhWK
 fKEzwCmQXKIDNwrIxS+ebvDgJC/rzBnDe6p36Nc05otkT/OeNyXMGX2
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Start replacing the below occurences with the newer API:
- (devm_)platform_get_resource + devm_ioremap_resource
- (devm_)platform_get_resource + (devm_)ioremap
- platform_get_resource_byname + devm_ioremap
Move all these occurences to uses devm_platform_ioremap_resource
instead.

This is v2 of the series. Changes from v1 [1]:
- Mostly fix the compilation errors :( What had passed locally
happened to be the wrong config with most drivers not enabled.
- Clarify the TODO item in the GPU section of Documentation
for anyone who wants to do it in future.
- Drop meson patch from discussion in v1
- Drop rockchip patch as well. Offline discussion with
Maxime led to the conclusion that using
devm_platform_get_and_ioremap_resource() would be a better
approach in that source file. Not adding that change as part of
this series, can be addressed separately.

[1] - https://patchwork.freedesktop.org/series/144073/

Used Coccinelle to make the code changes.Semantic patch:

//First Case
//rule s/platform_get_resource + devm_ioremap_resource/devm_platform_ioremap_resource
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

//Second case
//rule s/(devm_)platform_get_resource + (devm_)ioremap/devm_platform_ioremap_resource.
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

//Third case
//rule s/(devm_)platform_get_resource_byname + (devm_)ioremap/devm_platform_ioremap_resource_byname.
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

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
Anusha Srivatsa (12):
      drm/aspeed: move to devm_platform_ioremap_resource() usage
      drm/fsl-dcu: move to devm_platform_ioremap_resource() usage
      drm/hisilicon: move to devm_platform_ioremap_resource() usage
      drm/mediatek: move to devm_platform_ioremap_resource() usage
      drm/mxsfb: move to devm_platform_ioremap_resource() usage
      drm/sprd: move to devm_platform_ioremap_resource() usage
      drm/sti: move to devm_platform_ioremap_resource() usage
      drm/stm: move to devm_platform_ioremap_resource() usage
      drm/tegra: move to devm_platform_ioremap_resource() usage
      drm/tiny: move to devm_platform_ioremap_resource() usage
      drm/vc4: move to devm_platform_ioremap_resource() usage
      Documentation: Update the todo

 Documentation/gpu/todo.rst                      | 12 +++---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c         |  4 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c       |  4 +-
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c    |  4 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c |  4 +-
 drivers/gpu/drm/mediatek/mtk_disp_color.c       |  4 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c       |  4 +-
 drivers/gpu/drm/mediatek/mtk_disp_merge.c       |  4 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c         |  4 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c        |  4 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c              |  4 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c             |  4 +-
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c         |  4 +-
 drivers/gpu/drm/mxsfb/lcdif_drv.c               |  4 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c               |  4 +-
 drivers/gpu/drm/sprd/sprd_dpu.c                 |  9 +---
 drivers/gpu/drm/sprd/sprd_dsi.c                 |  9 +---
 drivers/gpu/drm/sti/sti_compositor.c            | 10 +----
 drivers/gpu/drm/sti/sti_dvo.c                   | 10 +----
 drivers/gpu/drm/sti/sti_hda.c                   |  9 +---
 drivers/gpu/drm/sti/sti_hdmi.c                  | 11 +----
 drivers/gpu/drm/sti/sti_hqvdp.c                 | 10 +----
 drivers/gpu/drm/sti/sti_tvout.c                 | 10 +----
 drivers/gpu/drm/sti/sti_vtg.c                   | 10 +----
 drivers/gpu/drm/stm/ltdc.c                      |  4 +-
 drivers/gpu/drm/tegra/dsi.c                     |  4 +-
 drivers/gpu/drm/tiny/arcpgu.c                   |  4 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                  | 55 +++++++------------------
 28 files changed, 46 insertions(+), 177 deletions(-)
---
base-commit: 92514ef226f511f2ca1fb1b8752966097518edc0
change-id: 20250205-mem-cocci-newapi-6db4b8116d6e

Best regards,
-- 
Anusha Srivatsa <asrivats@redhat.com>

