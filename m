Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645484;
	b=qpfUbKwNYlOxN5HPtjCP3mfI6wewJNZy2kQaGFa8zIryGSWff67UH1I23XpsuuICExod
	 Z8a/oZ9F9Os4hF03uX3E8R48kPzuPoIK2IgL6hRa7b5HD/WNoN6EuKWfWWj9Jgxc73tcJ
	 inWkfvKuQFdp+C0eihtumOfMIKK/XaL/oJZ7DYVM48P+nDC2G7f3ORlz+zVuCTJnav/aj
	 ceYyYgcnGKcq//6ptUnubrJfiaVYsECpk/KfkicuhIMuVpLNA55NuZcvx1TB1NcRQjtWh
	 KTjXDjJLkZH89inYVtadbxsy04drYKP9Lq+aIxvgRRQEB+qp4AxNsFagdsTArxL5JeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=jDuBt5Cw+ANUexZtA4dNwo8xhQaNML2KuCiDPiA1qKE=;
	b=HKmMFDvwZ9Uq78JJ66jHxVmCXb3Z42XkaQa4VUA0VYD+72MvkFMekgPBECAG+bOZ+fDH
	 LDy6DMjaMseN2l6Qyz94dPGdIHyNr0Dh5WtKtKl/7YoukOfB/gorG40tHkVN+bXyJtsqN
	 hmjLCTvzvAIltVVf2xgWrg8QaowOMN2DEgbZKFeB1MNsiOgG1q5TJwEm09AXv85TPunIx
	 nvZp6eTirqLs2zG4FL4Up3sSsr8HYxklfrG3yks6m9t/bMMef3q6FlxKFBncZ8Fx0n+Pm
	 +tg60IBvZh5o/MJrku2nwAw/iR25nsoevS/pO9GFYL6Pd0OR0zjDBmqcCBXhchiRGIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JXRLJNAt;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FCA60A2603
	for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 22:24:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36FCA60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JXRLJNAt
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-384c78aa0dbso8369459eec.0
        for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 14:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645482; x=1796250282; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jDuBt5Cw+ANUexZtA4dNwo8xhQaNML2KuCiDPiA1qKE=;
        b=JXRLJNAtqY2xrrTdJrj1OwqP8qcbbDOO/xgOwggr4RT/JkRo7IusUASaRTFh+44RR7
         6ti/rmoDIQtVOlH6Rnyc/zrJ0NOi88npY2ptZpdREQQrMhjNe+XisDkcxNWjNYVcsaDn
         PeO0ABd2Qk2g5u0QB4T2RqGnFntRv+fNKY7b5R5fy+3HlisMC/d5yizhHs/5LMLe3vF8
         29lS3FyHAN8/d0+LBtNBvuaAPYzu/fv09ZtO5X07hzvTCJ2QYxtTRVQYMonbjesh+xE+
         oyjb0w8wV4MtzSPUsWuzGS1/lIWvH1IFXZEHfpDnR95A9mL+w9HWkD47zWmgruRR9aRm
         fDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645482; x=1796250282;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDuBt5Cw+ANUexZtA4dNwo8xhQaNML2KuCiDPiA1qKE=;
        b=IgWCNeXgeESOSb+AHGtBzZFDxp5XoX8gUJTJSgjD2qG1xI1ukiG0AgWzu500UZlb4P
         iaxXJ16YZxXP+TpvWAMQtk6xV1xXVbduZoGAKniNRqCowZhKCDbu408h9EBiMChnPB6k
         nuXyNyIB2RkK8Ckw/ZFlDDHLnZd95nWznxpHpvdDvsgBJF8bmcR2V+Soa1KS6Rl8gPJW
         6rnZEz1pmdbMwV7VoP7RQrdvNyNJz7KjCrcez7TZVBTz5q/Od/azr5Wv3KFp61siyu5K
         QxTjPo3f070J7V+3jVLDKWVHSH6mTknRwaNU2W/qCubu3M4ozTXE0jUQF5WCkL3crn3Y
         1WMw==
X-Forwarded-Encrypted: i=1; AL+hErHzNMtB1olaVe8kGluJri5xm61pa1KoU4wFAPsvUlpDQ1MSDW5UsGn1G2eCU/14m4AHSrDAJxSnIehDlQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+CnooqDOunBCXO64NC0boEgcxDGBA4/0g5eoW6/YOgv1MjxlHL
	VjfY+PJjmzF6N+ZyBZ44/KIkEBkVP/7RYEd7V133H8fl12mu6TTKJmHcPMOvhAa3iGZ0TBv1u0c
	3bQ==
X-Received: from dycuf5.prod.google.com ([2002:a05:7300:105:b0:386:9be5:2d95])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:638d:20b0:375:c862:31c
 with SMTP id 5a478bee46e88-38571816d35mr18955075eec.40.1795645482015; Wed, 25
 Nov 2026 14:24:42 -0800 (PST)
Date: Wed, 25 Nov 2026 22:24:33 +0000
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222433.1442338-1-elkin@google.com>
Subject: [PATCH] iommu/arm-smmu: Fix use-after-free in nvidia_smmu_impl_init()
From: Elkin Cruz <elkin@google.com>
To: Thierry Reding <thierry.reding@kernel.org>, Will Deacon <will@kernel.org>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Krishna Reddy <vdumpa@nvidia.com>, Robin Murphy <robin.murphy@arm.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In nvidia_smmu_impl_init(), smmu is reallocated with devm_krealloc() to
embed it within struct nvidia_smmu. When devm_krealloc() moves the
allocation, the old smmu pointer is freed, leaving nvidia_smmu->bases[0]
dereferencing the invalid pointer.

Read base from nvidia_smmu->smmu.base instead of the stale smmu pointer.

Fixes: af9da91493e5 ("iommu/arm-smmu: Use new devm_krealloc()")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c b/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
index 2fce4f6d4e1b..a3884966dc29 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c
@@ -319,7 +319,7 @@ struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu)
 		return ERR_CAST(nvidia_smmu->mc);
 
 	/* Instance 0 is ioremapped by arm-smmu.c. */
-	nvidia_smmu->bases[0] = smmu->base;
+	nvidia_smmu->bases[0] = nvidia_smmu->smmu.base;
 	nvidia_smmu->num_instances++;
 
 	for (i = 1; i < MAX_SMMU_INSTANCES; i++) {
-- 
2.56.1.839.g22a8290db9-goog

