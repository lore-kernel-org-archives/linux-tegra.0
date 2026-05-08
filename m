Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1A536DA03
	for <linux-tegra@vger.kernel.org>; Fri,  8 May 2026 07:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778226475; cv=none; b=C9S6qgjNULWQrKIWCxoZRcPKIWi0wIz4Yb/sZxoXJLdPG+RH9WJ7Zd45dELSksNxNK4bH+tl1Ifw2x8f455pGYphVIV0FSfaZpfTj+YOvlQ9vtfpB7pCu0qime/ZOHsN7kZO3egx2IOLxHdU23BaO7DuobRep/Xt95pe2eAPzT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778226475; c=relaxed/simple;
	bh=TQkxJTwAMpIhyHALy4TZ9HpXN3wXNYKSPGmWIYgcn9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mWTPlUqnP3HSehuhN82qHDCSiwHbwINLPpyFmBJjU2gXInNS8d2eJU7oUjgM0sKPAYAzAgkMRQ5X4U053l3M6W4M0aVz68zeU7e5pCJMTYBxbcJRVa+UybKz9qhS7KiO5MeVaECeawcGuwK7swZ8DkZ6JL2RGmsGODeitownpwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iOBPq0OX; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iOBPq0OX"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2b46da8c48eso59425ad.1
        for <linux-tegra@vger.kernel.org>; Fri, 08 May 2026 00:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778226473; x=1778831273; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BBiPzLiMNb5Ft+ivB2cbnFlSBWl3wYEHINWOHyDQ95Q=;
        b=iOBPq0OXz5MtbQ0dU3gtWkfDtPG3aMAyqZcsC7qhviGj1/XCKJt9mgWAzs3Q1TnWsu
         Qr7ikZ08gKRATOC25DoM8jy3SIP3M39Cr+63OJ50/28jIpGX7eai+ybtzygsp1PF1oOM
         dWDK8wQhDb0jj9ndRu814Y+BXiSp30MNy8923PrEbesgHMxjQ0CGRlJ6RHtvm4W0cvLy
         jmzWk/ixGbl6Tco2yvd5bbD+wygYpf4Kj9xMy4Cbt6A7MF0D63YyZywLshz6xtq8vDUD
         ueErsHtcQOJmbGSQu/4QonVPCQ2kjs+1srUDMK8k+D4SS/Hg+kPPxi+JA4dfETuNoKsr
         hXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778226473; x=1778831273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBiPzLiMNb5Ft+ivB2cbnFlSBWl3wYEHINWOHyDQ95Q=;
        b=rFLgGNganu03SVaOammDpUEntHl+ZhtcoM9NW90d5A3tlsS9PWrdo3Z/dRLbyMC7gt
         sTs/q7PU23evOu0F40fJrwakuPE4LyCccWnaH8pIWL6bHIQNiqmmegF7kCFXSj1MvcCj
         7vAplo/dlahRBFOyGQW9DvxWlXOv2euajNiHYm/bKV0vWoQDGeBSgPTroK7GgnIYGrM6
         vhjZ53ER9JWyqzhN8OdE/kbtzYT+ieH4u6kdYV+Pm9PM4ATzeo3qIogxKnvmmj8ZfAJX
         D4XsrU2NvZatjS4ye6o3iPSGAHp+K2GNZSE6gNTu2n2JSQmb+2r4+PW168PXYimCKjsx
         LvFw==
X-Forwarded-Encrypted: i=1; AFNElJ9gWwEEd9OcOVElHVn9JmtxTlQi7p78kNcqIUcFjVyzYgk6hTISEwVPhZ2LaPZVMTvLIrf3ldXuB03g3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3bnKS4XKWRozM/a5azYDd8iU/ECSdBPzkZ8qV34ISllwhHFrU
	4bEwifXhZ6C9HU1EKENrufauassm+z5CLOALiDZvCqf0tZ8+ZG92eOzLfW3Jvyv3RQ==
X-Gm-Gg: Acq92OFgFZwQP7cEeZ7y1rmra91Ouzu2G8oWlP7coJ8oSFtjlwRBsUl1RNglb3q0UFY
	N3d8lA+XzZCpBvTwZbPtso/se8obO0os5gwM4MbUxHiYCO5bVOulu9dfhopslajsLRW028bzFFC
	dOa+xvkXCuCoKc3/QE/b+eo6W4CRGPArVCs/UBjTu5rOoczEsyS4+qSZkwk2IDtEKLoJxlrB/KX
	rghiPHl1yRuhjeuhmktJDbkTbrvYqTYGSyytGxeR2VjRaiRlh8FvtBeRO/0kFMVmjo+iQFs90vf
	IrrkaNFos4YGUOf92l8yxFVGpsQKX5ibm3MkcuZPXYBt7CZB5H7P0AJUEBZ39GOGPSyzMiBlgJv
	ejcyrUbDsPGFmsHvQIgC5aisiwZeubF5VXRO+VshxH+Mp38kWTlZLae1tq7DSx7TBt0+bag9xax
	dfMUoGzD026v8i8DxzcNnfKDC+YyTOX6B3NPP4DhSPf6Xxcv3BSwHW4FH3tXB7zYCYyDu/
X-Received: by 2002:a17:902:f7d2:b0:2ba:743d:259a with SMTP id d9443c01a7336-2bae9e6919emr2193705ad.16.1778226472162;
        Fri, 08 May 2026 00:47:52 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d35b3bsm10490147b3a.24.2026.05.08.00.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:47:51 -0700 (PDT)
Date: Fri, 8 May 2026 07:47:45 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 2/9] iommu/arm-smmu-v3: Use the HW arm_smmu_cmd in cmdq
 selection functions
Message-ID: <af2VIXhI0ryEbWn7@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <2-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>

On Fri, May 01, 2026 at 11:29:11AM -0300, Jason Gunthorpe wrote:
> Start removing the use of struct arm_smmu_cmdq_ent, starting at the
> lower levels of the call chain. Change the functions that determine what
> cmdq to issue the batch to into using struct arm_smmu_cmd directly.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 47 ++++++++++++-------
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  8 ++--
>  .../iommu/arm/arm-smmu-v3/tegra241-cmdqv.c    |  8 ++--
>  3 files changed, 38 insertions(+), 25 deletions(-)

[...]

>  	index = cmds->num * CMDQ_ENT_DWORDS;
> -	if (unlikely(arm_smmu_cmdq_build_cmd(&cmds->cmds[index], cmd))) {
> -		dev_warn(smmu->dev, "ignoring unknown CMDQ opcode 0x%x\n",
> -			 cmd->opcode);
> -		return;
> -	}
> -
> +	memcpy(&cmds->cmds[index], cmd.data, sizeof(cmd.data));
>  	cmds->num++;
>  }

The memcpy is a temporary step and goes way in Patch 4.

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan
