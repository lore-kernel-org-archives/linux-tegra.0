Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9593BED27
	for <linux-tegra@vger.kernel.org>; Thu,  7 May 2026 09:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778145978; cv=none; b=ns2wDmKWOuMbjwAG01iw/0anXkKVkQQmmvWWEv3yZRKKEfuPiD6sxspbzfAi3mfSsNj6NKZaTudb5KSkEfh4WUhB/nA+HeQ4v/vOzicVqTMVcfemijpjaYPYcdD2b7cE4kLD/wd7Jw9xGYnhgi/Q8rhd7io6+xbKG1WIsiQEQWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778145978; c=relaxed/simple;
	bh=vYJLKQq99o9j2d0X8mxUuCgo33Tys51drYCrIkMtYFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8kNBABlQx/aSQOzzRzFmvIKfO+ImL7mhhzxiy47936fUcrZ5q1/uY6ZTXK4Jif++l/paVXHHr2YxblGwyvErHe6B/+vTUpE5JUtVM58P1AB+Cq8pHKH5vStJO8cH28x07m4SlaDPtCKtoEQp+MOhfAPaTAMqnax7+QYJNEgVGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lQuEMtKD; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lQuEMtKD"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4891ca4ce02so68425e9.1
        for <linux-tegra@vger.kernel.org>; Thu, 07 May 2026 02:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778145975; x=1778750775; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IlD/sZLAbq1YNiDypmu5ohGMtt+/3desZPPRaicZ4+Q=;
        b=lQuEMtKDe54/Zsc/KTG/oVO3k8LPwtInG6//lR85GWPpHd+CJUW1vXo+PUbAsGEvtB
         jO/TkJUsCea2hdCzq2i1A5tqAX1a1Acdb3QYYjHmzVMwHYVaZxkqETLylRntKLBPiIUJ
         jW9MoNgVBMIAYCQNCMy01k8dKsoTXvmwFgt/h6Lz+i5bCT8sQVh7yLw3sNH1ZD7uJpBy
         2++E6LkYpQ8bO8Ab4HsKlc4L2EXkwXtM2lYDlQSCB00qjhOTE2QOsLbL5h7LpwgtASTn
         9cJXAhvyQx9PrgUMQ1uBaAoRS/TiTZ9CQxkWTZ8Vxh218ig8YkCJ0Sagn6FBH/FhJosw
         vYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778145975; x=1778750775;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IlD/sZLAbq1YNiDypmu5ohGMtt+/3desZPPRaicZ4+Q=;
        b=a+/+ZdDBfsQGeg0X0ujvhM93dRl2qe3IUkGRA1xpdt9fdKlcmreJvSpi6wzgxyHOA/
         gyLLI/xHMYQFQ40lWWsNPH9CnaCJ2IHV4Rs609MZ+qRAU61K2cdfK1dP7hTKYqkK530B
         Nd+eC35jx50dEg6RG6vNwbZqohAeuif/8+7V/QvD5OSN14dmANadgkuas1IOiqvqBu6A
         o171zBr4I9MIp5mJfWyKVgbXDuvmtXWIdFCruzXztCirq2WtBUySKs5BFDZo4dOjlsj0
         zRs4YQoCfqfhVDKeyJk6/Xp7J6QC2c8igKuDP0ue2o0JndUGYp/61v1jybxLmfvF+14P
         vTRw==
X-Forwarded-Encrypted: i=1; AFNElJ9gQUX2wgwwlhlK7yA/uB6WnDNcxyPHGq18eN95x7VAUDm3H5+FJPviOcVXa0lR0swPvzrkJBBj1QOn2A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/Oj1XqkRWHA1l5BcpQ9CWJlVx+/0QaGT9ZY2sEVuYKkwHWOje
	UjSkUtGSfwOdWCV6bPsobTeFEyig73UMb7SUSbvovFovrjSB1t/xR7GVxv7wTbylAgMCxJtrxyd
	cwvLfow==
X-Gm-Gg: AeBDiesNP+Q9aTOciV1XjYi+syRv6EEOE526PH6/DamU+w0Nx16zJad4/DwnZPHO4o/
	6lW8k5JLwa+E2J4aNsR67Id5O0QciBG5t38DWnDcBosJhnlYHvsU4Mi/1USly471RrbIehPk0Dt
	KIpKiJC3T4+f1Sz/xrVCHFIHEhX+4R1nE2tydAmG2yYRvUg0caHz0Vua++RQJDrA24P7irWsA8j
	6qGpKkQMFmFcTNW2wctUBvutuChrtUFilKcAKWXuGDlIZ9VnJ4LqWaMgtwJPj2fVJfAYkOK01L8
	aKmQhv09mkP3TCVfn7ATlwUsmUcmLI4jYgSBOeJIPKn/peK7ha0caucjEhsNbee2tbFKWdWiKH2
	2/+D0qoGxVzgRtuCZkSBgHLwR0IciSQCgt0yrVmNmbplUrrvQNQumJAji2gDDxIYW6HxQvi4nFH
	fwh3VuenJX6uih4OlWpiwA3u11HIIu5PRQYT+fx74NDj3YOCAyvExw2omA7uCoD2Ef7DA+0eBUu
	H6HxHY5AerMysJW
