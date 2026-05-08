Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5FC332917
	for <linux-tegra@vger.kernel.org>; Fri,  8 May 2026 14:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778249043; cv=none; b=t8XdOQycJvjtM1tYZ90QQWqFvzR8KyCwwi5G3oj7peqJ/IzF6W7cBib5Lq2OVv/bjJJV5rlte86gpmY+jCoto52rM3rH0pw0kibfIH2FRENIi5qa5q5hTBd9cC6hUl9CD3QOYtbjB/EvWjqZ+f+lpmWEdCJ4U2tqlKCJKt3fGYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778249043; c=relaxed/simple;
	bh=zRCXLtmf6B0Fx0w1OYUY0vGdVNOOAYbhxzHWj5UHbJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=latWlhVGDmGGClJ9i8SL6pivPMDlq/DYxN1ugv9qnu1PLjQO4OSvEuQ0LW8L6I31m5rhzy6UUof+80tPvUyA6jszwYtdSpC+5WEbDdL0T9hAkREoHZrrt8QHi8gp0zsgTZEGIe4tFm41mqbUUTBfCcDcNyE/6InHPoPsBfTILvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ih9zNxHo; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ih9zNxHo"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ba180a022dso88375ad.1
        for <linux-tegra@vger.kernel.org>; Fri, 08 May 2026 07:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778249041; x=1778853841; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jV748N849RYQi6RggjQ0XmU2FvPCrHd7ojXmcuhGvG8=;
        b=Ih9zNxHonnQIWnTKIInGW09VI3CfvZ2wPRh/Jh9T1NHNmzC4VKYTIs2sqsrEAnAXTZ
         JUH4q++2iZ+hLr70z694qGeEOaoEvk2GIBJOCwKiNCg8v8Z3+0ctdSjtaSYCkE3IOBTV
         4zEKfCZf8D8MLUL6WkkW07P8pASn6Ix3YXQkLdEpWYw+Z18FIEOOozxQtSGsVVhEaoNT
         dFxDBEiS2JRMFi4e8e6jYmlmrFsW0srCYvyISOHedkh4j+KlOeM35lmYUzCnMxCRET2u
         TNj2Ry2acaTKEobVvjx3/pdLXRW3YvyRoPhKG7QatuRxVV/bCXTU6yjIUWhoa4YThD2+
         xKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778249041; x=1778853841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jV748N849RYQi6RggjQ0XmU2FvPCrHd7ojXmcuhGvG8=;
        b=F6kYxvxBnELwb943vUQdMcSYAENl8R6R65a+AhtGz2IjeQDrvSX85xYOx806gIfNNO
         HmHnve79emvjVS1HoFuYvUk42E21xHYuie+WVU6XujfYNAziU/2ivPz69ZQ8rtSfCUio
         +NCyxG6NRrlTpVxWdlcWvYxdQeJ9tX945zpoBD16RHzo65xvsn/A+bzHc3MN92AEMSP0
         w3Urlr8ketYlH3D4vnp/QY8+BofLCrPXSDUDreRv4907A/vvv+CxN39aoMYEF768SWry
         z8XhIqpVwoYIhUQCXZ80SGUZOWxOfkNUK5y8wasamRAOyqFJzAJglH68TLhvmkNvdkeA
         ladw==
X-Forwarded-Encrypted: i=1; AFNElJ9i/C73FDkhfOTqSNtNLBDXxnYgdX71VgBEGiXt/GxKVXZeLPa9UA/ZNgkVNRVj+h/1F/FxXOggGA2irg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRfhyCCnvYQmSg4pPHvDpVz/lmDL682FHgLtOh6qZ7Yi905a46
	D1JFB/BiYcffXvsj3VoldUfwNorjmb4aQNneaW+vDFGJ+vl5lR9vGs5lYnf9xk+tIA==
X-Gm-Gg: Acq92OGjBBxGqe8ghIvakv6961fvJrhzXmmjUAq9ilVnGIU++rYr1Iiqob1h7WFJ0JJ
	5o9ptdfH0JRkLUvimI3DpULkkYFjhH3Q6feVwfwyRXC1tloTFQe5QLXULZjfPfLKYmBpKCXIeBD
	hJdj2Kn5ddCeHfflh4R6ZZNM97y5n7hGDqwIjCI8ek9u0y3W4UJrXwsgsms/92ufPuAb0cpQi+T
	dAdqiSmJ6n3FTLtCd+tDwy6OTldwqlw2nXjQdQPotFqHAxS8ZFzgSZkiGsb0SH3zBjIvU+345HD
	hR0w5jC9ym/+yqoAceBgvHh9MRkpcTcSvGvyEhP5qOlCYcaaotxNlIoq0UScC0ILDsRwQiqhPqz
	T6OvCVB6WHXizaHbtR69UKg89PrpKB24scMC7kv2txOdipK7lP96LtJMfYB4dPND2eVeD6AKz0U
	/RhUGfX/xuAg1tGAJDHgG4CBYlYqYU1GXvClmvAI/nHyRx9BDuWIrI28VvX0X6wOIEwxU+
X-Received: by 2002:a17:903:1b66:b0:2a7:6c4e:5914 with SMTP id d9443c01a7336-2bae9ab0221mr3993415ad.6.1778249040522;
        Fri, 08 May 2026 07:04:00 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367bed0ad05sm18255a91.12.2026.05.08.07.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 07:03:59 -0700 (PDT)
Date: Fri, 8 May 2026 14:03:52 +0000
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
Subject: Re: [PATCH 0/9] Remove SMMUv3 struct arm_smmu_cmdq_ent
Message-ID: <af3tSOYMS-X43B4N@google.com>
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
> 
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

I was able to test this with 7.1-rc3 on an Arm server with the 
iova_stress test [1]. For the series:

Tested-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

[1] https://github.com/soleen/iova_stress
