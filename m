Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E625352001
	for <linux-tegra@vger.kernel.org>; Tue,  4 Aug 2026 12:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785846041; cv=none; b=EBEogYT00L0J3h3ximyzEYQ35/Y0Q6+CLQZRvgEwlSUOSktOw9cWoV9GxntzwQTEd7e+r7h+Y7qJ4XL29tQ3USV8+57hFbjiC3U8mUOX42nE90a4aFGc2OFgriSRe4FLAmGml32TFl3coXKsQSvoEc5jZgAJaLNZceSLnWS5Lj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785846041; c=relaxed/simple;
	bh=Hp6aLNn275JmNLPYh/eTbNn8GdmagZjg9QibHIK4ueM=;
	h=Subject:References:Content-Type:To:From:Date:In-Reply-To:Cc:
	 Mime-Version:Message-Id; b=Ldx40xxOc11mRsr0Dcr4QUhrnr1QxNgLoy9DFIxfOD/XPC8ruBlAcXaqGOUYN+8TVrBzlckGhDdkRzA1CSShW/DP8U8jDAvjuQzjove6kTE9likoeTOpZPnnZ3c1ptb2hxQqGfvX4P2HnWq8M2v/yYIpqEHOdZRjI87O6+ZKP/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=qm5FrFYJ; arc=none smtp.client-ip=209.127.230.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="qm5FrFYJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1785846028; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=cv3OOqW6cOXEbudRes0ZDzwcdSQHPXwcKdHoJ3LM2Aw=;
 b=qm5FrFYJsciMWeegPN9KtpkEj1h2taug5ZYCrOBSVTTGf7ERJSHJeASSIpB6bAfr915s9x
 W2NKmd54lO2ADmK375H+vFvWkv66SxGEjW8C9WsjSFJrfemG3W+ABwNC1+1xpn9AICNti7
 WyYE7ZtxmDKs3RxnwC3astt653aUsRHJSw3ejPdaQzrJKQVF7YY8/itV1T1h6i29k7nnBp
 stKkXoQNhig4i6KXI3U441p4PAjkM3EgVdhOi+fRvcYlDmwCMU5K9KFxSC+RpjICllOFaN
 rDWlHVRvSAlOggHVl6OBalhHPTA6ggk3CBgvDP1KsvDFjJu3AeE6ZHqaTjUswQ==
Subject: [PATCH 2/2] soc/tegra: fuse: Add missing newline to APBMISC error message
References: <20260804121910.4961-1-guojinhui.liam@bytedance.com>
X-Lms-Return-Path: <lba+26a71d90a+216a81+vger.kernel.org+guojinhui.liam@bytedance.com>
Content-Type: text/plain; charset=UTF-8
To: "Thierry Reding" <thierry.reding@kernel.org>, 
	"Jonathan Hunter" <jonathanh@nvidia.com>, <linux-tegra@vger.kernel.org>
X-Original-From: Jinhui Guo <guojinhui.liam@bytedance.com>
X-Mailer: git-send-email 2.17.1
From: "Jinhui Guo" <guojinhui.liam@bytedance.com>
Date: Tue,  4 Aug 2026 20:19:10 +0800
In-Reply-To: <20260804121910.4961-1-guojinhui.liam@bytedance.com>
Cc: <linux-kernel@vger.kernel.org>, "Kartik Rajput" <kkartik@nvidia.com>, 
	"Jinhui Guo" <guojinhui.liam@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20260804121910.4961-3-guojinhui.liam@bytedance.com>

The error message printed by tegra_acpi_init_apbmisc() when failing to
get APBMISC memory resources is missing a trailing newline. This can
cause the message to be merged with the following kernel log line, making
the log harder to read.

Add the missing newline to keep the error output properly formatted.

Fixes: 7b0c505eb341 ("soc/tegra: fuse: Add tegra_acpi_init_apbmisc()")
Signed-off-by: Jinhui Guo <guojinhui.liam@bytedance.com>
---
 drivers/soc/tegra/fuse/tegra-apbmisc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/fuse/tegra-apbmisc.c b/drivers/soc/tegra/fuse/tegra-apbmisc.c
index 6af69ccaa295..f86c88fab168 100644
--- a/drivers/soc/tegra/fuse/tegra-apbmisc.c
+++ b/drivers/soc/tegra/fuse/tegra-apbmisc.c
@@ -309,7 +309,7 @@ void tegra_acpi_init_apbmisc(void)
 
 	ret = acpi_dev_get_memory_resources(adev, &resource_list);
 	if (ret < 0) {
-		pr_err("failed to get APBMISC memory resources");
+		pr_err("failed to get APBMISC memory resources\n");
 		goto out_put_acpi_dev;
 	}
 
-- 
2.20.1
