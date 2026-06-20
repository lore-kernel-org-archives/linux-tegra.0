Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B0C369D40
	for <linux-tegra@vger.kernel.org>; Sat, 20 Jun 2026 19:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781983480; cv=none; b=n9lR7moUL814GrP4GDUJrwUpqf6kEGzK4M6Kf+FX5FycPrgToEMpoO2UPE6naNK/6qcm7c8VzJRTIv2k9+D2Dnjbo46T0vqLkeM80NbvcFnqbpYGEmuq6EOFyX6VvLp3pkNBSI7A0X6bHgx+D5yvsDpinnvLeK2ouUMnQ9y/XdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781983480; c=relaxed/simple;
	bh=XM1gxbuIM/7HKnffyWoU5gWx7Yh3OJCTVHy4NZh8xwA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EkWkLp7CbJq3q3BaKlJSPBTojmvdL4P2nlpNqhnIsFvNtaBl0s8bRF59aW5h2/q6zZd2HfhbP72xmwwpWwppKqQ/pAkgj3vjDkecT7QgHgNw3on0p2iDJpfrrf6gX1ZA792GdAJVwAaBoYHkUh93+PJywbwhVtrI2GBmojG44d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=CPfNc7aJ; arc=none smtp.client-ip=80.12.242.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="CPfNc7aJ"
Received: from fedora.home ([10.64.95.109])
	by smtp.orange.fr with ESMTP
	id b1HpwZlX4ax7Wb1HpwH03C; Sat, 20 Jun 2026 21:23:25 +0200
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPSA
	id b1HgweBLQJg5rb1HgwxhOy; Sat, 20 Jun 2026 21:23:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1781983397;
	bh=BXuclxyE0Xm6M4y3OOnY9C1tyOXzRvsIL00sMzI/lx8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=CPfNc7aJrn9Kd1Es8rvp3iQSoDsSaBla/lhU7swKETXxd1ZXFl2yhlwqCm/t2ZIxl
	 ykJ29e9rXKoViyInWAG/Sus3qfoILWkDC7dflcadIQ1AP82e/SQUSZMbb+l0I5/gB9
	 vWFmyKQL42MSnZxcpac0C3W9OJlBy5YaLOlWqO1+Xtm9008Y15pPGbl1lEITfqMwB4
	 th7iYf7cTp6xswu+QoJiS3UrdERDjQa0p3foLrkiBQPppXw48oC+q9DimeIYR1U64+
	 qOqVPNK2ELL83i1xhZkVRJwYnnvSv8d2A8tnlYvbQ8mZ/7y6T8sNdgMiuwesFEacIV
	 g9zw3WgD42/mQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 20 Jun 2026 21:23:17 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH] drm/tegra: Fix a strange error handling path
Date: Sat, 20 Jun 2026 21:23:14 +0200
Message-ID: <308ea09281bd0b3fb0ec7e90e23012c0783f373c.1781983379.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The resource freed at the 'put_aux' label is "sor->aux->dev".
However, this resource is taken after devm_tegra_pmc_get(), so there is no
point to release it in this error handling path.

This is harmless because put_device() will be called with a NULL pointer,
but this is confusing.

So, fix the logic and return directly.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

This is not a bug, so no need for a Fixes tag.
If needed anyway, it was introduced by commit e68c4244136b ("drm/tegra:
Explicitly specify PMC instance to use")
---
 drivers/gpu/drm/tegra/sor.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 4032c6ad45bc..e384cbd0cbf7 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3764,10 +3764,8 @@ static int tegra_sor_probe(struct platform_device *pdev)
 	sor->num_settings = sor->soc->num_settings;
 
 	sor->pmc = devm_tegra_pmc_get(&pdev->dev);
-	if (IS_ERR(sor->pmc)) {
-		err = PTR_ERR(sor->pmc);
-		goto put_aux;
-	}
+	if (IS_ERR(sor->pmc))
+		return PTR_ERR(sor->pmc);
 
 	np = of_parse_phandle(pdev->dev.of_node, "nvidia,dpaux", 0);
 	if (np) {
-- 
2.54.0

