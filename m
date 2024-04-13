Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A9E1BF3A
	for <linux-tegra@vger.kernel.org>; Sat, 13 Apr 2024 00:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712967941; cv=none; b=F6Em3K2zHT5TIQy565DZKIgSheFibxt4Zs6ODqm6M5e5KkpdUDxzFNJQU/BVWIr5wxU/zmNkLqNU0RpMjXh4jFTIUskCWyV3CmNLOCZZ6GWlruWKOjFeiR5mVHfVjoJFa3oFv8afXsfC0sjJghncB+jzBAS0MVLj2czfkxiYWG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712967941; c=relaxed/simple;
	bh=fNKEMni8L+TwNDH7fzX9Zj2Y7BaWR3Ha5nbbXS21XV8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gQVksLECOT8BMJMwx1PezpkmhAPQKVxAjuQvFhljPvxJVt1B8Hqxfnxl+bVHpxepkK9HMz1+L7fQLFv/r6vj5dcUsZQk4niNht/en/HPnYlaWa9z0Wa8Iso+Km9fQqz59Grk3MRxUuZAZlox9yhmz+VJU3CenjOxND/sZHBB5o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=XrihC9tR; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="XrihC9tR"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6ea26393116so1127321a34.0
        for <linux-tegra@vger.kernel.org>; Fri, 12 Apr 2024 17:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712967936; x=1713572736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oW/KEiSNsnRBw/l+ZCWeQ/h6Gx3xayfzLPqYuXkw+Zo=;
        b=XrihC9tR7Fu9+3DgAE6wJ6Ouv3jL4sdn8fRoMY57ngLor7eBfAeB3ufaepWGwQzxe1
         qDDOKrxg6EgbygUaBBrXzW2rEiRsO9ERlVV+vjgb7QG7iaxaGyCw2vluC61Qfdd78DYF
         KJcvAQxZJVKX3+NRcIJwA0AolVpTQFwZ6tkflPVR2YEJOP461tSusi7Oy6d199yAe9QC
         vC66SQc+FxysiqnAJxSd9hGYAKNeli7w/C6RTHMoTZqEOZXJSEh5PPZCijE/JH/mOoUa
         gi+PUzl0TNtKJNMfsWbuhaTfWwzyueqByFHrzq5A8jKEj4tcD9Ty592Z5He7BifM1dO+
         e9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712967936; x=1713572736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oW/KEiSNsnRBw/l+ZCWeQ/h6Gx3xayfzLPqYuXkw+Zo=;
        b=R0kMIG4hcx4YoBgvrn+6LIR1BcJu91tu0nbCM3UnCCDjoFNzU0nHky972FJtxZfMev
         xcII/hEVm5tsHlx8sHnnxa9JP9KgyANhlSQ5EK/l6ejTmYiWHDKJiW2TUomjuJ44BP19
         0+30EKss6Zw3Oz8UNhJtFp/+KlwocX3c/xa++rxdxih8aaQ57n2UQHODczRnnZBV/K+v
         mPVbPlk4Fpqn7HWEchlKeKS0lRdjy4Ou8y8xSykgLnKuPM5YLismUYcGs/OK9S1b+sjJ
         F216ttawPI+3V2AFqhFWhlsMHVj1UF5rhnJOQZ3W3c+JcJRl9q07NxcA3r89HQMxTHN2
         qCUQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+VOvfp5ElIeMA5w+Um1n0cFP9kJ0pMJrbDRSlyVnEm1oGSWsOXJGECxvvvzG0x/93Q9B35jdw1g18kSm5TxU1G57chuQduJZRLiI=
X-Gm-Message-State: AOJu0YwkLUxctmslwoyNT+lHOipyxKK5yI1wVxHk3Ui2iWRNryqO14/N
	LNPWVNCbZAXx2QyP88DJAIvijjW83STbDW/eNWN7q2fJ+Afug30FnCSR+qQ18i4=
X-Google-Smtp-Source: AGHT+IEyUReT/k6LJnKcktKQV3wXgSN/KWZ97Vz9yLFBdXAq+5mOndsoGpnTEJQKhqddAuehqON2DA==
X-Received: by 2002:a54:4393:0:b0:3c7:203:789 with SMTP id u19-20020a544393000000b003c702030789mr42394oiv.37.1712967935759;
        Fri, 12 Apr 2024 17:25:35 -0700 (PDT)
