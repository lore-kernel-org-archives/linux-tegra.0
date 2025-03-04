Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03D424C07A
	for <linux-tegra@vger.kernel.org>; Tue,  4 Mar 2025 21:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741122362; cv=none; b=M2JxbUhzqjq5SyYgqWwaVv7CzihH0FuabPBjPdln9BHvsCJsrvqO9Ilj2hlkOMMwJtDuH6FjK8vfsx+XnxCb5U4h3lbcOv6y2xMGQ5EJd3wYIOmBHchJ+WNYF6P8mq7/nNvINCvEB6XRvHBZZp/TXIApc0V/eO7YT3J+Bn/yGck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741122362; c=relaxed/simple;
	bh=tTzktltTbp+f/YuZQWlOZqnNOLQ0oDxFl3zFfOzmDuE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TcKhNINN9LjCh5BuveyvFWXKEug/wgdCdROmYHYaNpKLwAcbml/KxD8VOTsRB7YiXxY28k3gjfiPT/ZdMX2wvw7+dKGPVXImrmk5hE4ZLuhO89zMK/uUtLXr06XLCn4akNwJJmmLBgNk7EcUjb7zrZu52JAkpo93iQg1YC31eOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bbNUVCl2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bbNUVCl2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741122358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6KWLJdJ5fiIb930pUJLqgFqnld1vEloL0BCIsYX5tKU=;
	b=bbNUVCl2jecBvruXOAfHCme4B2iGNzuEdOqFPO6xGzc3wGkqGSoZ5Ja8zQJv16aQXyW/Uy
	yXm1PWibWVYNGqwNJNshIp3xzZWsNUc30SsA7/06cs/fVdUQsQIIn/i/rxhbZVxx24OljM
	Sfbg8Rn7U7LGEKkEfxgySD20GwooK0c=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-104-8p-Y_gSbPemwfxF2TVQ7pw-1; Tue,
 04 Mar 2025 16:05:56 -0500
X-MC-Unique: 8p-Y_gSbPemwfxF2TVQ7pw-1
X-Mimecast-MFC-AGG-ID: 8p-Y_gSbPemwfxF2TVQ7pw_1741122350
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 20205196E078;
	Tue,  4 Mar 2025 21:05:49 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.107])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 863E5180035F;
	Tue,  4 Mar 2025 21:05:40 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Subject: [PATCH v5 0/7] drm: Move to using devm_platform_ioremap_resource
Date: Tue, 04 Mar 2025 16:05:30 -0500
Message-Id: <20250304-mem-fixes-v1-0-fb3dab8d901f@redhat.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABprx2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYwMT3dzUXN20zIrUYl1jk5Q0c8MUQ4skSwsloPqColSwBFB5tFKZqVJ
 sbS0AVVYK2l8AAAA=
X-Change-ID: 20250304-mem-fixes-34df71d18b98
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741122340; l=4017;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=tTzktltTbp+f/YuZQWlOZqnNOLQ0oDxFl3zFfOzmDuE=;
 b=tLxkFhbjw7T7MpPQYdS80+nQqIVDddH0gSbIMbiohOArqEncZj1ftcdpm/JGZ6GFdJ1dhbNll
 zZTUamGjMv5C/C0Xon0mjVY0BqUtVSB/5VCcFwcg+kMfQBGgVc0MkWq
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Start replacing the below occurences with the newer API:
- (devm_)platform_get_resource + devm_ioremap_resource
- (devm_)platform_get_resource + (devm_)ioremap
- platform_get_resource_byname + devm_ioremap
Move all these occurences to uses devm_platform_ioremap_resource
instead.

This is v5 of the series.

Changes in v5:
- Some patches already merged, leave them out.
- Handle return properly. The new API returns a error pointers
and not NULL. While this is taken care of in most drivers in
the series, the sprd and sti needed changes. Thanks to Dan
for pointing this out with his fix:
https://lore.kernel.org/dri-devel/a952e2b4-d4b8-49ac-abd9-9967c50f4a80@stanley.mountain/

Changes in v4:
- Address vc4 driver compilation error

Changes in v3:
- Keep the old snippet of documentation and add further
clarification (Thomas)
- change in vc4 driver for the a resource is not needed.
Add a comment to clarify why that is left behind (Maxime)

Changes in v2:
- Fix compilation errors

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
Anusha Srivatsa (7):
      drm/fsl-dcu: move to devm_platform_ioremap_resource() usage
      drm/hisilicon: move to devm_platform_ioremap_resource() usage
      drm/mxsfb: move to devm_platform_ioremap_resource() usage
      drm/sprd: move to devm_platform_ioremap_resource() usage
      drm/sti: move to devm_platform_ioremap_resource() usage
      drm/tegra: move to devm_platform_ioremap_resource() usage
      Documentation: Update the todo

 Documentation/gpu/todo.rst                      | 13 +++++++------
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c       |  4 +---
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c    |  4 +---
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c |  4 +---
 drivers/gpu/drm/mxsfb/lcdif_drv.c               |  4 +---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c               |  4 +---
 drivers/gpu/drm/sprd/sprd_dpu.c                 | 13 +++----------
 drivers/gpu/drm/sprd/sprd_dsi.c                 | 13 +++----------
 drivers/gpu/drm/sti/sti_compositor.c            | 14 +++-----------
 drivers/gpu/drm/sti/sti_dvo.c                   | 14 +++-----------
 drivers/gpu/drm/sti/sti_hda.c                   | 13 +++----------
 drivers/gpu/drm/sti/sti_hdmi.c                  | 15 +++------------
 drivers/gpu/drm/sti/sti_hqvdp.c                 | 14 +++-----------
 drivers/gpu/drm/sti/sti_tvout.c                 | 14 +++-----------
 drivers/gpu/drm/sti/sti_vtg.c                   | 14 +++-----------
 drivers/gpu/drm/tegra/dsi.c                     |  4 +---
 16 files changed, 40 insertions(+), 121 deletions(-)
---
base-commit: 0670c2f56e45b3f4541985a9ebe06d04308e43b0
change-id: 20250304-mem-fixes-34df71d18b98

Best regards,
-- 
Anusha Srivatsa <asrivats@redhat.com>

