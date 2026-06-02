Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEE236AB56
	for <linux-tegra@vger.kernel.org>; Tue,  2 Jun 2026 16:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780417899; cv=none; b=ZVk5oh31tTiPlvAIj42op45Jjo2vWixQvDk+8KOj5DfNnIwisHfq/aEjTr4mJT/gtpfkigzLKP3vehWaHVkGv08EkSYAezSPqEM/RAqfZTnhKg8Uz/QI2ZQ1wWJNa/Y2M1M/pnWNxBdyKmDABI9Ksio0PV5LpyFjnm9P+CJZXHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780417899; c=relaxed/simple;
	bh=CSTC02ii0lruepODLI+iYCJNiDatC6zL7czgc+P0mCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uX345lCuMehLS5xbOI8iSpafgdoFUw4ZKerL2XsqUCV+Xj7SUmwgUAA0w9KPaUp4hUK7lpvzZhhKHmLpdLGV/N2Xhg54dCPtj8riihRaLl5ns3qVMyi8wVLLCNHk5C/HmAyy8hGwv5r/KNNVJcpWNYhZc/J7p18JvMpBAAvUWqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DRwEu3MK; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DRwEu3MK"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4891b4934ffso75e9.0
        for <linux-tegra@vger.kernel.org>; Tue, 02 Jun 2026 09:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780417895; x=1781022695; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FlRHqIhFldT/P3WJ4jK0htPSdl8EjLN6zWd/GbTbNRM=;
        b=DRwEu3MKdlpgMctr0N9/zLcUzvXzp7naNWl3IPtdj9mdfqjaIyGyskHnZpqxZy4n5c
         9IHyX8KliUe3FCDpAiv1yPBsJQaKa44O0CQKsZLKaFD4WpN3SrsiVFKicjnrSjbHkgfk
         PwJGlLOA9lFjckfC3Dny+6ZOV5QUKjfdLfcV7nESJOOyeOWkStwyVCb1bQtfix9dpBiS
         bEe/A5rkR1PUcbCkjJAd/ZZZweFEh8Wee3zLGo4ibpcaBpZBDSvdntBTqFvEqdpdITE+
         KtRusvi1mj7AHmEDonDVEYfWpL4hrWKeOoDYVzO9B5iBMq4XTS1Cn+TvrltNi2i2Rtvs
         YkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780417895; x=1781022695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FlRHqIhFldT/P3WJ4jK0htPSdl8EjLN6zWd/GbTbNRM=;
        b=huhRSTaSi4utgr1rnAoZL/QkuDbWBq9G/+rdPESTrdLCSI8HRTCAvOVl6vmIUCD0Pu
         WDnzHUDUxnmHAPxVtEAmU+b9fLhVhaQpMC04y6BMcjchCXjcmct9Fsj1r8NzJazZrgY/
         U901pf08LZmzPlLJWh6ErbreYeGzwW/YXAL49cnHMaMxMqhaX+FESEvBGCPw4xs1cEGA
         ZIIif/UwnZhRPhugqOWmvluHDuHScP6dTmpBHhQRLFSacDJZHcsnktMR8AxGPXabVEWd
         W4MVIeSqA1zaJZ6w4gAX9WxHZjNF83OsgCYqK/JWaAAAYY1yCd0ulgmVudTmpVfVZ+1E
         FmbA==
X-Forwarded-Encrypted: i=1; AFNElJ+v6TbHSW8SoZD9GDh2HvLohCyRokCls4K5WcFpT7VGD18mHXPCA1uqBPYjIZ5enVKr5l9gaWnEfduSwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMfO/ElBDM6K0Kp/ezFuI7PD703P1EOPJvJM4FAQ03kqiyMt7q
	9gEqQ7D+fAEwwHhhIwQafndEPrlzgxhshaX8WUQN920XsjXKPFc6zx2jst8GkEwyHw==
X-Gm-Gg: Acq92OHkxy+MjQlO3qr7K+bfzgLzR9cGw6LlGU5QeiCQX2gMcIxqTGBmEVoagf/Mvgz
	X/hagLDyanD5hiRE1kbkC5+VbyfKQCiWhmw38nhMCYwum5Z0kvqIYMltQYNRPc//FBDIQr6mW0Y
	YU1qoxzDKGDMLy5ElSaPyvFOJOwHH5yrb1U1sA9tStJMqA7dePcOuhLmi/6sYnDEwWEArZfh16f
	N0cYnTClpESGQHVF2eO+xNnK4GkSLKAs4tPxJlRjzQg3hWuuNkpaHcLhispc416d6SKedNqYxmW
	SHBFkDLDJF3BqYPKSrI1lI79Hd5c37DOe3OgPmI6zkWg7ofs/BMKL3pUhVw4NtBS9N5Z8oWAs+8
	SxLsveMDJ2diHdLbR0gRp69aTcrQtl6QZZcClJQscHyDFhOAzhcxJqybS5XRtXB7y9xETY9tgLn
	opuhwo7X8DCEsthv1bQ815qD20hx0Y2uJZd+0aE6ek2q1Qg7e1dkSqPljneCLwHY00GD+gOw0v
