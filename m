Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1039156C4E
	for <linux-tegra@vger.kernel.org>; Wed, 24 Apr 2024 06:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.232.154.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713938919; cv=none; b=Gh3TqNLF1a1rC+lJTsxYcYRO9nCaHmSogQ1mS4HQm492RmJiEtXKvEttQo2jaQmcLej3uEeSr2IPTALugSQ3dtmd6CgDEUCxLS+fgWi7KvioxsCBTkobh8CphyMNAybYnLhNaUcn4kc+F8gDm8gf4352kktpr4N0uumJKB+b3Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713938919; c=relaxed/simple;
	bh=bAZ4O4Q8n2GXeY13TgWf2dI5Ss3Pmacbql9PYCq1xk8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jRD5ZSuYkiTKr8fXvWJNICsCZcN813e1K+oomk55jbOPBuLFQKjZkaPT7pN9NPL7S2fU9qdIAWABCaYsvL4MnwgTlLkoSW7Tnf8hFPWQ4x7Hwhu8gEZqDP2otWMmteYin/AzLO4zbZ1NqcMR6nduVjI41R4NE+tZ3DoIr+Hg+1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi; spf=pass smtp.mailfrom=kapsi.fi; dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b=J2jGXbEi; arc=none smtp.client-ip=91.232.154.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kapsi.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="J2jGXbEi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=vf7epXwrRjHiVE5VVJf/A4Pg3tZi+rY+cb7pC4ekWOg=; b=J2jGXbEiTgSFrE+3AEk4mnYzf/
	TRaxTsXa6mgV1kz81iSRK4Y5Kfgx4IWVkoFnmgFrnfwicfPcvfLJcuJ9cZ+zxCNxj2e7Zm6QFuzxQ
	ToFfx5rOU3hXqX3ywInuYgkbJ+ZK0ZIKz1E37ShXVUyYBypY5ychTq+YnKA8+QE0SJcBvnTcVKJSe
	43N7dq09489TRoFozC8dIUO7nO3vQs0b8qzF6t/ytu8HA4ZVqDddTO9yfO6nChNqB8j4ohLL3maqD
	EXxWBwvl5qYiGlHgDMzqo2kICvKEjwtcuLL+YZwTSx2HuEvgj6e9Dt50f4plZfpVa9C/EulaXyhR3
	hCBaSokw==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=toshino.localdomain)
	by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <cyndis@kapsi.fi>)
	id 1rzUx3-00BBnQ-2M;
	Wed, 24 Apr 2024 08:13:49 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 1/2] drm/tegra: gem: Open code drm_prime_gem_destroy
Date: Wed, 24 Apr 2024 08:13:34 +0300
Message-ID: <20240424051335.2872574-1-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false

From: Mikko Perttunen <mperttunen@nvidia.com>

Since we aren't using drm_gem_prime_import(_dev), for clarity don't
use the corresponding destroy function either.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/gem.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index b4eb030ea961..189861c6c630 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -520,9 +520,12 @@ void tegra_bo_free_object(struct drm_gem_object *gem)
 		tegra_bo_iommu_unmap(tegra, bo);
 
 	if (gem->import_attach) {
+		struct dma_buf *dmabuf = gem->import_attach->dmabuf;
+
 		dma_buf_unmap_attachment_unlocked(gem->import_attach, bo->sgt,
 						  DMA_TO_DEVICE);
-		drm_prime_gem_destroy(gem, NULL);
+		dma_buf_detach(dmabuf, gem->import_attach);
+		dma_buf_put(dmabuf);
 	} else {
 		tegra_bo_free(gem->dev, bo);
 	}
-- 
2.42.0