Received: from soleen.c.googlers.com.com (128.174.85.34.bc.googleusercontent.com. [34.85.174.128])
        by smtp.gmail.com with ESMTPSA id wl25-20020a05620a57d900b0078d5fece9a6sm3053490qkn.101.2024.04.12.17.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 17:25:35 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: akpm@linux-foundation.org,
	alim.akhtar@samsung.com,
	alyssa@rosenzweig.io,
	asahi@lists.linux.dev,
	baolu.lu@linux.intel.com,
	bhelgaas@google.com,
	cgroups@vger.kernel.org,
	corbet@lwn.net,
	david@redhat.com,
	dwmw2@infradead.org,
	hannes@cmpxchg.org,
	heiko@sntech.de,
	iommu@lists.linux.dev,
	jernej.skrabec@gmail.com,
	jonathanh@nvidia.com,
	joro@8bytes.org,
	krzysztof.kozlowski@linaro.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	lizefan.x@bytedance.com,
	marcan@marcan.st,
	mhiramat@kernel.org,
	m.szyprowski@samsung.com,
	pasha.tatashin@soleen.com,
	paulmck@kernel.org,
	rdunlap@infradead.org,
	robin.murphy@arm.com,
	samuel@sholland.org,
	suravee.suthikulpanit@amd.com,
	sven@svenpeter.dev,
	thierry.reding@gmail.com,
	tj@kernel.org,
	tomas.mudrunka@gmail.com,
	vdumpa@nvidia.com,
	wens@csie.org,
	will@kernel.org,
	yu-cheng.yu@intel.com,
	rientjes@google.com,
	bagasdotme@gmail.com,
	mkoutny@suse.com
Subject: [PATCH v6 11/11] iommu: account IOMMU allocated memory
Date: Sat, 13 Apr 2024 00:25:22 +0000
Message-ID: <20240413002522.1101315-12-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
In-Reply-To: <20240413002522.1101315-1-pasha.tatashin@soleen.com>
References: <20240413002522.1101315-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to be able to limit the amount of memory that is allocated
by IOMMU subsystem, the memory must be accounted.

Account IOMMU as part of the secondary pagetables as it was discussed
at LPC.

The value of SecPageTables now contains mmeory allocation by IOMMU
and KVM.

There is a difference between GFP_ACCOUNT and what NR_IOMMU_PAGES shows.
GFP_ACCOUNT is set only where it makes sense to charge to user
processes, i.e. IOMMU Page Tables, but there more IOMMU shared data
that should not really be charged to a specific process.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Acked-by: David Rientjes <rientjes@google.com>
Tested-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 2 +-
 Documentation/filesystems/proc.rst      | 4 ++--
 drivers/iommu/iommu-pages.h             | 2 ++
 include/linux/mmzone.h                  | 2 +-
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 17e6e9565156..15f80fea8df7 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1432,7 +1432,7 @@ PAGE_SIZE multiple when read back.
 	  sec_pagetables
 		Amount of memory allocated for secondary page tables,
 		this currently includes KVM mmu allocations on x86
-		and arm64.
+		and arm64 and IOMMU page tables.
 
 	  percpu (npn)
 		Amount of memory used for storing per-cpu kernel
diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index c6a6b9df2104..707e39280a9a 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -1110,8 +1110,8 @@ KernelStack
 PageTables
               Memory consumed by userspace page tables
 SecPageTables
-              Memory consumed by secondary page tables, this currently
-              currently includes KVM mmu allocations on x86 and arm64.
+              Memory consumed by secondary page tables, this currently includes
+              KVM mmu and IOMMU allocations on x86 and arm64.
 NFS_Unstable
               Always zero. Previous counted pages which had been written to
               the server, but has not been committed to stable storage.
diff --git a/drivers/iommu/iommu-pages.h b/drivers/iommu/iommu-pages.h
index 1264b0f6b6c3..82ebf0033081 100644
--- a/drivers/iommu/iommu-pages.h
+++ b/drivers/iommu/iommu-pages.h
@@ -30,6 +30,7 @@ static inline void __iommu_alloc_account(struct page *page, int order)
 	const long pgcnt = 1l << order;
 
 	mod_node_page_state(page_pgdat(page), NR_IOMMU_PAGES, pgcnt);
+	mod_lruvec_page_state(page, NR_SECONDARY_PAGETABLE, pgcnt);
 }
 
 /**
@@ -42,6 +43,7 @@ static inline void __iommu_free_account(struct page *page, int order)
 	const long pgcnt = 1l << order;
 
 	mod_node_page_state(page_pgdat(page), NR_IOMMU_PAGES, -pgcnt);
+	mod_lruvec_page_state(page, NR_SECONDARY_PAGETABLE, -pgcnt);
 }
 
 /**
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index be17195f6f86..8f9c9590a42c 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -205,7 +205,7 @@ enum node_stat_item {
 	NR_KERNEL_SCS_KB,	/* measured in KiB */
 #endif
 	NR_PAGETABLE,		/* used for pagetables */
-	NR_SECONDARY_PAGETABLE, /* secondary pagetables, e.g. KVM pagetables */
+	NR_SECONDARY_PAGETABLE, /* secondary pagetables, KVM & IOMMU */
 #ifdef CONFIG_IOMMU_SUPPORT
 	NR_IOMMU_PAGES,		/* # of pages allocated by IOMMU */
 #endif
-- 
2.44.0.683.g7961c838ac-goog