X-Received: by 2002:a05:600c:3b88:b0:489:1adc:f017 with SMTP id 5b1f17b1804b1-48e52ef5224mr3387525e9.5.1778145975038;
        Thu, 07 May 2026 02:26:15 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53907a00sm99399225e9.12.2026.05.07.02.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 02:26:14 -0700 (PDT)
Date: Thu, 7 May 2026 09:26:10 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Samiullah Khawaja <skhawaja@google.com>
Subject: Re: [PATCH 0/9] Remove SMMUv3 struct arm_smmu_cmdq_ent
Message-ID: <afxasmHvZVl1iQgz@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>

On Fri, May 01, 2026 at 11:29:09AM -0300, Jason Gunthorpe wrote:
> [ This is part of the patch pile to move SMMUv3 over to the generic page
> table:
> 1) Introduction of new gather items and RISCV usage
>   https://patch.msgid.link/r/0-v1-54e7264d71b4+17cc3-iommu_riscv_inv_jgg@nvidia.com
> 2) Remove SMMUv3 struct arm_smmu_cmdq_ent
> 3) Organize the SMMUv3 invalidation flow so iommupt can use it
> 4) Use the generic iommu page table for SMMUv3
> 
> The whole branch is here:
>    https://github.com/jgunthorpe/linux/commits/iommu_pt_arm64/
> ]
> 
> The invalidation logic has this multi-step process where it first
> writes the command into a 32 byte struct arm_smmu_cmdq_ent, then it
> calls a function which converts it into a 16 byte HW struct, and
> sometimes it then edits the HW struct a little bit before passing it
> off to the batch or submission functions.
> 
> Instead just generate the HW struct directly by moving the FIELD_PREP
> blocks out of the big case statement and into helper functions. Call the
> right function in all the places that were building arm_smmu_cmdq_ent.
> 
> Add a type for the CMDQ entry similar to the STE/CD types that wraps the
> two u64s for clarity and use it everywhere.
> 
> This is intended to have no functional change. It makes the following
> patches work better and removes a bunch of LOC. I've run several AI tools
> with instruction to look for functional changes, which did find one subtle
> mistake in PRI response.
> 
> The removal of arm_smmu_cmdq_build_cmd() also achieves what Mostafa is
> doing in the pkvm series by making the command formation entirely header
> based with the arm_smmu_make_cmd_*() mini inlines.

I was able to rebase my pKVM series on top of this and it works fine with
just the helpers in the headers, so splitting of the build command is not
needed anymore for pKVM.

I also did test the whole series with just the upstream kernel on my
Lenovo setup.

Tested-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> This series has no dependencies. Several people have already tested this
> on various ARM systems along with the full iommupt conversion.
> 
> Jason Gunthorpe (9):
>   iommu/arm-smmu-v3: Add struct arm_smmu_cmd to represent the HW format
>     command
>   iommu/arm-smmu-v3: Use the HW arm_smmu_cmd in cmdq selection functions
>   iommu/arm-smmu-v3: Use the HW arm_smmu_cmd in cmdq submission
>     functions
>   iommu/arm-smmu-v3: Convert arm_smmu_cmdq_batch cmds to struct
>     arm_smmu_cmd
>   iommu/arm-smmu-v3: Remove CMDQ_OP_CFGI_CD_ALL from
>     arm_smmu_cmdq_build_cmd()
>   iommu/arm-smmu-v3: Directly encode simple commands
>   iommu/arm-smmu-v3: Directly encode CMDQ_OP_ATC_INV
>   iommu/arm-smmu-v3: Directly encode CMDQ_OP_SYNC
>   iommu/arm-smmu-v3: Directly encode TLBI commands
> 
>  .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     |  24 +-
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 475 +++++++-----------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   | 248 +++++----
>  .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    |  16 +-
>  4 files changed, 350 insertions(+), 413 deletions(-)
> 
> 
> base-commit: 1338d1bd1ea27bfe2cd1c4494547d409016a6644
> -- 
> 2.43.0
> 
