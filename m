Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE6E7262A
	for <linux-tegra@vger.kernel.org>; Fri,  6 Mar 2026 03:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772768945; cv=pass; b=E8B7WzHso3JcsM882rGra5wMVkRL/6P30Y929fqRTvP6DuvwLma1NtgkHQBPGHwOESQrecOUMiiJqPHl5x549HhdiZ+dOy4DG25kmeeDWM3A7P6f6NqfYZqDI36iWqq/Fb/CQtMPfgJQYYBZrU9riuO8+dX2BkBQneB6HxoWv1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772768945; c=relaxed/simple;
	bh=dNUpHR0oTQwJy+ecOBEV2Ruj/VUmFxhcmOhLjQeHLXI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=rQs8ojn22Zmr1Of0eun72xYkibX6PFRz2RUMxkNjUZEJTO5HfiBCmNAP3WaBcL9nkMW4Ectz9NjrnPGjJ+I/wfdSU9AcLKNRPgqvuvBzZAFl2aLw+SASeB6doYWgoc6JCAvsnuxcwVzSihfSSzoaaavgV44LSoTp5tWS+gJhx4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LvVHwdIq; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LvVHwdIq"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7986e0553bdso85974167b3.2
        for <linux-tegra@vger.kernel.org>; Thu, 05 Mar 2026 19:49:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772768942; cv=none;
        d=google.com; s=arc-20240605;
        b=bKDptI4qSMnQ7QfsV+Xavpe1cJ3O41GS+M6Lru+bocZ2yCsTmvD3c5I0gMKhXowhLA
         wU07klnAWs8dhvsUARWv1vK4ufiyoYMWU+lpHjoEnAuvA2/AKeYOyD9MQW9rMtVOYMh7
         Y3Z6AgAFyeGBC+mdac9cT53o4M+wbct/nU7bkDmG8RQtGOuale3p5Zznec2gP2bdtMFy
         Qa53kOUa8/l5W8Kfqq1tDZicQBymK9wmIf3OdxoWFRf3XAuMjBo6yWNAqf3Xykzs13fJ
         OQvnG3SyJ8ZFGdCyMDwmnPLnNOQCbsf1JoyCU7kXO4y4YQ+3GajMJcIYVUS6ICOE9NMr
         00gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=+3KVfu4YF0iDe9x9XbVLpDOnpHDuNLpZRAeCr26k+RA=;
        fh=syTMnTg22NQBHCxTett6+AnBfDWrPbGU49aPl3DW5pw=;
        b=ewg1U6U1gtbSFkOySZ5tivOxjPjORcymuKhqJ7qj11lo/9+cf0he8/7hehVPXVpcVw
         pPrfXSvYhpHn9VCBeDDm0XVYfzVJfVynM6D0fptaMpiBGZO6HA63ggHC7NgvDx1K3t5S
         NKOvvvepYzrGH9JxO4aH29eMo6UbvI0WgcjqS3YQAaLpQqS0laEj6jE97138vB6KLEFP
         gqhsz8vKbfQ/uP6+vgSJrKV8sWUOyKuHCzwHiWvFtUi0mWajAUuN8xJfw6uA9idHX1Be
         khlo0aqW2TDmKlsF41QnKPiCjDgXbPQq1X3yDDzboAnIzGWpS3AlX4mSXE5JUW19w1dO
         /9kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772768942; x=1773373742; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+3KVfu4YF0iDe9x9XbVLpDOnpHDuNLpZRAeCr26k+RA=;
        b=LvVHwdIqvr1onlFNWydzwH8O6VxokMilXmRvotd9owKnCroNDUyg4Tza/OC4ZcD4Mc
         yhD35UZ1eGde+Mjj75NtVl59Szzui7uvty4b1GUFvGOD++vVjTAJEIer2iDiA579x1yE
         vQ58xW/X40JuZ732W+jzB+te2esqnVQVPlMVkvZ5nLUdXn98ZeK7YHz/zdmoypiXkmWv
         AsrErvf4exGz7jPTfO2lr2+leu0ogtyL6uu9j5OVkEARI0PSdQl5IuLJBsBzykCkCvrW
         12cyMQci6To8KdSQGDNdwnN/jR9oSlmQpAq8VRxZGFOntYgwJbZ11/FamcuhcUJcOESm
         M9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772768942; x=1773373742;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+3KVfu4YF0iDe9x9XbVLpDOnpHDuNLpZRAeCr26k+RA=;
        b=tLk7wcJco4+r27K8koBc0AGEbhyLBNYJDpwD/YxYm5NENyq5oXeKxn6EZ+LHv0oWov
         FQtTfIc7Euf3klsWP3jvl4UcnODmGpEcWZRVDJ8p7uF8kYopBnrIfusyzNAHwZKnW+yE
         fB5Ba9W/mvTXrlDDFZGULlUPzukkf7vgdmvHnHSKitY5wHmmsgLupK7cWXN8hjTHvqbZ
         sxASdfLp9qud4gvbXRnEZPSMhCrOWZhlPAh3fUeNLNP7jiyEtBoeHfMHUYn574LBMz6P
         tVJ/er2qHLIKdh4hoTaj0KccU4rJOCXptWKBBgM80YFeUoFLyOyuf16TswxlOg/wSQPq
         nb5A==
