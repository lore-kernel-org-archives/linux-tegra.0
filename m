Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A3E238155;
	Wed,  2 Apr 2025 11:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743593943; cv=none; b=A+kZejH0GpiziVYMTyVgv2s7mjf389mGYOPO68csn+g5iTem8RuURkJQSdjbo6WpDTdu+cKmCABL5dT2Rp1NH0y/LyhBdYtZR024WRcsCW3kw6OtCf9kKUExzqzi8dI1qb6iPwpo620nWnrGzvIW64s5+BnEELai+2H2kdDk/5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743593943; c=relaxed/simple;
	bh=zjBdgLOzPfWVyc3hsQ2yS2yL10tTO+NL6GgIw3zJGLc=;
	h=Date:Message-ID:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=qfO41UsHGogqb74V3TEwrBzMZnwDym7c6g0RlSNw8ldIYt1/MzN+iZh+jmgsL5Jx6KjXfwjUojyp0dOKtSSYolKMB+e+u8C1Iiq9l2su9TaKMiJUHgw5dh+6UzizDtCnp08Ri7t3loHQaMkg68ZPnn9P6jdpJboiWyDxsiG1MkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4ZSNDZ1dp8z51SWn;
	Wed,  2 Apr 2025 19:38:54 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl2.zte.com.cn with SMTP id 532BcnQq016861;
	Wed, 2 Apr 2025 19:38:50 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Wed, 2 Apr 2025 19:38:52 +0800 (CST)
Date: Wed, 2 Apr 2025 19:38:52 +0800 (CST)
X-Zmail-TransId: 2af967ed21cc086-26975
X-Mailer: Zmail v1.0
Message-ID: <20250402193852834atJ7eho66TlnKOIMSvpfr@zte.com.cn>
In-Reply-To: <20250402193656279azy9TKahAE5TQ5-i4XCQT@zte.com.cn>
References: 20250402193656279azy9TKahAE5TQ5-i4XCQT@zte.com.cn
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <thierry.reding@gmail.com>, <laurent.pinchart@ideasonboard.com>
Cc: <mperttunen@nvidia.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
        <jonathanh@nvidia.com>, <dri-devel@lists.freedesktop.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <tomi.valkeinen@ideasonboard.com>, <maarten.lankhorst@linux.intel.com>,
        <mripard@kernel.org>, <tzimmermann@suse.de>, <michal.simek@amd.com>,
        <linux-arm-kernel@lists.infradead.org>, <yang.yang29@zte.com.cn>,
        <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>,
        <zhang.enpei@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHQgMi8yXSBncHU6IGRybTogeGxueDogenlucW1wX2RwOiBVc2UgZGV2X2Vycl9wcm9iZSgp?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 532BcnQq016861
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67ED21CE.000/4ZSNDZ1dp8z51SWn

From: Zhang Enpei <zhang.enpei@zte.com.cn>

Replace the open-code with dev_err_probe() to simplify the code.

Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index a6a4a871f197..28efa4c7ec8e 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -2466,10 +2466,8 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)

 	dp->reset = devm_reset_control_get(dp->dev, NULL);
 	if (IS_ERR(dp->reset)) {
-		if (PTR_ERR(dp->reset) != -EPROBE_DEFER)
-			dev_err(dp->dev, "failed to get reset: %ld\n",
-				PTR_ERR(dp->reset));
-		ret = PTR_ERR(dp->reset);
+		ret = dev_err_probe(dp->dev, PTR_ERR(dp->reset),
+				    "failed to get reset\n");
 		goto err_free;
 	}

-- 
2.25.1
