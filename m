Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C313EC808;
	Sun, 13 Sep 2026 12:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789303904; cv=none; b=EFmPIm3EcAwiiWoBuzU7MwrbrWg4ZZKxYJ1+iELkYG21GchlUnyMVou7DQ/EsDu+JbfADCmud8dyBUCWbzViXEFoHLaN+17iIXFyHj2Kpcg4KRcNPCXGxuDLeUF5Yem1lHLJS5QnqbvdhXxUBf06SMhPgp17EkM8U+lwEeJpHs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789303904; c=relaxed/simple;
	bh=LWhbqW16r5WnAfB6rxSHxmYaZXVk3VUonavLstqb4sY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rprMvB9uOTrf1qNsCTwjxKVLOyEgWw8+5ZXTBJX5+N7P6GZVSOysumgZS3rT8pCkOU6dBcJPmFnpn/IMhl83BSRiWewQqYj2NhwdKNxJQm4wnWxcWA4dRahiDFhBiU470XhGrR9dSxsc2T+aSLeiHDjoUJ1fqxB3m0kpeWO/gbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=fWTVAZj9; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="fWTVAZj9"
Received: from seu.edu.cn (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d907a3d4;
	Sun, 13 Sep 2026 20:51:30 +0800 (GMT+08:00)
From: Slavin Liu <bolin.liu@seu.edu.cn>
To: thierry.reding@kernel.org,
	mperttunen@nvidia.com,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bolin.liu@seu.edu.cn
Subject: [PATCH] gpu: host1x: skip trace payloads after mapping failure
Date: Sun, 13 Sep 2026 20:51:28 +0800
Message-Id: <20260913125128.109827-1-bolin.liu@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa09ad2a07903a1kunmfcf09f5d251163
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCQkhOVhhPTB5IQklLH05ITFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0
	NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=fWTVAZj9ZDYh5mZwiaWL7sdm7rrfPlM0I/3BCxVzT7h4RC9SPn/nz2o0da0uXv533N/5JDPWPiMckEQDYzJk33ed98a4BzstkxAyAYjF4I68Tz0fM/pwYbyqM4UEjsFP+IEBxUBi56VkZFzgLkGpeCrFCunqp1oaXOkKkXXcwFQ=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=L55+hSVDAZEoQIma2nFnp8BrJuEAPet0gqV7bduNQaE=;
	h=date:mime-version:subject:message-id:from;

Command tracing maps the original buffer independently of job pinning.
An ERR_PTR mapping is non-NULL but is not readable. Skip payload capture
and unmapping when this diagnostic mapping fails.

Detected by static analysis and reviewed with AI-assisted source auditing.

Fixes: 3f257bc63c0d ("drm/tegra: gem: Do not return NULL in tegra_bo_mmap()")
Assisted-by: LLM
Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
---
 drivers/gpu/host1x/hw/channel_hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/hw/channel_hw.c b/drivers/gpu/host1x/hw/channel_hw.c
index a8251ec0810c..19949c99c427 100644
--- a/drivers/gpu/host1x/hw/channel_hw.c
+++ b/drivers/gpu/host1x/hw/channel_hw.c
@@ -28,7 +28,7 @@ static void trace_write_gather(struct host1x_cdma *cdma, struct host1x_bo *bo,
 	if (host1x_debug_trace_cmdbuf)
 		mem = host1x_bo_mmap(bo);
 
-	if (mem) {
+	if (!IS_ERR_OR_NULL(mem)) {
 		u32 i;
 		/*
 		 * Write in batches of 128 as there seems to be a limit
