Received: from mail.kapsi.fi (mail-auth.kapsi.fi [91.232.154.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F4E28691;
	Wed,  2 Jul 2025 02:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.232.154.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751422113; cv=none; b=R677bvI0hSG32rKuy/KhaZBoqlxkhwyPbpSL3kjftk188G8/icb2MlJYCATshs+jlNP0Shnver8tEAwEAySs4V8eTtVpcoSg2AFASYOTJ4zuMiztm9BdChv9DSv+Y7JZfseVUC1mSgQHjwRXRuJhaYuJnXVVnMjsD1Yg8PpFmaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751422113; c=relaxed/simple;
	bh=6IYgUXCKOVWQzjCaAmYhbeLmZspvJK13K3WyaSLTAb4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iKy58ERzcsJ/oerUAU2vA3xieWEA/Pk8CweXh7+Brzu0TpFzkgz8KfHsJXxV0xrjbgek4EGHZBNdisWBhb9rCpLjYgw64W/aozAOfr7vzlmjYsShvkv6qGiCLEJac3UAS0GX7v81zC71GoNrJxdPGcaJWgSO0BfPmMxwy0hF+zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi; spf=pass smtp.mailfrom=kapsi.fi; dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b=S1C6Gqsz; arc=none smtp.client-ip=91.232.154.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kapsi.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="S1C6Gqsz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=YrHlgdl2SBTQ9+yMHREA+yud3zapvbMej8Khrxpmchs=; b=S1C6Gqsz6rvZ7zPHpW6DkFNyxN
	EfpgyWeYa8ZE0FjdD03gULx5uWEN2WTCDQiHxsF4yFBrSyqBT3kVOpR0U11IAAosp/2D8n2wIboze
	nDBobaF2X4VNnEMAVLlawWPaBe6wKRrgyegFXFalZult/2dBojBLUd0d6gsvZ5iGmL7rQDhGTyvPz
	FuTiFotWG4i1HyaDlqwlkXkhUkt5XWZzkfzZQQbxi8wxsaCdv1/S/CWnviQozj4Iayc9sq5QA9rYC
	QW+JTzrdmniGWWb6AXkicPsKGE4L06rYcct6UcU52xykYveF1Rhbb6v9l8bgtnJbwqB13RlVw2NRh
	I3MoW8Jw==;
Received: from [2404:7a80:b960:1a00:5eaa:b33c:a197:a90f] (helo=senjougahara.localdomain)
	by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <cyndis@kapsi.fi>)
	id 1uWmtU-000N2g-2M;
	Wed, 02 Jul 2025 05:08:17 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
Date: Wed, 02 Jul 2025 11:08:07 +0900
Subject: [PATCH] drm/tegra: nvdec: Fix dma_alloc_coherent error check
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-nvdec-dma-error-check-v1-1-c388b402c53a@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAIaUZGgC/x3MQQqDMBBG4avIrB2IqWLpVYqLMPmjQ2ksExAhe
 PcGl9/ivUoFpij06ioZDi2654ah70i2kFewxmbyzk9udp7zESEcv4FhthvLBvkwUgppludjHCK
 19mdIet7f93Jdf/DppnFnAAAA
X-Change-ID: 20250702-nvdec-dma-error-check-effaf7c8341d
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2404:7a80:b960:1a00:5eaa:b33c:a197:a90f
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false

From: Mikko Perttunen <mperttunen@nvidia.com>

Check for NULL return value with dma_alloc_coherent, in line with
Robin's fix for vic.c in 'drm/tegra: vic: Fix DMA API misuse'.

Fixes: 46f226c93d35 ("drm/tegra: Add NVDEC driver")
Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/nvdec.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/nvdec.c b/drivers/gpu/drm/tegra/nvdec.c
index 2d9a0a3f6c381d600189078036b0a5eb3d89d461..7a38664e890e37d163410bced688f4650d6318e9 100644
--- a/drivers/gpu/drm/tegra/nvdec.c
+++ b/drivers/gpu/drm/tegra/nvdec.c
@@ -261,10 +261,8 @@ static int nvdec_load_falcon_firmware(struct nvdec *nvdec)
 
 	if (!client->group) {
 		virt = dma_alloc_coherent(nvdec->dev, size, &iova, GFP_KERNEL);
-
-		err = dma_mapping_error(nvdec->dev, iova);
-		if (err < 0)
-			return err;
+		if (!virt)
+			return -ENOMEM;
 	} else {
 		virt = tegra_drm_alloc(tegra, size, &iova);
 		if (IS_ERR(virt))

---
base-commit: 2aeda9592360c200085898a258c4754bfe879921
change-id: 20250702-nvdec-dma-error-check-effaf7c8341d

