Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674683;
	b=RtCpPJfBD6CHHbJ6FjVlae9V+4yJiLzyhP+/ysLKxn9KY8BHnX7QJRrtpFGGwcT9xRlp
	 tx1x6L4ggyINggGY+4QU9uEl5nyRhTpb7IkHIEgheuDhFEo0yLO6HmwCcW7CFPX5XwFJO
	 CbZ3cO+es1TomwPEz4sP/rZ3qvr58GLd06s4OAufTYuM1Y0UMKe3Piqyo3Sl/kSBd5Hzi
	 3UybNG376iH61MjKkyAP5UtWy7f9oUF394jfj3zalFreaDye06yD5YIzghXlJQjWIuVPm
	 m+9O0vzpRizZhs71jjcyEAzfKairk5ggO2jZQtwbYbFCemp7Etse/8frm8ollPvSCjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674683;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4Qul7kMEv1lFsj3CxtFzKHtKLYThDmQ3UZdeOcZuf4Q=;
	b=Bhd7wdWW3TA3ilR7Bw9x1g0AV0CcqFPETh0+lGjzfzgQm0OjmwnibZE6jDXR+PrIKYbc
	 cCuqofbBSuPmm2ykJq82YrEglW8BdLroo8nGC0Ww330ivJj8vEQMDubvAAILEsC/oqrZI
	 ahK9vQz3Qc8ZpV6WPt/v9b4U5rD+LsLHZQTv3F4FWrSQbP0L+uxRluQVg+WV6hogvvKq3
	 eMmu7MBsRiTnU/hq/tGN0ggiDzfn+BMmdPwRDq2OPiq/gW5R38iO+j3U62s0ZvGUd6bmM
	 SOJGGG2MN5iajTphuYExGiYKtfKcphUIbSYI88wb2IkXkFeV7scQ0nLLl6QqHhCxjgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b="ZrORHo/3";
	arc=none smtp.remote-ip=115.124.30.97
Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7FD606A683
	for <linux-tegra@vger.kernel.org>; Thu, 26 Nov 2026 06:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA7FD606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=ZrORHo/3
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795674672; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=4Qul7kMEv1lFsj3CxtFzKHtKLYThDmQ3UZdeOcZuf4Q=;
	b=ZrORHo/3DtLZ2jmEBM8G0NOTDrXgYQPYoYg1xFiF+m2IlAo+rQtPPOQbd2jkFAai+2Km55Rrzt29rmB/IWYry0kWkyhKgXF3JD0dd6/Ge3jG9KVTcjuod7EiKmBL5u7prHXdulmmG+foQZ9nxhVzhKO6bxJXXuI82cVjTZxp7Fs=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=jiangtianfeng@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0XFTbSLR_1795674659;
Received: from h68d07384.sqa.eu95.tbsite.net(mailfrom:jiangtianfeng@linux.alibaba.com fp:SMTPD_---0XFTbSLR_1795674659 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 26 Nov 2026 14:31:11 +0800
From: Jiangtian Feng <jiangtianfeng@linux.alibaba.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org,
	Kartik Rajput <kkartik@nvidia.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Jiangtian Feng <jiangtianfeng@linux.alibaba.com>
Subject: [PATCH 0/3] soc/tegra: fuse: Fix SMCCC and probe error paths
Date: Thu, 26 Nov 2026 14:30:53 +0800
Message-ID: <20261126063057.3245315-1-jiangtianfeng@linux.alibaba.com>
X-Mailer: git-send-email 2.47.3
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

This series fixes three error paths in the Tegra fuse driver:

- avoid dereferencing a NULL APBMISC mapping in tegra_read_chipid();
- remove and free nvmem lookups when probe fails or resources are released;
- avoid indexing tegra_platform_name[] with an unknown platform ID.

The first two issues were introduced by the SMCCC and probe-time lookup
changes. The platform bounds issue predates SMCCC, whose wider platform
field increases the range of invalid values.

AI assistance disclosure:
Qoder AI coding assistant was used with the Kitta review findings and the
relevant ANCK/mainline source as inputs. It contributed to the problem
analysis, code changes, and changelog drafts. checkpatch.pl and make were used
for local validation. The human submitter reviewed the complete series and
added their own Signed-off-by tags.

Validation:
- patches apply to torvalds/linux master 8d7fe9885c62 (7.4.0-rc4);
- current mainline sources are identical to the base for both touched files;
- independent review found no High/Medium/Low code defects;
- checkpatch.pl reports 0 errors and 0 warnings for each signed patch;
- drivers/soc/tegra/fuse/ builds on aarch64 defconfig;
- a complete aarch64 defconfig Image builds successfully with SHA-256
  8e35101c2745bd2d64ebad1065685c4d76b662d154d411a34d391820bd1f2c60;
- the final tree is e35c03a0ccbe95b1d49caeeb713b5019adbefec7;
- the three fixes also built previously in the ANCK devel-6.6-arm tree.

NOT_RUN:
- runtime APBMISC mapping failure injection;
- runtime probe-defer retry and lookup lifetime validation;
- Vera hardware and ECS workloads.

Jiangtian Feng (3):
  soc/tegra: fuse: Fix NULL dereference when APBMISC is unavailable
  soc/tegra: fuse: Clean up nvmem lookups on probe failure
  soc/tegra: fuse: Handle unknown platform IDs safely

 drivers/soc/tegra/fuse/fuse-tegra.c    | 24 ++++++++++++++++++++----
 drivers/soc/tegra/fuse/tegra-apbmisc.c |  3 ++-
 2 files changed, 22 insertions(+), 5 deletions(-)


base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
-- 
2.47.3

