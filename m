Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E70D37E319
	for <linux-tegra@vger.kernel.org>; Sun, 12 Apr 2026 20:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776027149; cv=none; b=afYZOSMuE73bFwvTn7/kXtVyqERWca4zMvoScCYfw6PyIxFp1VyAIKsnp97CXCfNUwHVVxAKZhw+2ArHVG98sb18VX9OcNFA/7NAGzXUvDw9dhQ0MPXvMD1pRGvgyAEdHtph+XMdXrX0raIlbllJFSROvLUgSbalSEWPgyhgZ/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776027149; c=relaxed/simple;
	bh=DSV51EC4wDAZAtG63wE3QtVJJqfSvUl5AYHQrvro0uA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lrR8vlEq4tMqTYIMzNC121nV0dxzzpQZ45zp+7jkh1AjEVZdO/rFg5KaG7PRXWA9gnkggMbfIHEcW35WbrLJmEnti+F4cAnHxk/bcgp1/cdJmM1ygtXxwxiU/e38sasqYKU+t2iLSnlFqf1/NXTAvJl1o3radE0EyZjFJaliPt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k41bjSfo; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k41bjSfo"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6717d83f0ceso487096a12.3
        for <linux-tegra@vger.kernel.org>; Sun, 12 Apr 2026 13:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776027146; x=1776631946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QVfujx2mt/GYaWZCYACzathtB/uLnH5k7JHfo05VG1E=;
        b=k41bjSfob9NrM0TgUzeMXbM2AmVS7Lw1V2Nq/U6hcPWu7plszb10kPR46g2yXhiHdc
         IAFdFv1OUT1QWmeFPPUsGPTJwjEsOU5B+r68v//d1yi87Rc2pd5odY+8OlH1JropRCoI
         QuKz2z+OzVLYFjqyPpz/QpYTSJAkrxW2ibFw8kMqedYVMDnIYf4SWclRULkj/DycIQxG
         YQdvo6X3dtf7KY5t2jJ/wRitcuDeEFZPS9pUKlrxRkDFKOsWpieY6vpctIYHKRIUZxV0
         j4Y+FQDa6DBVSm4vmN5Twdi3HM/vsSMhPVvh9h7i2QJyewgATXFYRrUCuqKp7rERFTB0
         uUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776027146; x=1776631946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVfujx2mt/GYaWZCYACzathtB/uLnH5k7JHfo05VG1E=;
        b=kvGmSqWc5uJrUEwZv6gU6RteIuBDbcZ9Flq6Kddae/LhXIkGJCLip1YzzhEzlbUsya
         H6EOnw8PeaUAfGqV5fwvMeKdAFxdBE6CLoG8wYOD6A4TyZPxzs/sB4aQIUr0pj6LP98i
         3obBU9+ebWBRCUnp4T25z42uXw1SjpvFdMBG3ui4zkS28/ZYVt96JyAfAo9e2TvH9m17
         tRy6iy797iyX+5ip9Mk1yjcy4PnmdByegjl6Qu6rofFO+nJQLSvv2eeAnhZszrBW60yL
         8rdeHjvsGIwHRQr5MzjzynYvVJGyIUZulQvwINBUT889yPLtJd0cT3/k7bvrHIwLfJOS
         RAkQ==
X-Forwarded-Encrypted: i=1; AFNElJ/7uk1BI/P+VsvIGlCHGaZZjD8G/vR2ZUDZhySWRZzDUW6Xk5hReAHiTdb6wmWShMyYwKDZv3MtJvyyVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YygV9H0vTyOV3pQWGuGTWsKy7mPtmp9WSkBY9CRWeMt5gOL31mD
	R+UEBVTKm4My9X6vhcl+fszXpjLOKWrZHSK0lKkGyFY62C7b9lqJSVxR
