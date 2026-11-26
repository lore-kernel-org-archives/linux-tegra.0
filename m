Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674681;
	b=2n3dImleumbq0GhVTKStzxXgRLmMKBD9LTNEYv3nBbAU9upI/OF0KOzdImpTld28rXUn
	 CSkeEksGka547odnanJOAM6VP9UBl0IV+JbdIDKwdgJqdptBKRfhZRbo4dVtPuC0oQMcE
	 czMHKXSkqjlrXqstjJy2RC+M81Js2Fa80k4BDI74W1EnbFeIANug1ix/0EmSEJ+UfS9SI
	 qRsyTnlIMJKA0+riZCNJqqbLMRKNJYdBa4QUvHwzutgvWe7wQyMWUQyUcRXh75aLKLJ2J
	 +jD+FOVBP/E2P3JgInznKjYJaBnMvaWbjeAHum8CnVVARr1cGEDmGGSVYguhlmZUA5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674681;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=82qRhdmegVPvNiz96vbA4f9MwYEx4VjlhR0OwmMdhQo=;
	b=uoiVCJkpqeAbDJMoPnMgZ/sCvnfFM8zDkOwlW8OnC17SDE/R/ti8EPVe2r7b1TMXUkUi
	 JnJfGGxnIM5LodkkB2srnQjCzrozH0EK8vPbOxszdH7xwZnlUmWwO5eLfGA/lF6dmA1l5
	 wqjVIT8DtXv1BPbaOLXTi/ZYRcX7RVy9x7ppdHGxZ3wjK3XU9xDQ551CVs8ng64bsfw9n
	 CD5wBSuujwQ2tO//nlKDff7h4yfxqBftpMEtfDjqNOtoiykugzaDhQL8xmXslG4FAESI0
	 Wfq1xcXYU/Y5bQo7ywgZWr4v2YWoiVyMOEoKt4LF7J99zXrfHhrMyEyHXDnEjdYsrsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=qqQJiX1x;
	arc=none smtp.remote-ip=115.124.30.130
Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE07B606A329
	for <linux-tegra@vger.kernel.org>; Thu, 26 Nov 2026 06:31:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE07B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=qqQJiX1x
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795674677; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=82qRhdmegVPvNiz96vbA4f9MwYEx4VjlhR0OwmMdhQo=;
	b=qqQJiX1xlmfgO0A2fnwo1f83j/c3FDf1kvLM05d8Us50Yxmn6tR+VvxUnHC9jMA57DfPx/Q8dDYmP6W/hEdgbiQYxoUS40AYxjcoZkxP1q2n0QDrwdNHt75HcBLCuU7+ucg8QUruvRNdnmbYrGHyIo//fOXft3llX7yJGyxGRAI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=jiangtianfeng@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0XFTbSR2_1795674671;
Received: from h68d07384.sqa.eu95.tbsite.net(mailfrom:jiangtianfeng@linux.alibaba.com fp:SMTPD_---0XFTbSR2_1795674671 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 26 Nov 2026 14:31:16 +0800
From: Jiangtian Feng <jiangtianfeng@linux.alibaba.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org,
	Kartik Rajput <kkartik@nvidia.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Jiangtian Feng <jiangtianfeng@linux.alibaba.com>
Subject: [PATCH 1/3] soc/tegra: fuse: Fix NULL dereference when APBMISC is unavailable
Date: Thu, 26 Nov 2026 14:30:54 +0800
Message-ID: <20261126063057.3245315-2-jiangtianfeng@linux.alibaba.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126063057.3245315-1-jiangtianfeng@linux.alibaba.com>
References: <20261126063057.3245315-1-jiangtianfeng@linux.alibaba.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When APBMISC is unavailable, the warning in tegra_read_chipid() does not
stop execution and the subsequent lazy HIDREV read can dereference a NULL
apbmisc_base.

Return 0 after the warning, matching the behavior before the lazy read
was introduced.

The issue was identified by Kitta automated review. Qoder AI coding
assistant was used to analyze the problem and draft this fix and changelog.

Fixes: 8b8ee2e56f95 ("soc/tegra: Use ARM SMCCC to get chip ID, revision, and platform info")
Signed-off-by: Jiangtian Feng <jiangtianfeng@linux.alibaba.com>
---
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index 3ad462933..9bba59a1e 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -39,7 +39,8 @@ static u32 chipid;
 
 u32 tegra_read_chipid(void)
 {
-	WARN(!apbmisc_base, "Tegra APB MISC not yet available\n");
+	if (WARN(!apbmisc_base, "Tegra APB MISC not yet available\n"))
+		return 0;
 
 	if (!chipid)
 		chipid = readl_relaxed(apbmisc_base + 4);
-- 
2.47.3

