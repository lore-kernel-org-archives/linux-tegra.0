Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEDF23815D;
	Wed,  2 Apr 2025 11:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743593890; cv=none; b=iBajcPF8/wX5t0uTZYD63veEU/QxpJrObcnqPpCNIcHdwLf1nCYOXr3nB8Gq+GgYtS7gKb8pCgbBe7wia4w9SWYC6omzwTbGHPIiNFuoaXgcr78PI8Frj6BRTZM1bSHsHdS5ps8S6a/1hyUk6moDnrkA/VBgQHO2uYTlVeN7N04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743593890; c=relaxed/simple;
	bh=JebWOiMUTSKPMjERSVLm9ceMZPo81CbiCPdA9uYvbAw=;
	h=Date:Message-ID:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=Xmg7MUE1fDHzkDDhjgN4+JbThXdGhqbofbw5k+tEQYYQjUqLECslu+bqL4x9BzaBtdGIO35PgFds12ZxPInK32kUIxWaObaMspBff1dAV2jadDyUt8zcnmBR9SHKiH9j1ST3V6NGZrYUNamiBfKzLvzgZsJi0sxokYpTPrFE+tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZSNCZ1ljTz8R040;
	Wed,  2 Apr 2025 19:38:02 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl2.zte.com.cn with SMTP id 532BbtVE016283;
	Wed, 2 Apr 2025 19:37:55 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Wed, 2 Apr 2025 19:37:58 +0800 (CST)
Date: Wed, 2 Apr 2025 19:37:58 +0800 (CST)
X-Zmail-TransId: 2afb67ed2196483-1bd7d
X-Mailer: Zmail v1.0
Message-ID: <20250402193758365XauggSF2EWBYY-e_jgNch@zte.com.cn>
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
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHQgMS8yXSBncHU6IGRybTogdGVncmE6IGRwYXV4OiBVc2UgZGV2X2Vycl9wcm9iZSgp?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 532BbtVE016283
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67ED219A.003/4ZSNCZ1ljTz8R040

From: Zhang Enpei <zhang.enpei@zte.com.cn>

Replace the open-code with dev_err_probe() to simplify the code.

Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/gpu/drm/tegra/dpaux.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 2cd8dcb959c0..e5297ac5c0fc 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -501,14 +501,9 @@ static int tegra_dpaux_probe(struct platform_device *pdev)

 	dpaux->vdd = devm_regulator_get_optional(&pdev->dev, "vdd");
 	if (IS_ERR(dpaux->vdd)) {
-		if (PTR_ERR(dpaux->vdd) != -ENODEV) {
-			if (PTR_ERR(dpaux->vdd) != -EPROBE_DEFER)
-				dev_err(&pdev->dev,
-					"failed to get VDD supply: %ld\n",
-					PTR_ERR(dpaux->vdd));
-
-			return PTR_ERR(dpaux->vdd);
-		}
+		if (PTR_ERR(dpaux->vdd) != -ENODEV)
+			return dev_err_probe(&pdev->dev, PTR_ERR(dpaux->vdd),
+					     "failed to get VDD supply\n");

 		dpaux->vdd = NULL;
 	}
-- 
2.25.1