X-Forwarded-Encrypted: i=1; AJvYcCXw05vZu/kOLxGur/jXvLKLjAawiwf6rE4ifY18ivecd93EGipnrkf7T5eS8mokxnbhLXsBmti5avOfEA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5oZGFF7VMv0/ZiBq6z0btnzM6qP11zaxpIB6fzHGtOKyj+nKG
	a5hRsefvAVLf7UfAZXPqBMFTfycV5+sIU9QUAbTI0LNydoOhCIIK6A9UOfCvt2v5PwwZe2n7Fe7
	XKKLIDHq8LJVqp3aYYvIWfJL1q1qUV1I=
X-Gm-Gg: ATEYQzyxj8qhRpYCJoJKbATUX+XNZOThu8X+iFUOCQg383Kx4qtbmX09DS8UUip13qp
	FsuPUAKVeaRiXtRFfDdtAerqI1r8MUYojO2CHKbRvqv/yJlE9IpwtHyDRZw5tRlbpOo5xzoOFwk
	/furEwcJfJf6XEzs0EA5WxiEQ/lk8dPBBn6Lc2kxHNEZJftk6MDR+rMLu8PTqn7MGE8RM1NHDgJ
	g+CnJNPnj1I/a135TBHu7L2SmTLJvZ785/Im2ffP6ksQsZXp0+zToU4fb3pvrgqgB2pQNc3OsLk
	BpyTXD8LXw==
X-Received: by 2002:a05:690c:d8a:b0:794:ecaf:c501 with SMTP id
 00721157ae682-798dd787623mr6124827b3.46.1772768941686; Thu, 05 Mar 2026
 19:49:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Owens James <hechushiguitu666@gmail.com>
Date: Fri, 6 Mar 2026 11:48:49 +0800
X-Gm-Features: AaiRm52csMwF0QK4pgCSSR3OS4LQ5YiTwX8PFjLU0ZrSNYhf25gvuUCbgnI340M
Message-ID: <CAEZ4rQ8xmmw8sQ9UX7y3iyE0-UVLEHa10vJwxcajfzcqp2SaYA@mail.gmail.com>
Subject: [PATCH] iommu: tegra-smmu: Fix spacing around operators
To: thierry.reding@gmail.com
Cc: iommu@lists.linux.dev, linux-tegra@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, joro@8bytes.org
Content-Type: text/plain; charset="UTF-8"

From 976ec7e6ca46a3f9f6031b74e2e88f630ae709c2 Mon Sep 17 00:00:00 2001
From: "haoyu.lu" <hechushiguitu666@gmail.com>
Date: Fri, 6 Mar 2026 11:36:52 +0800
Subject: [PATCH] iommu: tegra-smmu: Fix spacing around operators

Fix checkpatch.pl warning for missing space around operator:
- SMMU_SIZE_PT-1 -> SMMU_SIZE_PT - 1

Signed-off-by: haoyu.lu <hechushiguitu666@gmail.com>
---
 drivers/iommu/tegra-smmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 67e7a7b925f0..58ccaa74475b 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -137,7 +137,7 @@ static inline u32 smmu_readl(struct tegra_smmu
*smmu, unsigned long offset)
 #define SMMU_PDE_SHIFT 22
 #define SMMU_PTE_SHIFT 12

-#define SMMU_PAGE_MASK (~(SMMU_SIZE_PT-1))
+#define SMMU_PAGE_MASK (~(SMMU_SIZE_PT - 1))
 #define SMMU_OFFSET_IN_PAGE(x) ((unsigned long)(x) & ~SMMU_PAGE_MASK)
 #define SMMU_PFN_PHYS(x) ((phys_addr_t)(x) << SMMU_PTE_SHIFT)
 #define SMMU_PHYS_PFN(x) ((unsigned long)((x) >> SMMU_PTE_SHIFT))
-- 
2.53.0.windows.1
