Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321158;
	b=bIS0R0q6ZSC1cb4akmkA+U77FvuSO6yNih6vn71s1RZ1fC9K13sla17tATRXtkEXFJ8a
	 lPVry30p58elJ4J3QnzB6unFEInXbcnjRGGXx54QJSDHId0ZMlfmpffz5F9AxvXSHuVJT
	 E/F7EEADaMNmVPPvW8erWhMzd5BSlohy0kpdnCpPu3i5AK+a+GFWY4ilOPCyoXi8tvHL3
	 OnNP3N9gAehdvFzRQc8L16eHJUnvaR5gZzHQUJddbgsDRJBxDWGj+84bUfdrJHQObFiE5
	 FFkZyagryztF1wnvXtO2MPdeQCqdDeWcoz1TMb7vzES0R2MHj7Hc6eynzQ65OpEvPMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321158;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-HM-Tid:
	 X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=uZCCOZMeXohRf6kOx9rNWgDDoZ60k4TuUeWWIH/0Eh0=;
	b=CQGehfHKCIQvaFuHvGJAKUbXnOTGOVZtWpbWO1kmlUScMhxnosS2ybwyORISv8X/zp2d
	 3+i1c5yh2nmjDqhqr2q1oJKQ35M9t6KFxiO2B/zJBwxOW7hOI5Zq0GVzMonX5dv1W0rWW
	 fUghLeDakajUc4Q4i/kmmKMhOAL0cT9HrQx38jONtti0Mt0WcYS2GCIsmqZWyU52+Qzq5
	 AfgVswlXjhETtKpR4nWQnequeDIWRu4gAGrLG6VxQFz2o6f6wZJqZ6EzGuFx7rpN9ZQNU
	 ibhV71G/zkNJHxtHg8lAhIEkzySyW3anrTtT6LIlCGIyjsShJa5WoCYp4FiBT7phwtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b="DQb7l/NW";
	arc=none smtp.remote-ip=101.71.155.101
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CCA606A334;
	Tue, 10 Nov 2026 14:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49CCA606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=DQb7l/NW
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 542cd9c4a;
	Tue, 10 Nov 2026 22:32:32 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: tegra: Fix potential NULL dereference on AHUB removal
Date: Tue, 10 Nov 2026 22:32:32 +0800
Message-ID: <20261110-9f141e6bc8-asoc-tegra@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1c5dffb7a03a1kunm396f0fdb16cdef
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTUhNVh9IGBlJGB8aQ0hLHlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=DQb7l/NWr4H/toy2duZMk+270fV3oclTWFyz8rGWtTXY95X1HoimPFH5CzfemClL6OCcvAeTChN3JtZuOslnUyV5OgINzNP6N1fcNSXtJ9uTZ8XRAMs9wcm6FnYa6TvIj3unr+lnPt+Fz5d6UlWfZl3e8GPf0QVhpekULwipy2g=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=uZCCOZMeXohRf6kOx9rNWgDDoZ60k4TuUeWWIH/0Eh0=;
	h=date:mime-version:subject:message-id:from;

I2S child removal releases its FIFOs and routes through the AHUB.
Leaving the children registered while removing the AHUB clears their
shared context before those cleanup operations can run.

Depopulate the children before disabling runtime PM and clearing ahub.

This issue was found by our static analysis tool under development.

Fixes: be944d42ccc1 ("ASoC: tegra: add tegra30-ahub driver")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 sound/soc/tegra/tegra30_ahub.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index ee68f28852c4..fe04d19dd6c7 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -595,6 +595,7 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 
 static void tegra30_ahub_remove(struct platform_device *pdev)
 {
+	of_platform_depopulate(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
 	ahub = NULL;

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