X-Received: by 2002:a05:600c:5716:b0:490:b0f1:3422 with SMTP id 5b1f17b1804b1-490b11655c0mr1634475e9.10.1780417894903;
        Tue, 02 Jun 2026 09:31:34 -0700 (PDT)
Received: from google.com (203.80.140.34.bc.googleusercontent.com. [34.140.80.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b29f49b8sm50555595e9.15.2026.06.02.09.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 09:31:34 -0700 (PDT)
Date: Tue, 2 Jun 2026 16:31:29 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Ashish Mhetre <amhetre@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca,
	nicolinc@nvidia.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 0/3] iommu/arm-smmu-v3: Tegra264 invalidation
 workaround
Message-ID: <ah8FYa0hdkkAFQVp@google.com>
References: <20260601104845.995005-1-amhetre@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601104845.995005-1-amhetre@nvidia.com>

On Mon, Jun 01, 2026 at 10:48:42AM +0000, Ashish Mhetre wrote:
> Nvidia Tegra264 SMMUs are affected by an erratum where a TLB entry can
> survive an invalidation that races with concurrent traffic targeting
> the same entry. The hardware-recommended software workaround is to
> issue every CFGI/TLBI command (each followed by CMD_SYNC) twice. The
> second issue must execute only after the first issue's CMD_SYNC has
> completed, giving the sequence:

This seems quite intrusive, will the TLB entry survive if you push a
full invalidation instead?

Thanks,
Mostafa

> 
>     TLBI/CFGI ... CMD_SYNC TLBI/CFGI ... CMD_SYNC
> 
> ATC_INV is not affected and must not be doubled.
> 
> This series implements the workaround by hooking the duplication into
> arm_smmu_cmdq_issue_cmdlist(), the single chokepoint that every
> synchronous CMDQ submission flows through.
> 
> Patch 1 is a preparatory refactor that factors the existing batch
> force-sync conditions out of arm_smmu_cmdq_batch_add_cmd_p() into a
> new arm_smmu_cmdq_batch_force_sync() helper. No functional change.
> 
> Patch 2 detects affected instances using the existing
> "nvidia,tegra264-smmu" compatible string, exposes the condition via a
> new ARM_SMMU_OPT_TLBI_TWICE option bit, and adds a static-inline
> arm_smmu_cmd_needs_tlbi_twice() classifier in arm-smmu-v3.h so that
> both the in-tree CMDQ path and the iommufd VSMMU path can share a
> single predicate.
> 
> Patch 3 wires the workaround in. arm_smmu_cmdq_issue_cmdlist() becomes
> a thin wrapper that re-issues a synced cmdlist a second time when the
> first command needs doubling. The Tegra264 condition is added to
> arm_smmu_cmdq_batch_force_sync() so a full batch carrying CFGI/TLBI
> commands flushes with sync=true and is then doubled. The iommufd
> VSMMU path (arm_vsmmu_cache_invalidate()) is also taught to split the
> user-supplied batch at every "needs doubling" / "doesn't need
> doubling" transition via a new arm_vsmmu_can_batch_cmd() predicate,
> since that path can otherwise mix CFGI/TLBI with ATC_INV in a single
> submission.
> 

> The series is based on Jason Gunthorpe's "Remove SMMUv3
> struct arm_smmu_cmdq_ent" series [1], specifically commit 13428b0bf794
> ("iommu/arm-smmu-v3: Directly encode TLBI commands") which is the
> final patch of that series in linux-next.
> 
> [1] https://lore.kernel.org/all/177919957385.1012282.14787407041669291032.b4-ty@kernel.org/
> 
> Changes since v2:
> - Add new prep patch 1/3 that factors the existing force-sync
>   conditions into arm_smmu_cmdq_batch_force_sync() (from Nicolin).
> - Move arm_smmu_cmd_needs_tlbi_twice() to arm-smmu-v3.h as static
>   inline taking (smmu, cmd*) and folding in the option check.
> - Plug the Tegra264 condition into arm_smmu_cmdq_batch_force_sync()
>   instead of carrying a separate need_sync in batch_add_cmd_p().
> - Fix iommufd batching: arm_vsmmu_cache_invalidate() can mix
>   CFGI/TLBI with ATC_INV in one batch. Split at the boundary via a
>   new arm_vsmmu_can_batch_cmd() predicate.
> - Patch 2 wording: "next patch wires" -> "a subsequent change will
>   wire".
> 
> v2: https://lore.kernel.org/all/20260529140830.629738-1-amhetre@nvidia.com/
> 
> 
> Nicolin Chen (1):
>   iommu/arm-smmu-v3: Factor out CMDQ batch force-sync conditions
> 
> Ashish Mhetre (2):
>   iommu/arm-smmu-v3: Detect Tegra264 erratum
>   iommu/arm-smmu-v3: Issue CFGI/TLBI twice on Tegra264
> 
>  .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 23 ++++++-
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 66 +++++++++++++++----
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   | 40 +++++++++++
>  3 files changed, 117 insertions(+), 12 deletions(-)
> 
> 
> base-commit: 13428b0bf7947098daf9a1db14a74d33eb1b5079
> -- 
> 2.50.1
> 
> 