X-Gm-Gg: AeBDievsljIt1AIEuFBMFOiV5KRbSqlRA+u0AGGtDzinARJn/AX9YJxNTM6gnNPGx+H
	XpYukoC859SaL6+Qo3T3u91tAzC92utyKcz0OMN1+G43TuCDKlbQ55p+Lwi34ENm4bwjMRYaw+T
	/4c+VKukAYRLn1tAlfiT4T1Bmfk0GsNEkp5xP8EnFaZKgCnwXLXzNcZw92J1XqqX5dlc/3k2XqP
	W9S/h/1PY/wIwIFJ8xyQynIg811X3wIjRUMHkd2JX62IWyWiu6QFl8k243JCCMaG1xGeqVKPYQ/
	jFLtnJlZQVwahZ8/Qd7wPsDdo2cqvGUfEXVZtfXNPhetKjrubzQeqCkoJtGP/VDM32B1mDn8jH2
	55jWrFw7O9SEFEGEghIDOUgH6AJOaDsgdumZ4Gy2xpAjmjMr3JdQdH8ljSBGyEltCfweQ/9/Ag/
	+Gb7oB91dXUR3I2+TSKeXaIKz0YyEZxXH+hrMf8W0Xi5BdagP1rjpA2CqD/06hOF3Zl6IPd34Xd
	8sFF2ImOdtutyMoDRMZMwv5rw/LrznKZiaqedVB825KVjnu9g8Eigfi4zC+2T9aUEYiF7hTlRiS
	sBy2MQ==
X-Received: by 2002:a05:6402:505c:b0:66b:b6e2:66e1 with SMTP id 4fb4d7f45d1cf-6707a47e6a3mr3822463a12.18.1776027146093;
        Sun, 12 Apr 2026 13:52:26 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6707082732csm2178795a12.29.2026.04.12.13.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 13:52:24 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org
Cc: thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH 1/5] staging: media: tegra-video: add NULL checks for of_device_get_match_data()
Date: Sun, 12 Apr 2026 22:50:57 +0200
Message-ID: <20260412205057.386856-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_csi_probe(), tegra_vi_probe(), and tegra_vip_probe() all call
of_device_get_match_data() to retrieve SoC-specific data from the device
tree match table, but none of them check the return value for NULL before
eventually dereferencing it.

In tegra_csi_probe(), the pointer is dereferenced on the very next
statement via csi->soc->num_clks. In tegra_vi_probe(), it is dereferenced
later via vi->soc->ops. In tegra_vip_probe(), vip->soc is stored and then
dereferenced at runtime via vip->soc->ops->vip_start_streaming(). A NULL
return would cause a kernel NULL pointer dereference in each case.

Add a NULL check returning -ENODEV in all three probe functions, consistent
with the defensive pattern already used in similar staging drivers such as
drivers/staging/media/sunxi/cedrus/cedrus_hw.c.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 2 ++
 drivers/staging/media/tegra-video/vi.c  | 2 ++
 drivers/staging/media/tegra-video/vip.c | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 7842104ca933..33369a8c803a 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -781,6 +781,8 @@ static int tegra_csi_probe(struct platform_device *pdev)
 		return PTR_ERR(csi->iomem);
 
 	csi->soc = of_device_get_match_data(&pdev->dev);
+	if (!csi->soc)
+		return -ENODEV;
 
 	csi->clks = devm_kcalloc(&pdev->dev, csi->soc->num_clks,
 				 sizeof(*csi->clks), GFP_KERNEL);
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index d1d934e361f7..f3b749f059f8 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1907,6 +1907,8 @@ static int tegra_vi_probe(struct platform_device *pdev)
 		return PTR_ERR(vi->iomem);
 
 	vi->soc = of_device_get_match_data(&pdev->dev);
+	if (!vi->soc)
+		return -ENODEV;
 
 	vi->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(vi->clk)) {
diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/staging/media/tegra-video/vip.c
index 80cd3b113125..148c68ceb605 100644
--- a/drivers/staging/media/tegra-video/vip.c
+++ b/drivers/staging/media/tegra-video/vip.c
@@ -236,6 +236,8 @@ static int tegra_vip_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	vip->soc = of_device_get_match_data(&pdev->dev);
+	if (!vip->soc)
+		return -ENODEV;
 
 	vip->dev = &pdev->dev;
 	platform_set_drvdata(pdev, vip);
-- 
2.53.0

