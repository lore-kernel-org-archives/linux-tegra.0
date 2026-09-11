Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A983E9C11;
	Fri, 11 Sep 2026 06:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789106979; cv=none; b=p2BwxzdQO/xirZfv8m9Bm0g2gk7e5DGRtQ9ic4D732aST5qbIz3EBpQviDlU5AanCgL+gMwNXDGpUG+qlcU5yyVg/yCuvieH0/x/VvwwEbGwUDhchm7XgxkpyqB4GUNeqmYmHWsSqgNa7ydMbP06wQDV66lRRsKwixuXvhkyLBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789106979; c=relaxed/simple;
	bh=Qshpm+aHfsJ7xddFeJ/htxTCXnk57g+5NEVxYt7bmGI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G1IY9apDwyBRNi+TDY8ANu+ZS8kkl4UcIks4XC8r+4iLegtjcWNbG1nYVmX7SnqGDz0OQPybs9DLixwEsHqUZxxVAg7iMGyxKvV7gZ1WOE4MAntrSDgTg4/FJAPJMe4yw5/Gdx9j54g4XDP3FfEPmDS5RPiaw0APYSsExufc7uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=SKmq6zxU; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="SKmq6zxU"
Received: from seu.edu.cn (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d62c4fcb;
	Fri, 11 Sep 2026 14:09:33 +0800 (GMT+08:00)
From: Slavin Liu <bolin.liu@seu.edu.cn>
To: thierry.reding@kernel.org,
	mperttunen@nvidia.com,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bolin.liu@seu.edu.cn
Subject: [PATCH RFC] gpu: host1x: validate the firewall source mapping
Date: Fri, 11 Sep 2026 14:09:33 +0800
Message-Id: <20260911060933.94619-1-bolin.liu@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa08f15ebce03a1kunm50d7925d1c7389
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGUlIVkkaSx5NTklDGB5NH1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSU
	hOQ0NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=SKmq6zxU8AbvNDJYWvMjw56qUT3NfSgqVANAOs+nkFod9AgPWHuNgBwVxihCQ4qQzjNMOovnvvKwVyzyBkPxaUKoqZ35hC/vjW2Lw2EeLXqTmbCsmSn4zh0Ef2+U1l24Ev3a/F1fwJTIxiTzmfOKQHn56HUQvThUshaGfLU4lDM=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=259Tqt2SMjWpJUP49MEqUUEWra0KBcMh3JuBwiQtpaU=;
	h=date:mime-version:subject:message-id:from;

DMA pinning and CPU mapping are independent operations. Reject an
ERR_PTR or NULL source mapping before copying gather commands. Return
the mapping error through the existing job-pin unwind path.

Detected by static analysis and reviewed with AI-assisted source auditing.

Fixes: 3800391db1b2 ("drm/tegra: Add PRIME support")
Assisted-by: LLM
Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
---
 drivers/gpu/host1x/job.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index 71411bc344bb..b8e7a2752cd5 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -575,6 +575,10 @@ static inline int copy_gathers(struct device *host, struct host1x_job *job,
 
 		/* Copy the gather */
 		gather = host1x_bo_mmap(g->bo);
+		if (IS_ERR(gather))
+			return PTR_ERR(gather);
+		if (!gather)
+			return -ENOMEM;
 		memcpy(job->gather_copy_mapped + offset, gather + g->offset,
 		       g->words * sizeof(u32));
 		host1x_bo_munmap(g->bo, gather);
